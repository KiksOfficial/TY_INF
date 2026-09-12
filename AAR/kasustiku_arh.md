infot kirjutatakse n bittide kaupa

mälu on sonade kogum (1. sona, 2. sona ... n. sona) = n bitti

igal malupesal kindel address
tavaliselt on nendeks arvud 0 ... 2**k -1 (k = bittide hulk, mis kulub addressi salvestamiseks)

kymnendsys {
  k = 10**3 = 1_000
  M = 10**6 = 1_000_000
  G = 10**9 = 1_000_000_000
  T = 10**12 = 1_000_000_000_000
}
kahe astmed {
  Ki = 2**10 = 1024
  Mi = 2**20 = 1_048_576
  Gi = 2**30 = 1073741824
  Ti = 2**40 = 1099511627776
}

# Mälu aadressimine ja sõna pikkus: 32-bitine vs 64-bitine arhitektuur

---

## Mälumudeli võrdlus

Masinasõna (Word) on loomulik andmeühik, mida konkreetse protsessori (CPU) arhitektuur korraga käitleb, töötleb ja mälust loeb/kirjutab.

Pildil on kujutatud mälu struktuuri erinevused **32-bitise** ja **64-bitise** arhitektuuri puhul.

---

### 1. 32-bitine arhitektuur (vasakul)

* **Sõna pikkus (Word Size):** 32 bitti = **4 baiti**
* **Aadressi samm:** Iga uus sõna/rida algab iga 4 baidi järel
  * Aadressid: `0, 4, 8, 12, 16, ...`
* **Sõna jagunemine:**
  * Üks 32-bitine sõna koosneb **4-st 8-bitisest baidist** (jaotatud 4 sektoris).
* **Mälu limiit:** $2^{32}$ baiti ≈ **4 GB** adresseeritavat mäluruumi.

---

### 2. 64-bitine arhitektuur (paremal)

* **Sõna pikkus (Word Size):** 64 bitti = **8 baiti**
* **Aadressi samm:** Iga uus sõna/rida algab iga 8 baidi järel
  * Aadressid: `0, 8, 16, 32, 64, ...`
* **Sõna jagunemine:**
  * Üks 64-bitine sõna koosneb **8-st 8-bitisest baidist** (jaotatud 8 sektoris).
* **Mälu limiit:** $2^{64}$ baiti ≈ **16 eksabaiti (EB)** adresseeritavat mäluruumi.

---

## Peamised erinevused ja kokkuvõte

| Omadus | 32-bitine arhitektuur | 64-bitine arhitektuur |
| :--- | :--- | :--- |
| **Sõna suurus** | 4 baiti (32 bitti) | 8 baiti (64 bitti) |
| **Aadressi samm** | 4 baidi kaupa (`0, 4, 8, 12...`) | 8 baidi kaupa (`0, 8, 16, 32...`) |
| **Andmete läbilaskevõime** | Väiksem registrimahutavus | Korraga töödeldatakse 2x rohkem andmeid |

big-endian = vaiksema aadressiga malupesad sisaldavad arvu *korgemaid* baite
little-endian = vaiksema aadressiga malupesad sisaldavad arvu *madalamaod* baite

Sõnade paiknemine
• Kaks võimalust
– aligned adresses
ja
– unaligned adresses
• Esimesel juhul algavad sõnad kohtadel, mis on sõna baitide arvu kordsed, teisel
juhul mitte
• Numbrid võtavad enda alla tavaliselt ühe sõna, nende poole pöördumiseks
kasutatakse sõna aadressi
• Tähed – pöördumisel kasutame baidi aadressi
• Tekst – viidatakse algustähe aadressile ja lõpp tähistatakse
spetsiaalse sümboliga
End-of-string
– Alternatiiviks on teksti pikkuse näitamine spetsiaalses registris
Mälu operatsioonid
• Programmi käsud tuleb tuua mälust protsessorisse

Mälu operatsioonid
Programmi käsud tuleb mälust CPU-sse tuua -> sama tehakse andmete ja parameetritega -> vastus salvestatakse CPU mällu ->
LOAD, READ, FETCH ytleme, mis aadressil paikneb meid huvitav mälu ning loeme sellelt aadressilt info CPU-sse -> STORE, WRITE ytleme, millisele mälupesasse tahame need andmed kirjutada ja kirjutame viidatud aadressiga mälupesasse 

Arvuti ylesanded
andmete liigutamine CPU registrite ja mälu vahel 
aritmeetilised operatsioonid 
prgrammi kaskude juhtimine
sisend/valjund operatioonid 

Register transfer notation
R0 <-[malupesa_1]
R0 <-[M1]
R1 <-[DATAIN]
R4 <- [R0] + [R2]

ASM 
LOAD R0,M1 sama mis R0 <-[M1]
ADD R4,R0,R2

RISC ja CISC kasustikud

RISC {
  koik kasud koos argumentidega mahuvad 1 sonasse
  kasutatakse load/store arh
  N: Altera Nios II, ARM (pole puhas RISC)
  
  kasutatakse lihtsaid ja lyhikesi kaske
Load,R3,LOC1
Add R3,R2,R0
Store R0,LOC1

Koik kasud peavad olema 1 sona sees (sona = 4 v 8 byte)

  Kasutatakse Load/Store arh, st maluga suheldakse aind load/store kaskudega
Add LOC1, R0 ple lubatud

}

