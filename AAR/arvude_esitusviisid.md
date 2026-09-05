# Arvusüsteemid ja kahendarvud

---

## 1. Arvusüsteemide alused

### Kümneendsüsteem (Decimal, Base-10)

Kümneendsüsteemis esitatakse arv tuletatuna positsioonilistest kaaludest:

$$D = d_{n-1} \cdot 10^{n-1} + \dots + d_2 \cdot 10^2 + d_1 \cdot 10^1 + d_0 \cdot 10^0$$

* **Täisarvu näide:**  
  $$531_{10} = 5 \times 10^2 + 3 \times 10^1 + 1 \times 10^0$$

* **Komaga arvu (murdosa) näide:**  
  Komaga arvude puhul kasutatakse negatiivseid astmeid:  
  $$3.14_{10} = 3 \times 10^0 + 1 \times 10^{-1} + 4 \times 10^{-2}$$

* **Võimalik vahemik $n$ numbrikoha korral:** $[0 \dots 10^n - 1]$

---

### Kahendsüsteem (Binary, Base-2)

Põhimõte on identne kümneendsüsteemiga, kuid aluseks on 2.

* **Täisarvu näide:**  
  $$101101_2 = 1 \cdot 2^5 + 0 \cdot 2^4 + 1 \cdot 2^3 + 1 \cdot 2^2 + 0 \cdot 2^1 + 1 \cdot 2^0 = 45_{10}$$

* **Murdosa näide:**  
  Kasutatakse astmeid $2^{-n}$, kus $n > 0$ (nt $2^{-1} = 0.5$, $2^{-2} = 0.25$, $2^{-3} = 0.125$).

* **Võimalik vahemik $n$ biti korral:** $[0 \dots 2^n - 1]$

---

### Üldine valem

Mis tahes arvusüsteemi numbri väärtus avaldub kujul:

$$\text{Arv} = \sum (\text{digit} \times \text{base}^{\text{position}})$$

* $\text{base}$ — arvusüsteemi alus (2, 8, 10, 16)
* $\text{position}$ — numbrikoha kaal/positsioon

---

## 2. Teisendamine (Base 10 $\rightarrow$ Base 2 / Base 16)

### Täisarvud: Jagamise meetod

1. Jaga arv alusega (2 või 16).
2. Kirjuta üles täisarvuline **jääk**:
   * **Base 2:** Jääk on $0$ või $1$.
   * **Base 16:** Jäägid $10 \dots 15$ asenda tähtedega `A` $\dots$ `F`.
3. Korda protsessi jagatise täisosaga, kuni tulemus on $0$.
4. **Tulemus:** Kirjuta jäägid **alt üles** (esimene jääk läheb kõige paremale ehk $2^0$ kohale).

---

### Murdosad: Korrutamise meetod

1. Korruta murdosa alusega (2, 8 või 16).
2. Kirjuta tulemuse **täisosa** komakoha taha (vasakult paremale):
   * **Base 16:** Täisosa $10 \dots 15$ asenda tähtedega `A` $\dots$ `F`.
3. Võta järgmisse sammu edasi **ainult uus murdosa** (lahuta tulemusest täisosa).
4. Korda, kuni murdosa on $0$ või saavutad nõutud täpsuse.

---

## 3. Märgiga kahendarvud

Märgiga kahendarvude esitamiseks on neli peamist süsteemi:

1. Märgi ja väärtuse süsteem (*Sign and Magnitude*)
2. Ühe täiend (*1's Complement*)
3. Kahe täiend (*2's Complement*)
4. Nihkega esitus (*Excess-N / Biased*)

> **Olulised reeglid (süsteemide 1–3 puhul):**
> * Kõige vasakpoolsem bitt (MSB) näitab märki: **0 = positiivne (+)**, **1 = negatiivne (-)**.
> * Positiivsed arvud kirjutatakse kõigis kolmes süsteemis **identselt**.
> * Negatiivsed arvud erinevad süsteemiti.

---

### Võrdlustabel (+5 ja -5 näitel, 4 bitti)

| Esitusviis | Positiivne (+5) | Negatiivne (-5) | Teisendamise reegel |
| :--- | :---: | :---: | :--- |
| **Märgi ja väärtuse** | `0101` | `1101` | Muuda ainult märgibitt (esimene bitt $0 \rightarrow 1$). |
| **Ühe täiend** | `0101` | `1010` | Inverteeri kõik bitid ($0 \rightarrow 1$ ja $1 \rightarrow 0$). |
| **Kahe täiend** | `0101` | `1011` | Inverteeri bitid ja liida $1$. |
| **Nihkega esitus** (nihe = 8) | `1101` | `0011` | Liida arvule nihe $K$ ja teisenda tulemus: <br> $+5 + 8 = 13 \rightarrow \text{1101}$ <br> $-5 + 8 = 3 \rightarrow \text{0011}$ <br> $-8 + 8 = 0 \rightarrow \text{0000}$ |

---

## 4. Tehted kahendarvudega

### Kahendarvude liitmise põhitehted

$$\begin{aligned}
0 + 0 &= 0 \\
1 + 0 &= 1 \\
1 + 1 &= 0 \quad (\text{ülekanne } 1) \\
1 + 1 + 1 &= 1 \quad (\text{ülekanne } 1)
\end{aligned}$$

---

### Aritmeetika kahe täiendi süsteemis

* **Liitmine:** Liida kahe arvu $n$-bitised kujud tavamoodusel. Viimane mahajääv ülekanne (bitt väljaspool $n$-bitist vahemikku) **ignoreeritakse**.
* **Lahutamine:** Leia lahutatava arvu kahe täiend ning liida see vähendatavale.
* **Märgi laiendamine (Sign Extension):** Kui soovid bittide arvu suurendada, kopeeri kõige vasakpoolsemat bitti (märgibitti) vasakule poole juurde:
  * $+5$ (`0101`) $\longrightarrow$ `0000 0101` (4 bitti $\rightarrow$ 8 bitti)
  * $-5$ (`1011`) $\longrightarrow$ `1111 1011` (4 bitti $\rightarrow$ 8 bitti)

---

### Aritmeetika ühe täiendi süsteemis

* **Ülekande liitmine (End-around carry):** Kui liitmisel tekib kõige vasakpoolsemast bitist ülekanne (bitt läheb vahemikust välja), tuleb see ülekandesignaal **liita tulemuse vähim tähtsale bitile** (paremale otsa tagasi).

---

## 5. Ületäitumine (Overflow) ja vahemikud

* **Vahemik ($n = 4$ bitti kahe täiendi süsteemis):** $[-2^{n-1} \dots 2^{n-1} - 1]$ ehk $[-8 \dots 7]$.
* **Ületäitumise reeglid:**
  1. Ületäitumine saab tekkida **ainult samamärgiliste arvude liitmisel** (kaks positiivset või kaks negatiivset arvu).
  2. Kui liidetakse kaks samamärgilist arvu, **peab vastus tulema samamärgiline**. Kui märgibitt muutub (nt kahe positiivse liitmisel tuleb vastuseks negatiivne arv), on tekkinud ületäitumine (*overflow*).
