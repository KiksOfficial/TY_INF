Protsessor Basic processing unit

Protsessor käivitab masinkoodi käske ja koordineerib arvuti teiste üksuste
tööd
• Instruction Set Processor (ISP) või lihtsalt processor
• Tavapäraselt kutsutakse protsessorit ka Central Processing Unit (CPU)
• Suure jõudlusega tänapäevastes protsessorites täidetakse käske paralleelselt
• Variant üks – käsud aetakse torusse (pipeline)
– Järgneva käsu täitmist alustatakse veel enne kui eelmine käsk on täidetud
• Alternatiivne variant – superskalaarne arvuti
– Mitu käsku tuuakse korraga protsessorisse ja täidetakse üheaegselt

Programmi kaivitamisel loetakse kasud 1 haaval protsessori registrisse ja seejarel tehakse seda, mida kask kasib
Käsud on enamasti mälus yksteise järel - v.a harnemisel v hyppe korral
Protsessor peab meeles kus malus asub hargmine kask (PC) peale kasu sisselugemist uuendatakse programmiloendurit
Käsuregister (Instruction Register) - käsku saab kodeerida 

CPU = {
  Registri fail (andmeregister, aadressiregister, juhtregister ja lipud, PC ja SP)
  ALU
  (käsu aadressi generaator PC)
  Käsuregister
  Juhtimine
  Protsessori mäluliides (Aadressisiin, andmesiin, juhtimissiin, mälukontroller)
  
}

Käsu laadimise faas {
IR <- [[PC]]
PC <- [PC] + 4 
}
Käsu täitmise faas {
Loe mälust ja salvesta registrisse, loe registrist, tee arritmeetika v loogika tehe, salvesta registrisse, salvesta mällu

}

Igas CPU sees tehtavas operatsioonis teevad seda loogikaahelad

register -> loogikaahel -> register -> loogikaahel...

Load R1, X(R2) {
  R1 = dest
  R2 = src
  X = nihe
  loeb mälust käsuinfo ja suurendab programmiloenduri väärtust 1 astme vorra
  
  Dekodeerri kask ja loe R2 sisu
  Arvuta efektiivne aadress X + [R2]
  loe mälust aadressilt X+[R2] lähteargumendi väärtus
  Salvesta registrisse R1
  
}

Add R1,R2,R3 {
  loe mälust käsuinfo ja suurenda PC vaartus 1 astme vorra
  dekodeeri kask ja loe registrite R2 ja R3 sisu
  (alles nyyd teame, millega tegu)
  arvuta summa [R2] + [R3]
  OOTA ÄRA TEE MIDAGI OOTA LOAD'i
  salvesta see registrisse R1
  
}

Add R1,R2,#10_000 {
  loe mälust käsuinfo ja suurenda PC 1 astme vorra
  dekodeeri kask ja loe R2 sisu
  arvuta summa [R2] + 10_000
  OOta ara tee midagi
  salvesta registrisse R1
}

Store R1, X(R2) {
  loe mälust registrisse kasuinfo ja suurenda PC 1 astme vorra
  dekodeeri ja loe registtrite R1 ja R2 sisu
  arvuta efektiivne aadres X + [R2]
  salvesta mällu aadressile X+[R2] lähteargumendi vaartus
  Oota ara tee midagi 
}

Viieastmeline tegevuste jarjekord
loe malust kasuinfo ja suuprenda PC
dekodeeri kask ja loe registri(te) sisu
arvuta mida tarvis
loe malust v salvesta mallu kui tarvis
salvesta malu tulemus registrisse kui vajalik

registri fail 2 lugemiskohaga

<img width="1349" height="638" alt="Screenshot 2026-10-02 at 15 07 06" src="https://github.com/user-attachments/assets/fc9d8b27-e737-4fd6-b15f-74c56f742170" />


# Registri fail, kahe lugemiskohaga

Slaidil on esitatud kahe lugemiskohaga registrifaili loogiline skeem kahes erinevas esituses (üldine plokk-skeem vasakul ja detailsem lahtikirjutus paremal).

## Skeemi peamised komponendid ja signaalid

* **Registri fail (C):** Keskne plokk, mis hoiab andmeid ja võimaldab neile ligipääsu.
* **Aadress A ja Aadress B:** Kaks sõltumatut lugemisaadressi sisendit. Need määravad, millistest registritest andmed loetakse. Kuna tegemist on *kahe lugemiskohaga* registrifailiga, saab korraga lugeda andmeid kahest erinevast registrist (näiteks aritmeetika-loogikaploki ALU kahte sisendisse).
* **Aadress C:** Kirjutamisaadressi sisend, mis määrab registri, kuhu uued andmed salvestatakse.
* **Sisendandmed:** Andmevoog, mis tuuakse registrifaili sisse (tavaliselt mälust või ALU arvutuse tulemusena), et see määratud registrisse (`Aadress C`) salvestada.
* **Väljundandmed (A ja B):** Registritest loetud väärtused, mis suunatakse väljunditesse (Aadressi A ja Aadressi B kaudu loetud andmed).

