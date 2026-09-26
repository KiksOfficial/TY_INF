Finitestate machine
- sisendid ja systeemi senine olek maaravad valjundid ja systeemi uue oleku

Trigerid

R=S=1 tavaliselt ei kasutata, seetottu voib kirjutada et v2 = not v1

# RS-trigri ajadiagramm (NOR-elemendid)

Pildil on kujutatud NOR-elementidest moodustatud asünkroonne RS-triger ja selle ajadiagramm.

---

## 1. Loogikalülituse skeem

NOR-elementidel RS-trigri tööpõhimõte:
* **Reset ($R$)**: Seab väljundi $V_1 = 0$ (ja $V_2 = 1$).
* **Set ($S$)**: Seab väljundi $V_1 = 1$ (ja $V_2 = 0$).
* **Hoidmine ($R = 0, S = 0$)**: Väljundid säilitavad oma eelmise oleku ($V_1$ ja $V_2$ ei muutu).
* **Keelatud olek ($R = 1, S = 1$)**: Mõlemad väljundid lähevad madalaks ($V_1 = 0, V_2 = 0$), mis on ebastabiilne/määramatu olek.

---

## 2. Signaalide analüüs ajahetkede kaupa

| Ajavahemik / Ajahetk | Sisend $R$ | Sisend $S$ | Väljund $V_1$ | Väljund $V_2$ | Kirjeldus / Olek |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **$t_0 \dots t_1$** | **1** | **0** | **0** | **1** | **Reset**: $R=1$ viib trigeri algasendisse ($V_1=0, V_2=1$). |
| **$t_1 \dots t_2$ vahel** | **0** | **1 $\rightarrow$ 0** | **1 $\rightarrow$ 0** | **0 $\rightarrow$ 1** | **Set & Hold**: $S$-impulss seab väljundi $V_1=1$ ja $V_2=0$. Kui $S$ langeb nulli, jääb olek püsima (mälu olek). |
| **$t_2 \dots t_3$** | **1** | **0 $\rightarrow$ 1 $\rightarrow$ 0** | **0** | **0 / impulss** | **Keelatud olek & Reset**: Kuigi $R=1$, tekib $S$-signaalis lühike impulss. Mõlemad sisendid $R=1, S=1 \Rightarrow V_1=0$. $V_2$ reageerib hetkeks, kuid jääb madalaks, kuni $R$ jääb 1-ks. |
| **$t_3 \dots t_4$** | **1 $\rightarrow$ 0** | **0** | **0** | **1** | **Reset lõpp / Hoidmine**: Kui $R$ langeb 0-ks, fikseerub väljundiks $V_1=0, V_2=1$. |
| **$t_4 \dots t_5$** | **0** | **1** | **1** | **0** | **Set**: $S$-signaal tõuseb kõrgeks ($S=1$), mis viib väljundi $V_1=1$ ja $V_2=0$. |
| **$t_5 \dots t_6$** | **1** | **1 $\rightarrow$ 0** | **0 / määramatu** | **0 / määramatu** | **Määramatu juhtum**: Mõlemad sisendid $R=1$ ja $S=1$ on korraga kõrged ning langedes samaaegselt võib tekib võidujooks (*race condition*). |

---

## 3. Kokkuvõttev tõeväärtustabel (NOR-triger)

| $R$ | $S$ | $V_1$ (Uus olek) | $V_2$ (Uus olek) | Märkus |
|:---:|:---:|:---:|:---:|:--- |
| `0` | `0` | $V_1$ (eelmine) | $V_2$ (eelmine) | Hoidmine / Mälu |
| `0` | `1` | `1` | `0` | Set (Sättimine) |
| `1` | `0` | `0` | `1` | Reset (Lähestamine) |
| `1` | `1` | `0` | `0` | Keelatud olek |

MUUDATUSED EI TOIMU HETKEGA 

Kui R ja S molemad 0 ss schrõdinger olek

# SR-triger (Taktitav / Sünkroonne SR-triger)

Slaidil on kujutatud taktsignaaliga ($Clk$) juhtitav SR-triger (*gated SR latch* / sünkroonne SR-triger), selle loogikasüsteem, tähistus tingmärkide abil ja tööd kirjeldav tõeväärtustabel.

---

## 1. Loogikalülituse ehitus

