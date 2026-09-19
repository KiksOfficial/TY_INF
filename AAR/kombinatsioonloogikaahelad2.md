**Kolmeväärtuseline puhver (Tri-state buffer)**

* Töö põhimõte:
  * Kui lubatussisend $e = 1$, siis väljund $f = x$ (signaal läheb läbi)[cite: 5]
  * Kui lubatussisend $e = 0$, siis on väljund **kõrge takistusega olekus** ($f = \text{Z}$) ehk ahel on katkestatud (lahti ühendatud)[cite: 5]

| x | e | f |
| :-: | :-: | :-: |
| 0 | 0 | **Z** |
| 1 | 0 | **Z** |
| 0 | 1 | **0** |
| 1 | 1 | **1** |

**Multiplekser (MUX)**

* Multiplekser suunab juhtsisendite ($W_1, W_2$) alusel ühe mitmest andmesisendist ($L_1, L_2, L_3, L_4$) väljundisse $f$[cite: 5].

| $W_1$ | $W_2$ | $f$ |
| :-: | :-: | :-: |
| **0** | **0** | $L_1$ |
| **0** | **1** | $L_2$ |
| **1** | **0** | $L_3$ |
| **1** | **1** | $L_4$ |

* Loogikavõrrand: $f = \bar{W}_1 \bar{W}_2 L_1 + \bar{W}_1 W_2 L_2 + W_1 \bar{W}_2 L_3 + W_1 W_2 L_4$

**Dekoodrid (Decoder)**

* Dekooder teisendab $n$ sisendbitiga koodi üheks $2^n$ aktiivseks väljundliiniks (antud skeemil 2 sisendit $\rightarrow$ 4 väljundit)[cite: 5].

| $L_1$ | $L_2$ | Väljund |
| :-: | :-: | :-: |
| **0** | **0** | **0** |
| **0** | **1** | **1** |
| **1** | **0** | **2** |
| **1** | **1** | **3** |

* Väljundite loogikavõrrandid:
  * $\text{Väljund 0} = \bar{L}_1 \cdot \bar{L}_2$[cite: 5]
  * $\text{Väljund 1} = \bar{L}_1 \cdot L_2$[cite: 5]
  * $\text{Väljund 2} = L_1 \cdot \bar{L}_2$[cite: 5]
  * $\text{Väljund 3} = L_1 \cdot L_2$[cite: 5]

**7-segmendilise indikaatori dekooder**

* **Eesmärk:** Teisendab 4-bitise binaarkoodi ($L_1, L_2, L_3, L_4$) signaalideks ($a, b, c, d, e, f, g$), mis panevad põlema 7-segmendilise ekraani vastavad segmendid (näiteks numbrite 0–9 kuvamiseks).
* **Tööpõhimõte:** Iga indikaatori segment ($a \dots g$) omab eraldi loogikaahelat, mis otsustab sisendkoodi põhjal, kas antud kriips (segment) peab põlema või mitte[cite: 6].

**Prioriteedi kooder (Priority Encoder)**

* **Tööpõhimõte:** Muudab mitmest sisendsignaalist parajasti aktiivseima (kõrgeima prioriteediga) sisendi binaarkoodiks[cite: 7].
* Tähis `x` tõeväärtustabelis tähendab *"don't care"* (suva) – selle sisendi väärtus (0 või 1) ei mõjuta väljundit, kui kõrgema prioriteediga sisend on aktiivne[cite: 7].

| $W_1$ | $W_2$ | $W_3$ | $W_4$ | $f_1$ | $f_2$ |
| :-: | :-: | :-: | :-: | :-: | :-: |
| **1** | x | x | x | **0** | **0** |
| **0** | **1** | x | x | **0** | **1** |
| **0** | **0** | **1** | x | **1** | **0** |
| **0** | **0** | **0** | **1** | **1** | **1** |

Programmeeritavad loogikaseadmed (PLD)


**Programmeeritav loogikamaatriks (PLA – Programmable Logic Array)**

Yhendused muudetavad

* **Struktuur:** Koosneb kahest programmeeritavast plokist:
  1. **NING-plokk (AND array):** Moodustab sisendsignaalidest ($x_1, x_2, x_3$) ja nende eitustest algtermid ehk korrutised ($V_1, V_2, V_3, V_4$)[cite: 8].
  2. **VÕI-plokk (OR array):** Liidab algtermid kokku lõplikeks loogikafunktsioonideks ($f_1, f_2$)[cite: 8].

* **Põhiomadus:** Erinevalt ROM-mälust või PAL-seadmetest on PLA-l **mõlemad plokid (nii NING kui ka VÕI) programmeeritavad**[cite: 8].

Programmable array logic
Ainus erinevus see et OR plokk ple programmeeritav

Programmeeritakse yhendusi ohku lastes 
Ohku lastud yhenduste puhul on AND sisend 1 ja OR sisend 0

**Täissummaatori realiseerimine PLA abil**

* **Eesmärk:** Liidab kokku kaks bitti ($A_i, B_i$) ja eelneva järgu ülekandebiti ($C_i$), andes väljundiks summa ($S_i$) ja uue ülekandebiti ($C_{i+1}$)[cite: 9].

