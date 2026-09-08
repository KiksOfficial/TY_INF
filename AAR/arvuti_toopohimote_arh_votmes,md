# Arvutiarhitektuuri ja toimimise konspekt

**Arvuti** – kiire elektrooniline arvutusmasin, mis töötleb digitaalset infot.

---

## 1. Funktsionaalne jaotus
Arvuti riistvara koosneb järgmistest põhikomponentidest:
* **Sisend ja väljund (I/O):** Seadmed info vastuvõtmiseks ja väljastamiseks.
* **Mälu (Memory):** Andmete ja programmide säilitamiseks.
* **Keskprotsessor (CPU):**
  * **Juhtseade (Control Unit):** Koordineerib kõiki arvutisiseseid tegevusi.
  * **Aritmeetika-loogikaüksus (ALU):** Teostab matemaatilisi ja loogilisi tehteid.
* **Ühendusvõrk (Buses/Interconnect):** Siinid ja ühendused komponentide vaheliseks andmevahetuseks.

---

## 2. Informatsioon arvutis

### Käsud ja andmed
* **Käsud (Instructions):** Mälus salvestatud juhised, mis juhivad info liikumist ja töötlemist. CPU kutsub käsud mälust järjest välja.
* **Andmed (Data):** Arvud, numbrid, kodeeritud tähed jm, mis toimivad käskude sisendparameetritena.
* **Bitid:** Loogikaahelal on 2 võimalikku olekut: `0` (väljas) ja `1` (sees).

### Andmetüübid ja esitus mälus
* **Int (Täisarv):** `4 baiti` (32 bitti).
* **Char (Märk):** `1 bait` (8 bitti, tegelikult tehakse 7 bitiga ASCII standardis).
  * *Näide:* `A` = `(0)100 0001` (kümnendsüsteemis 65).