Taktitav SR-triger koosneb kahest osast:
1. **Sisendloogika (AND-elemendid)**:
   * Sisendid $R$ ja $Clk$ läbivad ülemise AND-elemendi, mille väljundiks on $R'$.
   * Sisendid $S$ ja $Clk$ läbivad alumise AND-elemendi, mille väljundiks on $S'$.
   * Kui $Clk = 0$, on mõlemad vaheväljundid $R' = 0$ ja $S' = 0$, sõltumata sisendite $S$ ja $R$ väärtustest.
2. **Põhilüliti (NOR-RS-triger)**:
   * Sisendid $R'$ ja $S'$ juhitakse kahe ristühenduses NOR-elemendi sisenditesse.
   * Väljunditeks on otseväljund $Q$ ja inversioonväljund $\overline{Q}$.

---

## 2. Tingmärk (Skeemitähis)

Alla vasakule on kuvatud sünkroonse SR-trigri tingmärk:
* **Vasakul (sisendid)**: $S$ (Set), $Clk$ (Taktsignaal / Clock), $R$ (Reset).
* **Paremal (väljundid)**: $Q$ (otseväljund), $\overline{Q}$ (inverteeritud väljund).

---

## 3. Tõeväärtustabel (Olefutabel)

Tabel kirjeldab väljundi uut olekut $Q(t+1)$ sõltuvalt taktsignaalist $Clk$, sisenditest $S$ ja $R$ ning eelmisest olekust $Q(t)$:

| Clk | S | R | Q(t+1) | Seletus / Olek |
| :---: | :---: | :---: | :---: | :--- |
| **0** | **x** | **x** | **Q(t)** | **Skeem on lukustatud**: Taktsignaal puudub ($Clk=0$), sisendid $S$ ja $R$ ei mõjuta väljundit. Säilib eelmine olek $Q(t)$. |
| **1** | **0** | **0** | **Q(t)** | **Hoidmine / Mälu**: Taktsignaal on aktiivne ($Clk=1$), kuid sisendid puuduvad ($S=0, R=0$). Olek ei muutu. |
| **1** | **0** | **1** | **0** | **Reset (Nullimine)**: $Clk=1, R=1, S=0 \Rightarrow$ Väljund seatakse nulli ($Q=0$). |
| **1** | **1** | **0** | **1** | **Set (Sättimine)**: $Clk=1, S=1, R=0 \Rightarrow$ Väljund seatakse ühte ($Q=1$). |
| **1** | **1** | **1** | **x** | **Määramatu / Keelatud olek**: $Clk=1, S=1, R=1 \Rightarrow$ Mõlemad NOR-elementide sisendid läbivad 1-d, mis viib määratlemata või lubamatu olekuni. |