CiSC {
  Kasud pikemad kui 1 sona
  argumendid voivad olla malupesades
  N: Coldfire

}

pohilised kasutyybid

Load destination(cpu registor), source (mem_location)
Add destination, source1, source 2
Store source (CPU register), destination (mem_location)

Käsud ja nende jarjestus

Sirgjooneline

Programmiloendur (PC) viitab kasule aadressil i
jargmine kask on 1 astme vorra kaugemal
Sirgjoonelise jarjestuse korral peame iga kasu taitmise ajal suurendama PC 1 astme vorra

(i) Load R1,A
(i+4) Load R2,B

(i+8) Add R3,R2,R1
(i+12) Store R3,C

(A) Andmed A
(B) Andmed B
(C) Vastus C

Sirjooneline lahendus progemise jaoks vaga efektiivne ple sst votaks kaua aega

# Assambleerkeele tsükkel: Massiivi elementide liitmine

Pildil on kujutatud mälumuutujate ja registrite kasutamine, et liita kokku massiivi elemendid (`Arv 1` kuni `Arv n`) ning salvestada tulemus muutujasse `SUM`.

---

## 1. Initsialiseerimine (ettevalmistus enne tsüklit)

* **`Load R2, COUNT`** – Laeb korduste arvu (elementide koguarvu $n$) registrisse **R2** (*loendur*).
* **`Move R3, #j`** – Laeb massiivi algusaadressi $j$ registrisse **R3** (*mäluosuti / pointer*).
* **`Clear R1`** – Nullib registri **R1** (*siia kogutakse summa vahetulemus*).

---

## 2. Tsükli keha (`LOOP`)

* **`Load R4, (R3)`** – Laeb mäluaadressilt **R3** hetke elemendi registrisse **R4** (*kaudne adresseerimine*).
* **`Add R1, R1, R4`** – Liidab leitud arvu senisele summale (`R1 = R1 + R4`).
* **`Add R3, R3, #4`** – Nihutab mäluaadressi **4 baidi võrra edasi** (et osutada järgmisele 32-bitisele elemendile $j+4$).
* **`Subtract R2, R2, #1`** – Vähendab loendurit **R2** ühe võrra (`R2 = R2 - 1`).

---

## 3. Tingimuslik hargnemine ja lõpetamine

* **`Branch_if_[R2] > 0`** – Kontrollib, kas loendur **R2** on suurem kui 0:
  * **Jah:** Hüppab tagasi sildi `LOOP` juurde.
  * **Ei:** Kõik arvud on liidetud, liigub järgmisele käsule.
* **`Store R1, SUM`** – Kirjutab lõpliku summa registrist **R1** mäluaadressile `SUM`.

---

## Olulised tähelepanekud

1. **Mälu samm on 4 baiti:** Aadressid suurenevad sammuga $+4$ (`i, i+4, i+8...` ja `j, j+4...`), sest tegemist on 32-bitise arhitektuuriga (1 sõna = 4 baiti).
2. **Adresseerimisviisid:**
   * `#j` või `#4` – **Vahetu adresseerimine** (*immediate addressing*, väärtus on otse käsus).
   * `(R3)` – **Kaudne registreeriaddresseerimine** (*register indirect addressing*, register sisaldab mäluaadressi).

# Adresseerimisviisid RISC protsessorites

---

## Võrdlustabel

| Ingliskeelne nimi | Assembler süntaks | Aadressi kujunemine |
| :--- | :--- | :--- |
| **Immediate** | `#väärtus` | $\text{operand} = \text{väärtus}$ |
| **Register** | $R_i$ | $EA = R_i$ |
| **Absolute** | $\text{LOC}$ | $EA = \text{LOC}$ |
| **Register indirect** | $(R_i)$ | $EA = [R_i]$ |
| **Index** | $X(R_i)$ | $EA = [R_i] + X$ |
| **Base with index** | $(R_i, R_j)$ | $EA = [R_i] + [R_j]$ |

---

## Mõisted ja tähistused

* **$EA$ (Effective Address):** Efektiivne aadress (tegelik mäluaadress, kust andmeid loetakse või kuhu kirjutatakse).
* **$X$:** Indeksi väärtus (konstantne nihe / offset).
* **$[R_i]$:** Registris $R_i$ sisalduv väärtus.

Muutujate kirjeldamine

registri mood -operandiks on cpu registri sisu, kasus antakse registri aadress (nimi)
abs (otsene) mood -operandiks on malupesa sisu, kasus antakse selle aadress
N:
int arv1,arv2; C - keeles taisarvulised muutujad, neile vastavad konkreetsed malupesad/registrid, millele saab moodis viidata
Kasus Load R5,LOC on esimene operand esitatud registri moodis, teine aga aabs moodis
esimese operand vaartuseks registri R5 sisu, teise operandi vaartuseks malupesa LOC sisu

Konstantide kirjeldamine
immediate mode -operandi vaartus antakse kasus endas
N: kasus Move R5,#500, esimese operandi vaartus registri R5 sisu, teine operandi vaartus 500

N: arv1 = arv2 + 8

Load R1, arv2
Add R1, R1,#8
Store R1,arv1

suunamine ja pointerid argumentidele
kaudne mood - operandi efektiivne aadress antakse registri adressile kus operand kirjas on
Load R1, B,
Load R2,(R1)
Store R,A
sama, mis int *pR1 = &R1

register, kus effective aadress kirjas = pointer

