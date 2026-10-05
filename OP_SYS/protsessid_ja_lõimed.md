Protsessid ja loimed

N1:

sort {

  Kest kaivitab programmi sort,
  tootamiseks on vaja CPU aega, malu ja failidele ligipaasu
  Samal ajal voivad tootada teised programmid ja kasutajad,
  OS peab eristama taitmisi, jagama ressursse ja kontrollima ligipaasu

}

Programm - kaivitatav kood failis
Protsess - 1 programmi taitmise eksemplar
Lõim on protsessi osa, mis jooksutb koodi (protsess on nagu konteiner)
Molemalt kaivitusel on oma PID ja taitmise olek

Sama programmifail ei tahenda sama protsessi. PID on protsessi identifikaator

PC naitab, kus kood praegu on
SP - naitab kui suur nihe on praeguse aadressi ja stack aadressi vahe (kus parajasti kaadris asume)
iga lõime jaoks on oma stack


Protsess yhendab ressursid ja taitmise
Protsess maarab taitmiskeskkonna (ressursid)
Loim liigub programmi kaskude kaudu edasi

Protsessi alla kuuluvad {
  Virtuaalne aadressiruum (kood, andmed, kuhi, pinud)

  identiteet ja ressursid (PID, oigused, avatud failid)

  esialgu alati aind 1 thread, millel on kasuloendur (PC) + registrid ning oma pinu
  }

Protsessi virtuaalse malu mottekaart {

Programmikood | globaalsed ja staatilised andmed | kuhi (heap), kuhu saab allokeerida dynaamilised objektid | Muud vastendused ja vaba ruum | Pinu (stack)

Aadressid on protsessi vaates virtuaalsed
Sama aadress eri protsessides ei tahista sama fyysilist malu
Fyysiline RAM ei ole selline jarjestatud riba

Malu regioonide kasvusuunad:
Stack (pinu) kasvab ylalt alla (suurematelt aadressidelt vaiksemate poole)
Heap (kuhi) kasvab alt yles (vaiksematelt aadressidelt suuremate poole)

Funktsiooni kutsudes lisatakse pinu kaader (stack frame)
Kui func teeb return, eemaldatakse kaader stackist
Vanu baite ei kirjutata eemaldamisel nullidega yle

}

Kui func returnib, siis selle kohalikud muutujad kustutatakse malust (muutuvad kehtetuks)

Stack pohiroll - funktsioonikutsete olek
Stack eluiga - kutse lopp eemaldab kaadri
Stack haldamine - kutse/tagastus ja kaituskeskkond

heap pohiroll - hallata dynaamilisi objekte
heap eluiga - kuni vabastamiseni (nt free/delete)
heap haldamine - malloc(), free(), calloc()...

pointer kohalikule muutujale ei muuda selle eluiga pikemaks
hallatud keeltes teeb heap maluhaldust garbage collector (prugikoristus)
Kogu protsessi loppedes vabastab OS selle aadressiruumi

Thread - 1 protsess, yhine aadressiruum ja avatud failid, globaalsed andmed ja kuhi {
  Loim A: oma PC, registrid, stack
  Loim B: oma PC, registrid, stack
}
threadid saavad samade andmetega tootada, kuid peavad ligipaasu kordineerima

OS otsustab kes ja millal kasutab CPU-d

PC - Program Counter (kasuloendur, x86-64 puhul 'rip')
Program counter - osuti, mis naitab, kus kood parajasti on (masinkasu aadress, MITTE koodi reanumber)
1 rida C koodi voib vastata 0, 1 voi mitmele masinkasule

SP = Stack Pointer / pinuviit (x86-64 puhul 'rsp', naitab kus stacki tipus asume)
RBP = Base Pointer (raami/pinu baasviit x86-64 arhitektuuril)

Registrid - ei istu malus, vaid on protsessori sees (liitmise/tehete toovaartused)
Protsessori registrid ja rutiinid soltuvad arhitektuurist
Muutujal ei pruugi olla oma registrit ja optimeeritud koodis voib vaartus olla silurile kattesaamatu

Lõime jätkamiseks säilitatakse PC, SP ja registriolek

PCB - Process control block - selle sees on {
  PID, vanemprotsess, protsessi hetkeseisund
  Taitmise kontekst aka SP ja PC, registrid
  Prioriteet, CPU kasutus, jarjekordade seosed
  Aadressiruumi ja malukaardistuse info voi viited
  Avatud failid, kasutaja ja ligipaasuoigused
  Kasutatud ressursid, ajad ja piirangud
}

PCB seob protsessi oleku ja ressursid kerneli jaoks 1ks tervikuks

TCB - thread control block - kirjeldab 1 loime taitmist {
TID, oma olek ja ajastamine
PC, registrid, SP, pinu info
}

