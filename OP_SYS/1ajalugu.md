# Operatsioonisüsteemide ajalugu ja arhitektuur

---

## 1. Operatsioonisüsteemide võrdlus: MS-DOS vs. Linux

### MS-DOS
* Mõeldud ainult ühe kasutaja jaoks.
* Puudub üldine ennetav multitegumtöö (tavaliselt töötab korraga üks esiplaanil olev ülesanne).
* Operatsioonisüsteem eraldab mälu, kuid puudub riistvaraline mälukaitse.
* Puuduvad failide kasutajapõhised omanikud ja ligipääsuõigused (FAT12/FAT16 failisüsteem).

### Linux
* Toetab mitme kasutaja samaaegset tööd.
* Operatsioonisüsteem jagab protsessori (CPU) aega töötavate protsesside vahel.
* Protsessidel on eraldatud virtuaalsed aadressiruumid ja riistvaraline mälukaitse.
* Failisüsteemis (nt ext4) on määratud omanik, rühm ja ligipääsuõigused; tuum kontrollib rangelt ligipääsu.

---

## 2. Varajane arvutustehnika ajalugu

### Charles Babbage (1820–1840. aastad)
* **Diferentsiaalmasin:** luua mehaaniline seade arvutustabelite automaatseks koostamiseks.
* **Analüütiline masin:** kontseptsioon, mis sisaldas mälu, arvutusosa ja programmiga juhitavat tööd.
* Programmi ja arvutusmasina eristamise idee oli olemas juba enne elektroonika ajastut.

### Konrad Zuse
* Eesmärk: luua mehaaniline/elektromehaaniline masin, kus programm juhib töötavat seadet.
* **Z1 (1938):** mehaaniline kahendsüsteemis (*binary*) arvuti, mis oli piiratud töökindlusega.
* **Z3 (1941):** elektromehaanilistel releedel põhinev arvuti, mis toetas automaatset arvutust ja ujukomaarvusid.
* Programm loeti sisse perforeeritud lintidelt või perfokaartidelt.

### ENIAC (1946)
* Esimene elektrooniline üldotstarbeline arvuti.
* Elektronlambid asendasid aeglasemaid elektromehaanilisi lüliteid.
* Algne programmeerimine nõudis füüsiliste kaablite ühendamist ja lülitite manuaalset seadmist.

---

## 3. Perfokaardid ja mällu salvestatud programm

### Perfokaardid
* Olemasolev andmetöötlustehnika kohandati arvutite jaoks.
* Aukude muster kaardil kodeeris andmeid või programmi teksti.
* Kaardipaki sai ette valmistada arvutist eraldi (võrguväliselt/offline).

### Mällu salvestatud programm (1940. aastate lõpp – 1950. aastate algus)
* Arvuti loeb käske otse mälust ja täidab neid järjestikku.
* Uue programmi saab laadida ilma arvutusosa ümber juhtmestamata.
* Kuna programmid vajavad korduvaid toiminguid (laadimine, sisend/väljund ehk I/O), koondatakse need funktsioonid ühisesse süsteemitarkvarasse.
* Tekib võimalus automatiseerida programmide käivitamist ja täitmist.

---

## 4. Pakktöötlus ja esimesed monitorid

### GM-NAA I/O (1956)
* Esimene primitiivne I/O-süsteem / operatsioonisüsteemi eelkäija.
* Operaator kogub programmid ja andmed kokku nn tööde paketiks (*batch processing*).
* Monitor-programm käivitab ühe töö ning liigub selle lõpetamisel automaatselt järgmise juurde.
* Ühised I/O-rutiinid vähendavad korduvat koodi kirjutamist ja tööd.

---

## 5. Kõrgema taseme keeled ja multiprogrammeerimine

### FORTRAN (1957)
* Arvutuskäiku saab kirjeldada matemaatiliste valemite ja kõrgema taseme käskudega.
* Kompilaator teisendab lähtekoodi automaatselt masinkoodiks.
* Programmeerija ei pea igat masinakäsku käsitsi kirjutama.
* Töö käivitamine ja ressursihaldus jäävad operatsioonisüsteemi ülesandeks.

### Multiprogrammeerimine ja protsesside haldus
* Eesmärk on kasutada ära protsessori ooteaega: kui programm A ootab sisend-väljundi lõppu, annab OS CPU sel ajal programmile B.
* Operatsioonisüsteem peab mälus hoidma ja eristama mitme programmi olekut.
* Jooksvad programmid paiknevad koos mälus ning OS-i tuum (*kernel*) haldab protsesse ja nende ressursse.

---

## 6. Terminalid, UNIX ja C-keel

### Terminalid
* Klaviatuur saatis märgid ühenduse kaudu keskarvutisse (*mainframe*).
* Väljund ilmus paberile või kasutaja ekraanile.
* Tegelik programm töötas ja teostas arvutusi keskarvutis.

### UNIX ja C-keel
* **1969:** Ken Thompson alustas UNIX-i arendamist.
* **1973:** Dennis Ritchie arendas C-keele; UNIX kirjutati suures osas C-keeles ümber.
* Kõrgema taseme lähtekood lihtsustas süsteemi arendamist ja selle portimist eri riistvaraplatvormidele.
* Riistvaraspetsiifiline kood jäi vajalikuks vaid süsteemi madalatasemelises põhiosas.

### UNIX-i mõjukuse põhjused
* Protsesside ja failide ühtne, selge hierarhiline keskkond.
* Käsukest (*shell*) töötab tavalise kasutajaprogrammina, mitte OS-i staatilise osana.
* Väikseid, spetsialiseeritud tööriistu saab konveieritega (*pipe*) kokku liita võimsateks ahelateks.
* Lähtekood jõudis litsentside alusel ülikoolidesse ja uurimisasutustesse, tekitades kiire laienemise.

### UNIX-i peamised harud
* BSD (Berkeley Software Distribution)
* System V
* SunOS / Solaris

---

## 7. Mikroprotsessorid ja personaalarvutid

### CP/M (1974)
* Gary Kildalli loodud operatsioonisüsteem 8-bitistele mikroarvutitele.
* Korraldas failide, ketta ja programmide kasutamist piiratud ressurssidega seadmetes.

### QDOS / 86-DOS / MS-DOS
* Tim Paterson lõi 1980. aastal QDOS-i (*Quick and Dirty Operating System*), hilisema nimega 86-DOS.
* Microsoft hankis süsteemi õigused ja arendas sellest IBM PC jaoks MS-DOS-i, millest sai personaalarvutite ajastu üks populaarsemaid operatsioonisüsteeme.