* **Float (Komaarv - IEEE standard):** 
  * 32 bitti jagatakse kolmeks osaks:
    1. **Märk (1 bit):** Positiivne (`0`) või negatiivne (`1`).
    2. **Astendaja / Exponent (8 bitti):** Määrab arvu suurusjärgu ($2^{128 - E'}$ nihkega esitus).
    3. **Mantiss / Mantissa (23 bitti):** Määrab arvu täpsuse.
  * Terve arv / väärtus esitatakse valemiga: $\text{väärtus} = (\text{märk}) \times \text{mantiss} \times 2^{128 - E'}$.

---

## 3. Mäluarhitektuur
Mälu kasutatakse andmete ja programmide säilitamiseks.

* **Põhimälu (Primary memory / RAM):**
  * Õige koha leidmiseks kasutatakse **adresseerimist**.
  * Opereeritakse grupi kaupa ($n$ bitte saab lugeda/kirjutada 1 käsuga).
  * **Random Access Memory (RAM):** Mälu pöördumisaeg on sama sõltumata andmete asukohast mälus.
  * **Mäluhierarhia:** Vahemälu (L-cache: L1, L2, L3 – ülikiire, väike) $\rightarrow$ Põhimälu (RAM – suurem, aeglasem).
* **Sekundaarne ladustamine (Secondary Storage):** Püsiv salvestusruum (SSD, HDD, DVD jne).

---

## 4. Koodi tasemed ja arhitektuurid (CISC vs RISC)

### Andmetöötluse näited assemlerkoodis

#### ASM (RISC - nt MIPS, ARM)
Käsud on lihtsad ja eraldatud. Mälust laadimine ja arvutamine toimuvad eraldi käskudega:
```assembly
LOAD  R2, LOC       ; Mälust loetakse andmed aadressilt LOC registrisse R2
ADD   R3, R2, R1    ; Tehakse tehe registrites: R3 = R2 + R1
STORE R3, LOL       ; Laetakse tulemus registrist R3 mällu aadressile LOL

sama, mis ylemine 

ADD   LOC, R1, LOC  ; Liidab R1 väärtuse otse mäluaadressile LOC

swap(int v[], int k) {
    int temp;
    temp = v[k];
    v[k] = v[k+1];
    v[k+1] = temp;
}

swap:
    multi $2, $5, 4    ; $2 = k * 4 (arvutatakse binaarne nihe baitides, kuna int = 4B)
    add   $2, $4, $2   ; $2 = v + (k * 4) (arvutatakse elementi v[k] aadress)
    lw    $15, 0($2)   ; Loetakse v[k] mälust registrisse $15 (temp)
    lw    $16, 4($2)   ; Loetakse v[k+1] mälust registrisse $16
    sw    $16, 0($2)   ; Kirjutatakse v[k+1] väärtus kohale v[k]
    sw    $15, 4($2)   ; Kirjutatakse temp ($15) kohale v[k+1]
    jr    $31          ; Tagasipöördumine funktsioonist

## 5. Arvuti üldine töötsükkel ja CPU tööpõhimõte

### Arvuti töö üldmõte
1. Arvuti võtab sisendseadmetelt vastu infot andmete ja programmide kujul.
2. Salvestab selle mälus.
3. Info tuuakse mälust aritmeetika-loogikaseadmesse (vastavalt täidetavale programmile).
4. Andmeid töödeldakse ALUs.
5. Töödeldud info saadetakse väljundseadmesse.
6. Kõiki arvutisiseseid tegevusi koordineerib **juhtimisüksus**.

### Protsessori (CPU) siseehitus
CPU sisaldab järgmisi komponente ja registreid:
* **Aritmeetika-loogikaseade (ALU):** Teostab tehteid.
* **Juhtseade (Control Unit):** Juhib signaale ja käske.
* **Programmiloendur (PC - Program Counter):** Hoidakse aadressi, kus on järgmine käsk programmi koodis.
* **Käsuregister (IR - Instruction Register):** Hoidakse parajasti täidetavat käsku ennast.
* **Mälu aadressiregister (MAR):** Hoidakse mäluaadressi, kuhu pöördutakse.
* **Mälu andmeregister (MDR / MBR):** Hoidakse mälust loetud või mällu kirjutatavaid andmeid.

### Mälust lugemine ja käsu-tsükkel (Fetch-Execute Cycle)
Kuidas infot mälust käsuregistrisse loetakse ja käske täidetakse:

1. **Sammutamine / Võtmine (Fetch):**
   * Programmiloendurist (**PC**) loetakse järgmise käsu aadress Mälu Aadressiregistrisse (**MAR**).
   * Mälust loetakse sellel aadressil asuv info Mälu Andmeregistrisse (**MDR**) ja sealt kopeeritakse see **Käsuregistrisse (IR)**.
   * Samal ajal suurendatakse **Programmiloenduri (PC)** väärtust, et see näitaks järgmise käsu aadressile.
2. **Dekodeerimine (Decode):**
   * Juhtseade analüüsib käsuregistris (**IR**) olevat käsku ning teeb kindlaks, milliseid operatsioone ja registreid on vaja teostada.
3. **Täitmine (Execute):**
   * ALU teostab vajaliku tehte. Kui on vaja täiendavaid andmeid mälust lugeda või tulemus mällu salvestada, saadetakse aadress uuesti mälupessa ning andmed liiguvad läbi MAR/MDR registrite.

---

## 6. Arvuti jõudlus

Arvuti jõudlust mõõdetakse ajaga, mis kulub spetsiifilise programmi täitmiseks protsessoril.

### Jõudluse valem (CPU täitmisaeg)
$$\text{CPU aeg} = \text{IC} \times \text{CPI} \times \tau$$

Sama valem taktisageduse $f$ kaudu (kus $f = \frac{1}{\tau}$):

$$\text{CPU aeg} = \frac{\text{IC} \times \text{CPI}}{f}$$

* **IC (Instruction Count):** Käskude arv programmis (sõltub koodist, algoritmidest ja kompileerijast).
* **CPI (Cycles Per Instruction):** Mitu kella-takti kulub keskmiselt ühe käsu täitmiseks (sõltub protsessori arhitektuurist, nt RISC vs CISC).
* **Taktisagedus ($f$):** Protsessori kella sagedus hertsides (nt $4.0 \text{ GHz} = 4.0 \times 10^9 \text{ takti/sekundis}$).
* **$\tau$ (Taktisageduse periood):** Ühe kella-takti kestus sekundites.

### Jõudluse optimeerimine
1. **Vähendada käskude arvu (IC):** Optimeeritud algoritmid ja efektiivsemad kompileerijad.
2. **Vähendada takte käsu kohta (CPI):** Konveiertöötlus (*pipelining*) ja rööptöötlus (käskude üheaegne täitmine).
3. **Suurendada taktisagedust ($f$):** Kiirem protsessori kellakiirus.