PCB yhised protsessiressursid multithread mudelis {
  Identiteet, aadressiruum, avatud failid ja oigused
}

KONTEKSTIVAHETUS EI KOPEERI KOGU MALU TCB-SSE EGA PCB-SSE

Linuxis iga ajastatava ylesande/loime jaoks oma 'task_struct'
Linuxi mottes yhendatakse mitu loime gruppideks (Thread Group / TGID)
Kasutaja vaates:
TID = eristab loime
PID (voi TGID) = eristab loimeruhma ehk protsessi
Sama protsessi loimed jagavad structe: mm_struct (aadressiruum), files_struct (failid), fs_struct (kaust), cred (oigused)

Protsessi viis olekut opikumudelis

Loomisel (New) -> (valmis) Ready -> (CPU-le) Running -> (ootab syndmust) Waiting -> (syndmus saabub) Ready -> (Tootab) Running -> (lopp) Terminated

Valmis (Ready): vajab CPU aega
Ootab (Waiting): Vajab koigepealt syndmust/IO-d

NB: aeg voib labi ka saada (time slice), siis Running state laheb sujuvalt uuesti Ready state'iks

Linuxis {

  R - Running / Runnable (Linuxis on valmis JA tootav MOLEMAD tahistatud R-tahega)

  Ootus
  S - signaaliga katkestatav ootus (Interruptible sleep)
  D - katkestamatu ootus (Uninterruptible sleep, sageli I/O)

  Peatatud
  T - signaaliga peatatud
  t - siluriga/debuggeriga peatatud

  Muud
  X - surnud (dead, harva nahtav)
  I - joude kerneliloim (idle)
  Z - zombie (lopetanud, aga peaprogramm pole tulemust wait()-iga koristanud)

}

Zombie {
  Elav laps teeb midagi -> (exit) Z (laps on too lopetanud, aga vanem pole tema lopuinfo katsunud) -> (wait) reaped (ehk vanem koristab lopuinfo)
}

Zombi enam kaske ei taida.
Signaal ei arata zombit ellu EGA tapa seda (sest see on juba surnud).
Koik lopetamised ei jata nahtavat zombit.
Kui vanemprotsess sureb enne lapsprotsessi, saab orvuks jaanud laps uue vanema (nt init/systemd).

Kontekstivahetus ja kernelisse sisenemine

Kontekstivahetus {
  A taitmise olek (PC, SP, registrid) salvestatakse,
  Ajastaja valib ja kaivitab B,
  B kontekst taastatakse, B jatkab
}

Systeemikutse (Syscall) {
  Loim palub kernelilt teenust,
  Taitmine liigub kasutajareziimist (user mode) kernelireziimi (kernel mode),
  Sama loim voib parast teenust kohe edasi tootada
}

Iga syscall EI pohjusta loimevahetust. Kontekstivahetus EI kopeeri kogu protsessi malu.

Konkurentsus ja paralleelsus

1s loogilises CPUs on mitu loime -> taitmine vaheldub ajas
Ylesanded edenevad labisegi

Mitu loogilist CPUd + mitu runnable loime -> mitu loime saavad tootada korraga
Voimalik tegelik samaaegne taitmine

Konkurentsus - mitme ylesande edenemine kattuva ajavahemiku jooksul
Paralleelsus - too tegelik samaaegne taitmine eri CPU-del
Rohkem loimi ei taga automaatselt suuremat kiirust

Protsessi jalgimine ja olekud (ps, top, htop):

ps kask (nt ps -eo pid,ppid,stat,pcpu,rss,comm):
PID / PPID = protsessi ja vanemprotsessi ID
RSS = residentne malu (kui palju on pariselt RAM-is KiB)
%CPU = keskmine CPU kasutus protsessi eluea jooksul
STAT = olekukood lisatahistega

STAT tahiste lugemine:
Suur S/R/T/Z = Pohiolek
s = seansi juht (session leader)
l voi 1 = mitmeloimeline protsess (multi-threaded)

* = terminali esiplaani ruhmas (foreground)



top / htop:
Kuvavad protsesside kaitumist ajas pidevalt uuenevalt
RES / RSS naitab RAM-i kasutust
'q' klahv valjub vaatest, protsess itse tootab edasi

Protsessi malu ja avatud objektid
Aadressiruum ja RAM (random access memory)

Virtuaalne aadressiruum - kood, teegid, stack, heap
OS-i vastendatud lehekyljed - osa neist parajasti RAM-is

Failideskriptor (FD) viitab kerneli hallatavale objektile
FD naited {
  1: stdin?
  2: stdout?
  3: Avatud andmefail
  4: Toru lugemisots
  5: Toru kirjutamisots
  6: Vorgusokkel
}
deskriptori kaudu saab rakendada lugemist/kirjutamist