| $A_i$ | $B_i$ | $C_i$ | $S_i$ (Summa) | $C_{i+1}$ (Ülekandebit) |
| :-: | :-: | :-: | :-: | :-: |
| **0** | **0** | **0** | **0** | **0** |
| **0** | **0** | **1** | **1** | **0** |
| **0** | **1** | **0** | **1** | **0** |
| **0** | **1** | **1** | **0** | **1** |
| **1** | **0** | **0** | **1** | **0** |
| **1** | **0** | **1** | **0** | **1** |
| **1** | **1** | **0** | **0** | **1** |
| **1** | **1** | **1** | **1** | **1** |

* **PLA roll:** NING-plokk moodustab sisendite kombinatsioonid ning VÕI-plokk koondab need summa $S_i$ ja ülekande $C_{i+1}$ väljunditeks[cite: 9].

4 Täissummatori yhendamisel saame 4 bitise summaatori 

**Loogikafunktsioonide süntees (Tõeväärtustabelist võrrandiks)**

* **Põhimõte:** Loogikafunktsiooni avaldise leidmiseks võetakse tõeväärtustabelist kõik read, kus väljund $f = 1$, moodustatakse nende jaoks korrutised (mintermid) ja liidetakse need kokku (SOP – *Sum of Products*)[cite: 9].

| $L_1$ | $L_2$ | $L_3$ | $f$ | Vastav minterm |
| :-: | :-: | :-: | :-: | :--- |
| **0** | **0** | **0** | **1** | $\bar{L}_1 \bar{L}_2 \bar{L}_3$[cite: 9] |
| **0** | **0** | **1** | **1** | $\bar{L}_1 \bar{L}_2 L_3$[cite: 9] |
| 0 | 1 | 0 | 0 | *(väljund on 0, jäetakse vahele)*[cite: 9] |
| **0** | **1** | **1** | **1** | $\bar{L}_1 L_2 L_3$[cite: 9] |
| 1 | 0 | 0 | 0 | *(väljund on 0, jäetakse vahele)*[cite: 9] |
| 1 | 0 | 1 | 0 | *(väljund on 0, jäetakse vahele)*[cite: 9] |
| 1 | 1 | 0 | 0 | *(väljund on 0, jäetakse vahele)*[cite: 9] |
| **1** | **1** | **1** | **1** | $L_1 L_2 L_3$[cite: 9] |

* **Loogikavõrrand:**
  $$f = \bar{L}_1 \bar{L}_2 \bar{L}_3 + \bar{L}_1 \bar{L}_2 L_3 + \bar{L}_1 L_2 L_3 + L_1 L_2 L_3$$[cite: 9]

**Karnaugh' kaart (K-kaart) ja loogikaimeerimine**

* **Eesmärk:** Karnaugh' kaarti kasutatakse loogikafunktsioonide **lihtsustamiseks (minimeerimiseks)**, et vähendada vajalike loogikaelementide arvu skeemis[cite: 10].
* **Gray koodi kasutamine:** Veergude päises ($x_1 x_2$) muutub järjestikuste ruutude vahel **ainult üks bitt korraga** (kaasa arvatud viimane rida/tulp) (`00` $\rightarrow$ `01` $\rightarrow$ `11` $\rightarrow$ `10`)[cite: 10].

---

### **1. Tõeväärtustabel ja Karnaugh' kaart**

**Tõeväärtustabel:**[cite: 10]

| $x_1$ | $x_2$ | $x_3$ | $f$ |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | **1** |
| 0 | 0 | 1 | **1** |
| 0 | 1 | 0 | **0** |
| 0 | 1 | 1 | **1** |
| 1 | 0 | 0 | **0** |
| 1 | 0 | 1 | **0** |
| 1 | 1 | 0 | **0** |
| 1 | 1 | 1 | **1** |

**Karnaugh' kaart:**[cite: 10]

| $x_1 x_2 \backslash x_3$ | 00 | 01 | 11 | 10 |
| :-: | :-: | :-: | :-: | :-: |
| **0** | 1 | 0 | 0 | 0 |
| **1** | 1 | 1 | 1 | 0 |

---

### **2. Minimeeritud loogikavõrrand ja skeem**

Kaardil kõrvutiasuvate ühtede ($1$) grupeerimisel saadakse lihtsustatud loogikavõrrand:

$$f = \bar{x}_1 \bar{x}_2 + x_2 x_3$$
[cite: 10]

* **Sõnaline seletus:** 
  1. Esimene kontuur liidab ruudud, kus $x_1 = 0$ ja $x_2 = 0$ (sõltumata $x_3$-st), andes liikme $\bar{x}_1 \bar{x}_2$[cite: 10].
  2. Teine kontuur liidab ruudud, kus $x_2 = 1$ ja $x_3 = 1$, andes liikme $x_2 x_3$[cite: 10].

  **Määramatus ehk "don't care" olekud ($x$) Karnaugh' kaardil**

* **Mõiste:** Kui mõne sisendkombinatsiooni puhul väljundi väärtus ei ole oluline (või seda olukorda ei teki kunagi), märgistatakse see sümboliga **$x$**[cite: 11].
* **Kasutamine minimeerimisel:**
  * Tähist $x$ võib interpreteerida kas **$1$ või $0$ väärtusena** vastavalt vajadusele, et moodustada kaardil võimalikult suuri kontuure (gruppe)[cite: 11].
  * Suuremad kontuurid annavad lihtsama loogikavõrrandi[cite: 11].
  * Eesmärk on saada võimalikult **vähe märgitud piirkondi** (st võimalikult vähe liidetavaid loogikavõrrandis)[cite: 11].

AND OR NOT - nende elementidega saab disainida koik loogika func
AND NOT teevad sama
