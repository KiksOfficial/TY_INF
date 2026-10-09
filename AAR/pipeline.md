konveier e toru - voimalus teha operatsioone samaaegselt

Arvutit saab kiiremaks teha {
  Kasuta kiiremaid ahelaid mälu ja protsessori tegemiseks
  tee operatsioone samaaegselt
}

sisend-valjund operatsioonid ja arvutused protsessoris
Analoogia tehase konveieriga

Vahetulemus hoitakse puhvrites

Vahemälu tähtsus {
  iga etapp taidetakse ara 1 takti jooksul
  erinevates ettappide taitmisele kuluv aeg on erinev
  kui mone etapiga saadakse kiiremini yhele poole, on seade ylejaanud aja ootereziimis
  Seega on toru efektiivne ligikaudu ühepikkuste etappide korral
}

Toru ei tee yksiku kasu taitmis kiiremaks, kyll aga suureneb kaskude taitmise arv ajayhikus
Tulemus “üks käsk iga sammu ajal” on teoreetiliseks
ülempiiriks, praktikas alati väiksem käskude arv ajaühikus

Data hazards (andmeriskid)

Kahe järjestikuse käsu puhul, mida torus täidetakse, pole
esimese käsu tulemus veel kättesaadav enne järgmise
käsu alustamist

N1:
A = 5 + B => 5 + 3 = 8
C = 6 + A => 6 + 2 = 8

A=2
B=3
C=4

Esimene voimalus - Kui teises kasus on esimese kasu tulemust vaja ss teine kask ootab
Teine voimalus - Argumendi edastamine (operand forwarding) {
  Kahe järjestikuse käsu puhul, mida torus täidetakse, pole
  esimese käsu tulemus veel kättesaadav enne järgmise
  käsu alustamist
  
  Siiski on tulemus enne registrisse kirjutamist ALU väljundis olemas
  Kui korraldame nende andmete kiirema edastamise, saame seisakut lühendada
}

Alternatiiv - kompilaator tegeleb sellega

Mäluga suhtlemine

Vahemälu tähtsus

Kriitiline operatsioon on mälust lugemine:
– Põhimälust lugemine on tavaliselt ca 10 korda aegavõtvam kui
protsessorisisesed operatsioonid
– Protsessoriga samal kiibil paiknev vahemälu suudab töötada
enamvähem sama kiirusega kui protsessor ise

EHK MEMORY ACCESS DELAY

sama probleem voib tekkida mälust käsku lugedes

Hargnemise viivitus (branch delay)

Hargnemiskäsu dekodeerimise faasi lõpuks on
hargnemisaadress meil juba teada

 Korraldame protsessori töö nii, et saaksime kohe alustada
juba hargnemise sihtmärgi-käsu sisselugemist

 Vajalik lisariistvara – üks summaator dekodeerimise faasi
lisaks
  – Lähenemine analoogiline registrist kahe väärtuse lugemisele iga
  käsu puhul

Tootab aind ss kui kindel hargnemine
Tingimuslikul hargnemisel tuleb ennustada

Hargnemise ajatamine (delay branch)

Ajatuspesa (Branch delay slot) – aadress, mis asub vahetult hargnemiskäsu järel

Neid võib olla rohkem kui üks

Hargnemisele järgnevad käsud loetakse alati protsessorisse
– kuna sel hetkel veel ei ole veel teada, et hargnemine aset leiab

Nende täitmine ei põhjusta protsessorile täiendavat ajakulu
– sest sel ajal nagunii midagi muud teha ei saa

Siit idee: panna ajatuspesadesse sellised käsud, mida ka tegelikult
täita tuleb

Tingimuslik hargnemine

Siin sõltub hargnemine või mitte-hargnemine tingimuslippude väärtusest, mida me ei pruugi enne teiste käskude täitmise lõpetamist teada

Variant, et üritame tulemust ennustada

Lihtsaim variant: eeldame, et hargnemist ei toimu

Variant, et otsustame hargnemise märgi järgi
  – Ettepoole siirded toimuvad sagedamine
  – Tahapoole siirded toimuvad harvemini

Variant, et lisame käsule hargnemise vaikimisi-otsuse. Selleks
vaja ühte lisabitti.

Dünaamiline voog - kaskiude jada mis reaalselt täitmisele tuleb

Hargnemise tulemuse ennustamine - 1 bitt hargnemise info salvestamist = 1000x cycle kohta 2 valeotsust
2 biti puhul - esimesel korral 2 viga a teisel korral 1 viga


Branch target buffer

Hargnemiskasu aadress
1-2 bitti hargenemise ennustamise jaoks
hargnemise aadress

Resource limitations

Nt. kaskude ja andmette yhine vahemalu - Kui nii fetch kui ka memory samm soovivad samaaegselt temaga suhelda

jõudlusvorrand = (N * S) / F 

N - masinkoodi kaskude arv
F - taktsagedus
S - ühe masinkoodi käsu täitmiseks vajalik (keskmiselt) sammude arv.

Käskude läbilaskevõime (instruction throughput) järjestikuse käsutäitmise
korral

Ps = F/S + delta 
delta = riskidest pohjustatud viivitused
Riskid on omavahel sõltumatud

vastus yldiselt esitatakse yhikuga MIPS (Millions of interactions per second)

Hypoteetiline olukord {
  Load kasud 25%
  Andmeseosed 40% (1 takt)

  delta stall = 0.25 * 0.4 * 1 = 0.1 sammu

  1GHz/(1+0.1 + delta2...+deltan)

  N2:
  Hargnemine 20%
  oigesti ennustamine 90%
  karistus - 1 takt

  deltabranch = 0.2 *(1-0.9) * 1 = 0.02

  N3:
  Load-Store 25+5 = 30%
  Karistused 10 takti
  Möödalasu % = kasud 5%, andmed 10%
  deltamiss = 0.05 * 10 (käsud ise) + 0.1 * 0.3 * 10 (andmed) = 0.8
}