Faili avamine (open) ei lae automaatselt kogu faili protsessi mallu

lsof - saad naha, mida su protsess napib (koik avatud objektid ja deskriptorid)
lsof valjundi reziimid FD loppus: r = lugemine, w = kirjutamine, u = molemad
FD tyybid: cwd (tookaust), REG (tavafail), DIR (kaust), FIFO/pipe (toru), IPv4/TCP (vorgusokkel)

-#######################################################
######################################################

Vanem ja laps moodustavad protsesside puu

igal lapsel parent id (PPID)
igal lapsel oma id (PID)
Protsess oib ise uusi lapsi luua
sugulussuhe ei tahenda yhte kuhja ehk PID

fork() = 1 kutse 2 taitmist

pid_t = pid = fork()

if (pid < 0) {
perror("fork");
} else if (pid ==0){
//laps
} else {//parent}

exec() - uus program samas protsessis
exec-pere asendab protsessi programmi ja aadressiruumi sisu
PID jaab samaks uut last sellega ei looda
edukas kutse ei naase vana Programmikoodi
failideskriptoreid saab uude prograami kaasa anda

EHK fork(): uus protsess exec(): uus programm olemasolevas protsessis

Kuidas kest välise käsu kaivitab {
  Kest -> fork laps: uus PID -> exec: nt. ls -> loppolek(wait)->esiplaan ootab töö lõppu
    V                                              |
    Vanem: kest jätkab ----------------------------|

  Kest interpreteerib käsu ja tekitab protsessi
}

Lõppemine, zombie ja orvuks jaamine

protsess lopetab ise v lopetava signaali tulemusel
wait/waitpid annab vanemale lapse loppoleku
(wait ootab koiki lapsi, waitpid ootab kindlat last)

zombie - laps on loppenud a loppolek veel vastu votmata
orb - vanem on loppenud laps saab linuxis uue vanema

Vanema surm ei lopeta yldjuhul automaatselt koiki lapsi, zombi ei taida enam progrrammi
vanema surma ouhul saab laps uue vanema

Lõppkood ple standardvaljund

standarvaljund kannab programmi toodetuid andmeid
loppkood kirjeldab käsu loppemist: tavaliselt 0 on edu
bashis annab $? viimase kasu loppstaatuse
jargmine kask voib selle vaartuse asendada

Signaal annab protsessile syndmusest teada

SIGINT (Ctrl C) - lopetab - kasutaja katkestus
SIGTERM - lopetab - palve lopetada; saab kasitleda
SIGKILL - lopetab - sunnitud lopp; ei saa pyyda ega eirata
SIGTSTP - peatab - terminalist peatamine; saab kasitleda
SIGSTOP (Ctrl Z) - peatab - sunnitud peatus, ei saa pyyda ega eirata
SIGCONT (pmst fg/bg)- jatkab - lubab peatatud taitmisel jatkuda

kill saadab signaali; saadetud signaal ei pea preotsessi lopetama

Ctrl-C SIGINT
Ctrl-Z SIGTSTP

Signaali saab terminali esiplaani protsessiryhm
????

Kesta töö ple alati 1 protsess

cat ... | sort | uniq

jobs: selle kesta hallatavad tood
Too number ja PID on erinevad identifikaatorid
Toode juhtimise korral seob kest toru protsessiryhmaks

Ampersand (&) kaivitab too taustal
sleep 300 &

taustal olemine ei tahenda vaiksemat prioriteeti
$! - viimase taustal jooksutatud kasu PID
$? - viimase jooksutatud kasu tagastuskood
taustatöö voib endiselt terminali kirjutada

nohup ja & lahendavad eri ylesandeid
nohup - kaivitab kasu nii et SIGHUP on eiratud
& kest ei oota too loppu esiplaanil
ymbersuunamised eemaldavad soltuvuse terminali sisendist ja valjundist
See ei taga ellujaamist taaskaivituse ega teenushalduri lopetamispoliitika korral

Taustal kaivitamine yksi ei luba et too jaab valjalogimisel ellu

bg on sama mis kohe alguses command loppu & lisamine

+ märk tähistab jooksvat taustatööd ja - märk eelmist.

Nii fg- kui bg-käsule saab parameetriks anda taustaprotsessi järjekorranumbri kujul %n.
kill saadab SIGTERM
nohup kaivitamisel protsess tootab ka ss kui kasutaja valja loginud

Iga protsessi käivitumisel on tema jaoks automaatselt avatud kolm failipidet: 0 – standardsisend, 1 – standardväljund, 2 – veaväljund. Seetõttu võib standardväljundi ümbersuunamiseks kasutada ka 1> ja standardsisendi ümbersuunamiseks 0<.

Kui soovida veaväljundit suunata samasse, kuhu läheb standardväljund, siis võlusõna on 2>&1