*Märkus: `x` tähistab tabelis suvalist/määramatut väärtust (*don't care* / forbidden state).*

# D-triger ja selle ajadiagramm

Pildil on kujutatud D-triger (*Data / Delay latch* / sünkroonne D-triger), selle põhimõtteskeem NAND-elementidel, tingmärk, tõeväärtustabel ning tööd selgitav ajadiagramm[cite: 3].

---

## 1. D-triger (Ehitus ja tööpõhimõte)

D-triger on loodud RS-trigri baasil selliselt, et vältida määramatut ehk keelatud olekut ($R=1, S=1$)[cite: 3].

* **Sisendloogika**: Sisend $D$ ühendatakse otse ülemise NAND-elemendi sisendisse ($S$) ning läbi inverting-elemendi (NOT) alumise NAND-elemendi sisendisse ($R$)[cite: 3]. Teiseks sisendiks mõlemale on taktsignaal $Clk$[cite: 3].
* **Tööpõhimõte**: Väljund $Q$ saab taktsignaali $Clk=1$ korras alati sisendi $D$ väärtuse ($Q = D$)[cite: 3]. Kui $Clk=0$, säilitab triger oma eelmise oleku[cite: 3].

### Tingmärk
* **Sisendid**: $D$ (andmesisend / *Data*), $Clk$ (taktsignaal / *Clock*)[cite: 3].
* **Väljundid**: $Q$ (otseväljund), $\overline{Q}$ (inverteeritud väljund)[cite: 3].

---

## 2. Tõeväärtustabel

| Clk | D | Q(t+1) | Seletus / Olek |
| :---: | :---: | :---: | :--- |
| **0** | **x** | **Q(t)** | **Hoidmine / Mälu**: Taktsignaal puudub ($Clk=0$), sisendi $D$ muutus ei mõjuta väljundit[cite: 3]. |
| **1** | **0** | **0** | **Nullimine / Salvesta 0**: $Clk=1$ ja $D=0 \Rightarrow$ väljundiks saab $Q=0$[cite: 3]. |
| **1** | **1** | **1** | **Sättimine / Salvesta 1**: $Clk=1$ ja $D=1 \Rightarrow$ väljundiks saab $Q=1$[cite: 3]. |

---

## 3. Ajadiagrammi analüüs

Ajadiagramm näitab väljundi $Q$ reageerimist taktsignaalile $Clk$ ja andmesisendile $D$[cite: 3]:

| Ajavahemik / Ajahetk | Taktsignaal $Clk$ | Sisend $D$ | Väljund $Q$ | Kirjeldus / Olek |
| :--- | :---: | :---: | :---: | :--- |
| **Enne $t_1$** | **0** | **0 $\rightarrow$ 1** | **0** | $Clk=0$, seega sisendi $D$ tõus ei muuda väljundit $Q$ (mälu olek)[cite: 3]. |
| **$t_1 \dots t_2$** | **1** | **1 $\rightarrow$ 0** | **1 $\rightarrow$ 0** | $Clk=1$ ajal läbib sisend $D$ väljundisse $Q$. Kui $D=1$, muutub $Q=1$. Kui $D$ langeb 0-ks enne $t_2$, langeb ka $Q=0$[cite: 3]. |
| **$t_2 \dots t_3$** | **0 / Impulss** | **0** | **0** | $Clk=0$ ajal hoiab triger vana olekut ($Q=0$)[cite: 3]. |
| **$t_3 \dots t_4$** | **1** | **1** | **1** | $Clk=1$ tõustes on $D=1$, seega $Q$ tõuseb kõrgeks ($Q=1$)[cite: 3]. Kui $Clk$ langeb 0-ks, jääb $Q=1$ püsima[cite: 3]. |
| **$t_4 \dots t_5$** | **1** | **1** | **1** | Järgmise $Clk=1$ impulsi ajal on $D=1$, seega $Q$ püsib tasemel 1[cite: 3]. |
| **$t_5 \dots t_6$** | **1** | **1** | **1** | $Clk=1$ ajal on $D=1$, mille tulemusel $Q$ tõuseb jälle kõrgeks ja jääb säilima[cite: 3]. |

# Kahetaktiline D-triger (*Master-Slave D Flip-Flop*)

Kahetaktiline D-triger koosneb kahest järjestikku ühendatud D-trigerist (põhitriger ehk *Master* ja abitriger ehk *Slave*), mida juhitakse vastandfaasis olevate taktsignaalidega.

---

## Skeem ja tööpõhimõte

1. **Põhitriger (*Master*)**: Jälgib sisendsignaali $D$ taktsignaali $Clk$ kõrge nivoo ($1$) ajal.
2. **Abitriger (*Slave*)**: Kopeerib põhitrigeri väljundi $Q_m$ lõplikku väljundisse $Q$ taktsignaali $Clk$ madala nivoo ($0$) ajal (läbi inverteri).

### Skeemilogika:
* **Kui $Clk = 1$:** Põhitriger on aktiivne ja selle väljund $Q_m$ jälgib sisendit $D$ ($Q_m = D$). Abitriger on blokeeritud ja hoiab oma varasemat väljundit $Q$.
* **Kui $Clk = 0$:** Põhitriger on blokeeritud ja säilitab oma viimase oleku $Q_m$. Abitriger muutub aktiivseks ning edastab $Q_m$ väärtuse lõplikku väljundisse $Q$.

---

## Ajadiagrammi selgitus ja korrektsioon

Trigeri lõplik väljund $Q$ uueneb **taktsignaali langeval serval ($Clk: 1 \rightarrow 0$)**.

* **$Clk = 1$ ajal (aktiivne takt):**
  * Sisendi $D$ muutused kanduvad koheselt üle põhitrigeri väljundisse $Q_m$.
  * Väljund $Q$ ei muutu.

* **$t_1, t_2, t_3$ (Taktsignaali langev serv / $Clk$ muutub $1 \rightarrow 0$):**
  1. Põhitriger lukustab sisendi $D$ viimase väärtuse, mis kehtis vahetult enne takti langemist.
  2. Abitriger aktiveerub ning edastab selle väärtuse lõplikku väljundisse $Q$.
  3. Väljund $Q$ hoiab seda väärtust stabiilsena kuni järgmise $Clk$ langeva servani.

---

## Signaalide olekutabel (Tõeväärtustabel)

| $Clk$ üleminek | Sisend $D$ | Põhitriger $Q_m$ | Väljund $Q$ | Kirjeldus |
| :---: | :---: | :---: | :---: | :--- |
| $1$ | $0 / 1$ | $D$ | $Q_0$ | Master jälgib sisendit $D$, Slave on blokeeritud |
| $1 \rightarrow 0$ | $X$ | Lukustatud | $Q_m$ | **Aktiivne üleminek:** $Q_m$ väärtus edastatakse väljundisse $Q$ |
| $0$ | $X$ | Lukustatud | $Q_0$ | Mõlemad astmed hoiavad oma olekut stabiilsena |

Master slave D tiger - negatiivne sisend ple mitte esimese triggeri taga a teise triggeri taga 

# JK-triger (*JK Flip-Flop*)

Pildil on kujutatud D-trigeri põhjal ehitatud JK-trigeri loogikaskeem, tingmärk ja olekutabel.

---

## Loogikavõrrand ja skeemi tööpõhimõte

Skeemil moodustatakse D-trigeri sisend $D$ kombinatsioonaallogika abil järgmiselt:
$$D = (J \cdot \overline{Q}) + (\overline{K} \cdot Q)$$

* **Ülemine AND-samm:** Kopeerib sisendi $J$ ja eelmise eituse väljundi $\overline{Q}(t)$ korrutise ($J \cdot \overline{Q}$).
* **Alumine AND-samm:** Kopeerib sisendi $K$ eituse $\overline{K}$ ja eelmise väljundi $Q(t)$ korrutise ($\overline{K} \cdot Q$).
* **OR-samm:** Liidab need kaks signaali D-trigeri sisendisse $D$.

---

## Olekutabel (Tõeväärtustabel)

| Sisend $J$ | Sisend $K$ | Uus olek $Q(t+1)$ | Seisund / Kirjeldus |
| :---: | :---: | :---: | :--- |
| **$0$** | **$0$** | **$Q(t)$** | **Säilitamine (*Hold*):** Väljund $Q$ ei muutu ja säilitab praeguse oleku. |
| **$0$** | **$1$** | **$0$** | **Nullimine (*Reset*):** Väljund $Q$ muutub madalaks ($0$). |
| **$1$** | **$0$** | **$1$** | **Seadmine (*Set*):** Väljund $Q$ muutub kõrgeks ($1$). |
| **$1$** | **$1$** | **$\overline{Q(t)}$** | **Inverteerimine (*Toggle*):** Väljund $Q$ vahetab oma oleku vastupidiseks. |

---

### Tähiste selgitused:
* **$Q(t)$**: Väljundi praegune (eelnev) olek enne taktimpulssi.
* **$Q(t+1)$**: Väljundi uus olek pärast taktimpulssi ($Clk$).
* **$\overline{Q(t)}$**: Praeguse väljundi vastandväärtus (eitustulemus).

Kui clear (aktiivses olekus 0) signaal on 0 ss not Q = 1 ja Q = 0
Preset sisend aktiivses olekus 0 kui sisendi vaartuseks on 0 ss Q = 1 ja not Q = 0

Triggerites saab salvestada 1 bitti korraga 
Triggeritest koosnevaid seadmeid kus saab infot salvestada on registrid
Nihke register - nihutab vastavalt vasakule v paremale


D TRIGGER MULLIGA LOEB A VAARTUSE KUI 1->0
D TRIGGER MULLITA LOEB A VARTUSE KUI 0->1

T TRIGGER PANEB f0 EELMISE VAARTUSE KUI T = 0
T TRIGGER PANEB NOT f0 EELMISE VAARTUSE KUI T = 1
NEED MOLEMAD AIND SS KUI ALL VASAKUL 1

Paralleellaadimisel (a1=1): Võtad viimase takti kohalt otse numbrid a2, a3, a4, a5 rea pealt.
a kui a1=0 ss flipid


Moodle viimane ylesanne kui ring ees ss f muidu e

