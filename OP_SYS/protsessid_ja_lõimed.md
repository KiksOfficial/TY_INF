Protsessid ja lõimed

N1:

sort {

  Kest kaivitab programmi sort,
  tootamiseks on vaja cpu aega, mälu ja failidele ligipaasu
  Samal ajal voivad tootada teised programmid ja kasutajad,
  OS peab eristama taitmisi, jagama ressursse ja kontrollime ligipaasu

}

Programm - kaivitatav kood failis
Protsess . 1 programmi taitmise eksemplar
molemal kaivitusel on oma PID ja taitmise olek

Sama programmifail ei tahenda sama protsessi. PID on protsessi identifikaator

Protsess yhendab ressursid ja taitmise

Protsessi alla kuuluvad {
  Virtuaalse aadressiruum, kood, andmed ,kuhi?, pinu (stack)
  
  identiteet ja ressursid, PID, oigused, avatud failid

  esialgu alati aind 1 thread, millel on on käsuloend ja registrid ning oma pinu
}

Protsessi virtuaalse mälu mõttekaart {

  Programmikood | globaalsed ja staatilised andmed | kuhi? (heap?), kuhu saab allokeerida dynaamilised objektid | Muud vastendused? ja vaba ruum | Pinus/stack

Mälu regioon kasvab ylevalt alla
Stack kasvab yle, heap kasvab alla
Kui func teeb return ss element eemaldatakse stackist

}

kui func returnib, ss muutujad kustutatakse malust

Stack pohiroll - func kutsete olek
Stack eluiga - func eluiga
Stack haldamine - kutse/tagastus ja kaituskeskkond

heap pohiroll - hallata dynaamilisi objekte
heap eluiga - kuni free(ptr) ja ptr = NULL
heap haldamine - malloc(), free(), calloc()...

pointer kohalikule muutujale ei muuda selle eluiga pikemaks
hallatud keeltes teeb heap mäluhaldur garbage collector
Kogu protsessi loppedes vabastab OS selle aadressiruumi 

Thread - 1 protsess, yhine aadressiruum ja avatud failid, globaalsed andmed ja heap {
Lõim A, oma PC, registrid, stack

Lõim B, oma PC, registrid, stack
}
threadid saavad samade andmetega tootada, kuid peavad ligipaasu kordineerima

OS otsustab kes ja millal kasutad CPU-d

PC - Program COunter
Program counter - osuti, mis naitab, kus kood prgu on (masinkasu aadress)
1 rida C koodi voib vastata 0,1 voi mitmele masinkasule

SP = Stack Pointer (naitab, kus stackis asume)

Registrid - ei istu mälus, vaid on protsessori sees

Protsessori registrid ja rutiinid soltuvad arhitektuurist 

PCB - Process control block - selle sees on {
  PID, vanem protsess, protsessi hetkeseisund
  Taitmise kontekst aka SP ja PC, registrid,
  Prioriteet (madal/korga) CPU kasutus
  aadressiruumi ja malukaardistuse info v viited
  avatud failid, kasutaja ja ligipaasuoigused
  kasutatud ressursid ja ajapiirangud
}

PCB seob protsessi oleku ja ressursid kerneli jaoks 1ks tervikuks

TCB - thread control block

selles on {
  PC, SP, oma olek ja ajastamine, TID, registrid, stack info
}

PCB yhisedd protsessiressursid {
  identiteet, aadressiruum, avatud failid ja oigused
}

KONTEKSTIVAHETUS EI KOPEERI KOGU MALU TCB-SSE EGA PCB-SSE

Linuxis iga ajastatava ylesande jaoks task_struct
linux mottes yhendatakse mitu loime grupppideks

Protsessi viis olekut opikumudelis

Loomisel New ->(valmis) Ready -> (CPU-le) Running -> (ootab syndmust) Waiting ->(syndmus saabub) Ready ->(Tõõtab) Running ->(lõpp) Terminated

Valmis: vajab CPU aega
Ootab: Vajab koigepealt syndmust


NB: aeg voib labi ka saada ss Running state laheb Ready stateks

Linuxis {

  R - Running
  
  Ootus
  S - signaaliga katkestatav ootus
  D - katkestamatu ootus, sageli I/O

  Peatatud
  T - signaaliga peatatud
  t - siluriga peatatud

  X - surnud

  I - jõude kernelilõim
  Z - zombie (peaprogramm ei korja vasyava thread tulemust ja see ei jooksuta end enam)

}

Zombie {
  elav laps teeb midagi -> (exit) Z(laps on ammu töö lopetanud a vanem ei kaivita teda) ->(wait) reaped (aka koristatud)
}

Signaal ei arata zombit ellu. Koiik lopetamised ei jata nahtavat zombit

Kontekstivahtus ja kernelisse sisenemine

Kontekstivahetus {
  A taitmise olek salvestatakse,
  Ajastaja valib ja kaivitab B,
  B konteks taastatakse, B jatkab,
}

Systeemikutse {
  Loim palub kernelilt teenust,
  taitmine liigub kasutajareziimist kernelireziimi,
  sana loim voib parast teenust kohe jatkata
  
}

Iga syscall ei pohjusta loimevahetust. Kontekstivahetus ei kopeeri kogu protsessi mälu

Konkurentsus ja paralleelsus

1s loogilises CPUs on miitu loime, taitmine vaheldub ajas
Ylesanded edenevad labisegi

Mitu loogilist CPUd mitu runnable loinme - mitu loime saavad tootada korraga
Voimalik tegelik samaaegne taitmine

Konkurentsus - mitme ylesande edenemine kattuva ajavahemiku jooksul
paralleelsus - too tegelik samaaegne taitmine eri CPU-del
Rohkem loimi ei taga automaatselt suuremat kiirust

Suur S on olek. vaike l ja vaike s on lisatahised

Protsessi malu ja avatud objektid
Aadressiruum ja RAM (randon access memory)

Virtuaalne aadressiruum - kood, teegid, stack, heap
OS-i vastendatud lehekyljed osa neist parajasti RAM-is

faili deskriptor viitab kerneli hallatavale objektile
failideskriptor = {
  FD viidatud obje
  3 Avatud andmefail
  4 Toru lugemisots
  5 Toru kirjutamisots
  6 Võrgusokkel
}
deskriptori sees saab rakendada lugemist/kirjutamist

Faili avamine ei lae automaatselt kogu faili protsessi mallu

lsof - saad naha, mida su protsess näpib
