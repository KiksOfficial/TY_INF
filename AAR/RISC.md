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