## Kuidas skeem töötab?

1. **Lugemine (Read):** Protsessor seab liinidele `Aadress A` ja `Aadress B` soovitud registrite numbrid. Registrifail väljastab nende registrite sisu koheselt väljunditesse `Väljundandmed A` ja `Väljundandmed B`.
2. **Kirjutamine (Write):** Kui on vaja tulemus salvestada, antakse `Aadress C` kaudu sihtregistri number ning `Sisendandmed` liini kaudu kirjutatakse väärtus vastavasse registrisse.

<img width="1398" height="837" alt="Screenshot 2026-10-02 at 15 04 45" src="https://github.com/user-attachments/assets/a528ab6e-f53c-42bf-a65d-59872fb313f8" />

NB! RA jouab ALU-sse RB ei pruugi
NB2! TEGU ON LOAD KASUGA

# Protsessori andmetee ja juhtimissüsteemi tahvlijoonis (03.10.2025 loeng)

Sellel tahvlijoonisel on kujutatud lihtsustatud ühe- või mitmetsüklilise protsessori (CPU) andmetee (datapath) ja juhtplokk koos kõigi peamiste funktsionaalsete komponentide ning signaalivoogudega.

---

## 1. Peamised komponendid ja nende rollid

### A. Juhtimine ja käsuregister
* **Käsuregister (Instruction Register):** Hoiab mälust loetud käsku. Käsk jaguneb osadeks:
  * **Registrite aadressid (5 biti, 5 biti, 5 biti / 5 5 5):** Määratlevad lähte- ja sihtregistrid registrifailis.
* **Otsustaja / Juhtseade (Control Unit / Otsustaja):** Dekodeerib käsuregistri sisendi ning genereerib juhtsignaalid (Valik 1, Valik 2 jne) muunduritele (multipleksoritele) ja ALU-le.
* **Juhtimine (Control Lines):** Punased liinid joonisel, mis edastavad juhtsignaale üle kogu protsessori.

### B. Registrid ja registrifail
* **Registri fail (Register File):** Sisaldab protsessori üldotstarbelisi registreid.
  * **Aadress A ja Aadress B:** Sisendid loetavate registrite valimiseks.
  * **Aadress C:** Sisend kirjutatava (siht-)registri valimiseks.
* **RA (Register A) ja RB (Register B):** Vaheregistrid registrifailist loetud väärtuste ajutiseks hoidmiseks.
* **RM:** Mälu andmeregister (Memory Data Register / Read Memory), mis hoiab mälust loetud andmeid.
* **Ajutine R / RY / RZ:** Täiendavad vaheregistrid (nt ALU tulemuse `RZ` või mälust pärit andmete `RY` hoidmiseks enne registrifaili kirjutamist).

### C. Aritmeetika-loogikaplokk (ALU) ja muundurid
* **ALU (Arithmetic Logic Unit):** Teostab aritmeetilisi ja loogilisi operatsioone vastavalt sisendkäsule (`Käsk K`).
* **Multipleksorid (Mux):** Valikulised lülitid andmevoogude suunamiseks:
  * **MuxC:** Valib registrifaili kirjutatava aadressi või andmeallika.
  * **MuxB:** Valib ALU teise sisendi (kas registrist `RB`, konstandi/nihte või muu allika).
  * **MuxY / MuxPC / MuxInc:** Suunavad andmeid vastavalt sellele, kas tegemist on mälupöörduse, koodihüppe või järgmise käsu aadressi arvutamisega.

### D. Programmilohend (PC) ja mäluliides
* **PC (Program Counter):** Hoiab järgmise täidetava käsu aadressi.
* **Liitja (Adder) ja MuxInc:** Arvutavad järgmise käsu aadressi (nt `PC + 4` või hüppeaadressi).
* **Mälu liides (Memory Interface):** Süsteemi ühenduslüli välise mäluga (RAM/vahemälu):
  * **Aadressi liin:** Edastab mäluaadressi (pärineb kas PC-st või ALU/rekistri arvutustest).
  * **Andmete liin:** Edastab loetavaid või kirjutatavaid andmeid.

---

## 2. Töötlemise sammud (Sammud tahvli vasakus servas)

Tahvlil on vasakus servas rohelisega markeeritud protsessori täitmise sammud:

1. **Samm 1 (Käsu toomine / Fetch):** Käsk loetakse mälust `PC` aadressi järgi ja salvestatakse **Käsuregistrisse**.
2. **Samm 2 (Dekodeerimine / Decode):** Käsk dekodeeritakse `Otsustaja` poolt, vajalikud registrid loetakse registrifailist vaheregistritesse `RA` ja `RB`.
3. **Samm 3 (Täitmine / Execute):** **ALU** teostab vajaliku arvutuse `RA` ja `MuxB` kaudu saadud väärtuste põhjal. Tulemus läheb registrisse `RZ`.
4. **Samm 4 (Mälupöördus / Kirjutamine - Memory / Writeback):** Vajadusel loetakse/kirjutatakse andmed **Mäluliidese** kaudu või salvestatakse tulemus läbi `MuxY` tagasi **Registrifaili** (`Aadress C`).

---

## 3. Andmevoogude kokkuvõte

* **Punased liinid:** Juhtsignaalid (Control Signals), mis juhivad multipleksoreid, ALU-d ja registrite kirjutamist.
* **Sinised/Mustad liinid:** Tegelikud andme- ja aadressisiinid (Data & Address Busses).

Käskude kodeerimine

nt. 5 bitti 1 registri kirjeldamiseks
|Rscr1(31-27)|Rsrc2(26-22)|Rdst(21-17)|OP-kood(16-0)
Registrites kogu lähteinfo

|Rscr(31-27)|Rdst(26-22)|immediate operand(21-6)|OP-kood(16-0)
1 arg otse käsust

Käsu laadimine ja käivitamine

Add R1,R2,R3

|00010|00011|00001|xxxxx|

1. mälu aadress <=[PC], Loe malust, IR<=Mälu andmed, PC<=[PC]+4
2. dekodeeri kask, RA<=[R2], RB<=[R3]
3. Arvuta summa RZ<=[RA]+[RB]
4. RY<=[RZ]
5. salvesta registrisse R1<=[RY]

KORRAGA SAAB DEKODEERIDA KASKU JA LUGEDA REGISTRITE SISU

Load R1,X(R2)

1. Mälu aadress<=[PC], Loe mälust, Oota MFC,
IR<=Mälu andmed, PC<=[PC]+4,
2. Dekodeeri käsk, RA<=[R2]
3. Arvuta aadress RZ<=[RA]+X
4. Mälu aadress<=[RZ], Loe mälust, oota MFC RY<=Mälu andmed
5. Salvesta registrisse R1<=[RY]

/5 naitab et tuleb 5 bitti

registri fail -> buffer registrid -> (RB yhendatud multiplexeriga (MUXB)(vali b) MUX valib kas vaartus tleb b-st v mujalt) -> ALU -> Buffer register RZ -> 
Buffer RY -> 

PC -> (vali mem) MUXmem -> mäluliides
V ^
liitja -> 

Mäluliides [aadressid | andmed] -> tulemus kirjutatakse käsuregistrisse [0..31] -> (aadress a, aadress b)
                                                    juhtimisplokk  V
                                                          (vali c)MUXC -> registrifail 
Kui teine liidetav ontsene vaartus ss  |Otsene| <- Käsuregister (kuni 16 v 26 bitti viimased 4/6 bitti taidame ette(mingid 4 bitti lahevad ette, seda otsustab juhtsignaal)) -> MUXB 


Branch offset

Rsrc|Rdst|Immediate Operand|OP-Kood|

1. Mälu aadres <= [PC], Loe mälust, IR<=Mälu andmed, PC <=[PC]+4
2. Dekooderi käsk
3. Arvuta aadress PC <= [PC]+ Hargnemise nihe
4. Oota
5. Oota

Branch_if_[R1]=[R2]
1.
2. dekodeeri käsk RA<=[R1], RB<=[R2]
3. Vordle [RA] ja [RB] kui vordsed ss arvuta aadres PC = [PC] + hargnemise nihe
4. Oota
5. Oota

XGY = x2 * not y2 + not (xor x2 y2) + * (x1 * not y1 + not (xor x1 y1) * x0 * not yo)
XEY = not (xor x2 y2) * not (xor x1 y1) not (xor x3 y3)  
XLY = not XEY * not XGY

Käskude kodeerimine 

Käsu laadimine ja kaivitamine |Immediate value(31-6)| OP-Kood(5-0)|

Call R1
1. Mälu aadress <=[PC], Loe malust, IR<= malu andmed, PC<=[PC]+4
2. Dekodeeri kask, RA<=[R1]
3. Ajutine PC <=[PC], Arvuta aadress PC<=[RA]
4. RY<=[Ajutine PC]
5. RegisterLINK<=[RY]

Juhtsignaalide genereerimine

LubaIR = T1 * MFC
LubaPC = T1 * MFC + T3 * (BR + Call + IRQ)
ValiB = Otsene 
KirjutaREG = T5 * (ALU + Load + Call)

Programmide kaivitamiseks peab CPU suutma genereerida juhtsignaale {Hardwired, Microprogrammed}
Juhtsignaalide vajaduse maaravad { Sammuloenduri sisu, Käsuregistri sisu, Arvutuste tulemused, mis seisus malu on}
