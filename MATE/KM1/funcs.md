## Peatükk 1: Funktsioonid (Lühikonspekt)

See spikker käsitleb funktsioonide põhiomadusi, määramis- ja muutumispiirkondi ning graafikute teisendusi.

---

## 1. Määramis- ja muutumispiirkonna teisenduste tabel

Olgu algse funktsiooni $f(x)$ määramispiirkond $X = [x_1, x_2]$ ja muutumispiirkond $Y = [y_1, y_2]$[cite: 1].

| Tehe / Avaldis | Uus määramispiirkond ($X_{\text{uus}}$) | Uus muutumispiirkond ($Y_{\text{uus}}$) | Selgitus / Graafiku efekt |
| :--- | :--- | :--- | :--- |
| **$f(x \pm a)$** | $[x_1 \mp a, x_2 \mp a]$[cite: 1] | $[y_1, y_2]$[cite: 1] | Nihkub horisontaalselt ($+a$ vasakule, $-a$ paremale)[cite: 1]. |
| **$f(-x)$** | $[-x_2, -x_1]$ | $[y_1, y_2]$[cite: 1] | Peegeldub $y$-telje suhtes[cite: 1]. |
| **$f(bx)$** | $\left[\frac{x_1}{b}, \frac{x_2}{b}\right]$ | $[y_1, y_2]$[cite: 1] | Surutakse horisontaalselt kokku $b$ korda[cite: 1]. |
| **$f\left(\frac{x}{b}\right)$** | $[b \cdot x_1, b \cdot x_2]$ | $[y_1, y_2]$[cite: 1] | Venitatakse horisontaalselt $b$ korda laiemaks[cite: 1]. |
| **$f(x) \pm a$** | $[x_1, x_2]$[cite: 1] | $[y_1 \pm a, y_2 \pm a]$[cite: 1] | Nihkub vertikaalselt ($+a$ üles, $-a$ alla)[cite: 1]. |
| **$-f(x)$** | $[x_1, x_2]$[cite: 1] | $[-y_2, -y_1]$ | Peegeldub $x$-telje suhtes[cite: 1]. |
| **$b \cdot f(x)$** | $[x_1, x_2]$[cite: 1] | $[b \cdot y_1, b \cdot y_2]$[cite: 1] | Venitatakse vertikaalselt $b$ korda[cite: 1]. |
| **$\|f(x)\|$** | $[x_1, x_2]$[cite: 1] | $[\max(0, y_1), \max(\|y_1\|, \|y_2\|)]$ | Negatiivsed $y$-väärtused peegeldatakse üles[cite: 1]. |

---

## 2. Sümmeetria ja omadused

* **Paarisfunktsioon:** $f(-x) = f(x) \implies$ graafik on sümmeetriline **$y$-telje suhtes**[cite: 1].
* **Paaritu funktsioon:** $f(-x) = -f(x) \implies$ graafik on sümmeetriline **nullpunkti suhtes**[cite: 1].
* **Pöördfunktsioon $f^{-1}(x)$:** Olemas vaid **üksüheste (injektiivsete)** funktsioonide korral ($f(x_1) \neq f(x_2)$, kui $x_1 \neq x_2$)[cite: 1]. Graafik on sümmeetriline sirge **$y = x$** suhtes[cite: 1].

---

## 3. Praktilised tehed ja tüüpülesanded

### 3.1 Naturaalalusele viimine
Eksponentfunktsiooni $a^x$ analüütiliseks teisendamiseks või arvutamiseks viiakse see alati naturaalalusele[cite: 1]:
$$a^x = e^{x \ln a} \quad (\text{nt } 2^x = e^{x \ln 2})$$[cite: 1]

### 3.2 Mitme teisenduse koosmõju leidu näide
Olgu antud funktsioon $g(x) = 1 - 2 \arcsin(x + 1)$[cite: 1].  
Algse funktsiooni $f(t) = \arcsin(t)$ piirkonnad on $X_f = [-1, 1]$ ja $Y_f = \left[-\frac{\pi}{2}, \frac{\pi}{2}\right]$[cite: 1].

1. **Määramispiirkond ($X_g$):**  
   Argument $x + 1$ peab mahtuma piiridesse $[-1, 1]$[cite: 1]:
   $$-1 \le x + 1 \le 1 \implies -2 \le x \le 0 \implies X_g = [-2, 0]$$[cite: 1]

2. **Muutumispiirkond ($Y_g$):**  
   Alustades vahemikust $-\frac{\pi}{2} \le \arcsin(x+1) \le \frac{\pi}{2}$[cite: 1]:
   * Korrutades $-2$-ga (märkide pöördumine ja venitus): $[-\pi, \pi]$[cite: 1]
   * Liites $1$ (nihutus üles): $[1 - \pi, 1 + \pi] \implies Y_g \approx [-2.14, 4.14]$[cite: 1] Peatükk 1: Funktsioonid

Erinevates teaduse ja tehnika valdkondades esineb sageli sõltuvusi kahe või enama suuruse vahel nende koosmuutumisel[cite: 1]. Näiteks sõltub ringi pindala raadiusest, läbitud teepikkus ajast ning algoritmi tööaeg sisendi suurusest[cite: 1]. Selliste sõltuvuste kirjeldamiseks kasutatakse funktsioone[cite: 1]. Kõige üldisemalt võib muutujaks olla mistahes hulga element, näiteks arv, punkt, vektor või muu objekt[cite: 1]. Selles peatükis käsitleme ühe reaalarvulise muutuja reaalarvulisi funktsioone[cite: 1].

---

## 1.1 Funktsiooni mõiste

> **Definitsioon 1.1**  
> Olgu $X$ mittetühi reaalarvude hulk[cite: 1]. Kui $x$ tähistab hulga $X$ suvalist elementi, siis öeldakse, et $x$ on **muutuv suurus** ehk lihtsalt **muutuja**[cite: 1]. Hulga $X$ elemente nimetatakse muutuja $x$ **väärtusteks**[cite: 1].

> **Definitsioon 1.2**  
> Olgu $X$ mittetühi reaalarvude hulk[cite: 1]. Kui igale arvule $x \in X$ on mingi eeskirja $f$ järgi seatud vastavusse täpselt üks reaalarv $y \in \mathbb{R}$, siis öeldakse, et hulgas $X$ on defineeritud **funktsioon** $f$, mida märgitakse:  
> $$y = f(x)$$  
> Muutujat $x$ nimetatakse **sõltumatuks muutujaks** ehk **funktsiooni argumendiks** ja muutujat $y$ **sõltuvaks muutujaks** ehk **funktsiooni väärtuseks**[cite: 1].

**Näide 1.1.**
* Seos $y = x \pm 1$ ei kujuta endast funktsiooni, kuna argumendile $x$ on vastavusse seatud rohkem kui üks väärtus[cite: 1]. Näiteks, kui $x = 2$, siis $y$ väärtusteks on $1$ ja $3$[cite: 1]. Küll aga on funktsiooniks $y = x - 1$[cite: 1].
* Valem $S = a^2$ määrab ruudu pindala $S$ tema külje pikkuse $a$ kaudu[cite: 1]. Seega on $S$ funktsioon muutujast $a$[cite: 1].

> **Definitsioon 1.3**  
> * Funktsiooni argumendi kõikide väärtuste hulka nimetatakse funktsiooni **määramispiirkonnaks**[cite: 1].  
> * Funktsiooni kõikide väärtuste hulka nimetatakse funktsiooni **muutumispiirkonnaks**[cite: 1].

Tavaliselt tähistatakse funktsiooni $f$ määramispiirkonda tähega $X$ ja muutumispiirkonda tähega $Y$[cite: 1]. Kasutatakse ka kirjutist $f : X \to D$, kus $D$ on suvaline hulk, mis sisaldab funktsiooni $f$ muutumispiirkonda, näiteks $f : X \to \mathbb{R}$[cite: 1].

Kui funktsiooni $f$ korral on antud vaid teda määrav eeskiri, määramispiirkond $X$ pole aga fikseeritud, siis loetakse määramispiirkonnaks kõikide nende argumendi väärtuste hulk, mille korral funktsiooni määrav eeskiri omab mõtet (nn **loomulik määramispiirkond**)[cite: 1]. Funktsiooni $f$ saab defineerida suvalisel mittetühjal määramispiirkonna alamhulgal[cite: 1]. Sellisel juhul on oluline seda mainida[cite: 1].

**Näide 1.2.**  
Funktsiooni $f(x) = \sqrt{x + 3}$ loomuliku määramispiirkonna leidmiseks peab kehtima $x + 3 \ge 0$[cite: 1]. Seega $X = [-3, \infty)$[cite: 1]. Kuna ruutjuure väärtused on mittenegatiivsed, siis muutumispiirkond $Y = [0, \infty)$[cite: 1].

> **Definitsioon 1.4**  
> Öeldakse, et funktsioonid $f$ ja $g$ on **võrdsed**, kui:
> 1. funktsioonide $f$ ja $g$ määramispiirkonnad on samad[cite: 1];
> 2. $f(x) = g(x)$ iga punkti $x \in X$ korral, kus $X$ tähistab funktsioonide $f$ ja $g$ määramispiirkonda[cite: 1].

> **Definitsioon 1.5**  
> Funktsiooni $f$ **graafikuks** nimetatakse $xy$-tasandi punktide hulka:
> $$G(f) = \{(x, y) \mid y = f(x), \, x \in X\}$$
> kus hulk $X$ on funktsiooni $f$ määramispiirkond[cite: 1].

Funktsioonidega saab teha aritmeetilisi tehteid sarnaselt arvudega[cite: 1]. Järgnevalt defineerime nende tehete tulemuseks saadavad funktsioonid[cite: 1].

> **Definitsioon 1.6**  
> Olgu antud funktsioonid $f : X_1 \to \mathbb{R}$ ja $g : X_2 \to \mathbb{R}$[cite: 1]. Olgu $X = X_1 \cap X_2$[cite: 1].
> 1. Funktsioonide $f$ ja $g$ **summaks** nimetatakse funktsiooni $f + g : X \to \mathbb{R}$, mis defineeritakse võrdusega:  
>    $$(f + g)(x) = f(x) + g(x) \quad \text{iga } x \in X \text{ korral.}$$[cite: 1]
> 2. Funktsioonide $f$ ja $g$ **vaheks** nimetatakse funktsiooni $f - g : X \to \mathbb{R}$, mis defineeritakse võrdusega:  
>    $$(f - g)(x) = f(x) - g(x) \quad \text{iga } x \in X \text{ korral.}$$[cite: 1]
> 3. Funktsiooni $f$ **korrutiseks arvuga** $c \in \mathbb{R}$ nimetatakse funktsiooni $cf : X_1 \to \mathbb{R}$, mis on määratud võrdusega:  
>    $$(cf)(x) = c f(x) \quad \text{iga } x \in X_1 \text{ korral.}$$[cite: 1]
> 4. Funktsioonide $f$ ja $g$ **korrutiseks** nimetatakse funktsiooni $fg : X \to \mathbb{R}$, mis defineeritakse võrdusega:  
>    $$(fg)(x) = f(x)g(x) \quad \text{iga } x \in X \text{ korral.}$$[cite: 1]
> 5. Funktsioonide $f$ ja $g$ **jagatiseks** nimetatakse funktsiooni $\frac{f}{g} : X \setminus \{x : g(x) = 0\} \to \mathbb{R}$, mis defineeritakse võrdusega:  
>    $$\left(\frac{f}{g}\right)(x) = \frac{f(x)}{g(x)} \quad \text{iga } x \in X \setminus \{x : g(x) = 0\} \text{ korral.}$$[cite: 1]

> **Definitsioon 1.7**  
> Olgu antud funktsioonid $f : X \to \mathbb{R}$ ja $g : Y \to \mathbb{R}$ ning funktsiooni $f$ väärtused kuulugu hulka $Y$[cite: 1]. Funktsioonide $f$ ja $g$ **liitfunktsiooniks** nimetatakse funktsiooni $g \circ f : X \to \mathbb{R}$, mis defineeritakse võrdusega:  
> $$(g \circ f)(x) = g(f(x))$$[cite: 1]

**Näide 1.3.**  
Vaatleme funktsioone $f(x) = x + 1$ ja $g(x) = x^2$[cite: 1]. Saame moodustada järgmisi liitfunktsioone:
* $u(x) = (f \circ g)(x) = f(g(x)) = g(x) + 1 = x^2 + 1$[cite: 1]
* $v(x) = (g \circ f)(x) = g(f(x)) = (x + 1)^2 = x^2 + 2x + 1$[cite: 1]

---

## 1.2 Funktsioonide liigid

### 1.2.1 Paaris- ja paaritud funktsioonid

> **Definitsioon 1.8**  
> Olgu funktsiooni $f$ määramispiirkond $X$ sümmeetriline nullpunkti suhtes, s.t kui $x \in X$, siis ka $-x \in X$[cite: 1].
> * Funktsiooni $f$ nimetatakse **paarisfunktsiooniks**, kui $f(-x) = f(x)$ iga $x \in X$ korral[cite: 1].
> * Funktsiooni $f$ nimetatakse **paarituks funktsiooniks**, kui $f(-x) = -f(x)$ iga $x \in X$ korral[cite: 1].

**Omadus 1.1.**
* Paarisfunktsiooni graafik on sümmeetriline $y$-telje suhtes[cite: 1].
* Paaritu funktsiooni graafik on sümmeetriline nullpunkti suhtes[cite: 1].

Vaatleme, millal saab funktsioon olla samaaegselt nii paaris kui ka paaritu[cite: 1].

> **Lause 1.1**  
> Olgu funktsiooni $f$ määramispiirkond $X$ sümmeetriline nullpunkti suhtes[cite: 1]. Funktsioon $f$ on korraga paaris ja paaritu siis ja ainult siis, kui:  
> $$f(x) = 0 \quad \text{iga } x \in X \text{ korral.}$$[cite: 1]

*Tõestus.* Oletame, et funktsioon $f$ on korraga paaris ja paaritu[cite: 1]. Siis $f(-x) = f(x)$ ja $f(-x) = -f(x)$[cite: 1]. Seega:
$$f(x) = -f(x)$$[cite: 1]
Liites võrduse mõlemale poole $f(x)$, saame $2f(x) = 0$, seega $f(x) = 0$ iga $x \in X$ korral[cite: 1].  
Vastupidi, kui $f(x) = 0$ iga $x \in X$ korral, siis $f(-x) = 0 = f(x)$ ja $f(-x) = 0 = -f(x)$[cite: 1]. Seega on $f$ nii paaris kui ka paaritu[cite: 1]. $\blacksquare$

**Näide 1.4.**
* Funktsioon $f(x) = x^2$ on paaris, sest $f(-x) = (-x)^2 = x^2 = f(x)$[cite: 1].
* Funktsioon $f(x) = \frac{1}{x}$ on paaritu, sest $-f(-x) = -\frac{1}{-x} = \frac{1}{x} = f(x)$[cite: 1].
* Funktsiooni mitte-paarisuse näitamiseks piisab leida üks $x$, mille korral $f(-x) \neq f(x)$[cite: 1]. Mitte-paarituse näitamiseks piisab leida üks $x$, mille korral $f(-x) \neq -f(x)$[cite: 1]. Ühe tingimuse rikkumisest ei järeldu teise tingimuse rikkumine[cite: 1].
* Funktsioon $f(x) = \sin x + \cos x$ ei ole paaris ega paaritu[cite: 1]. Tõepoolest, kui $x = \frac{\pi}{4}$, siis:
  $$f\left(\frac{\pi}{4}\right) = \frac{\sqrt{2}}{2} + \frac{\sqrt{2}}{2} = \sqrt{2} \quad \text{ja} \quad f\left(-\frac{\pi}{4}\right) = -\frac{\sqrt{2}}{2} + \frac{\sqrt{2}}{2} = 0$$[cite: 1]
  Seega $f\left(-\frac{\pi}{4}\right) \neq f\left(\frac{\pi}{4}\right)$ ja $f\left(-\frac{\pi}{4}\right) \neq -f\left(\frac{\pi}{4}\right)$, ehk funktsioon ei ole paaris ega paaritu[cite: 1].

---

### 1.2.2 Tõkestatud funktsioonid

> **Definitsioon 1.9**  
> Olgu hulk $D$ funktsiooni $f$ määramispiirkonna alamhulk[cite: 1].
> 1. Öeldakse, et funktsioon $f$ on **ülalt tõkestatud** hulgas $D$, kui leidub arv $M \in \mathbb{R}$ nii, et $f(x) \le M$ iga $x \in D$ korral[cite: 1].
> 2. Öeldakse, et funktsioon $f$ on **alt tõkestatud** hulgas $D$, kui leidub arv $m \in \mathbb{R}$ nii, et $m \le f(x)$ iga $x \in D$ korral[cite: 1].
> 3. Öeldakse, et funktsioon $f$ on **tõkestatud** hulgas $D$, kui leiduvad arvud $m, M \in \mathbb{R}$ nii, et $m \le f(x) \le M$ iga $x \in D$ korral[cite: 1].

Kui on öeldud, et funktsioon on tõkestatud ja pole mainitud millisel hulgal, siis on mõeldud, et funktsioon on tõkestatud oma määramispiirkonnas[cite: 1].

Tõkestatuse tingimuse võib kirjutada ka järgmiselt: funktsioon $f$ on hulgas $D$ tõkestatud, kui leidub arv $C > 0$, mille korral:
$$|f(x)| \le C \quad \text{iga } x \in D \text{ korral.}$$[cite: 1]

**Näide 1.5.**
* Funktsioon $f(x) = 2x$ pole tõkestatud[cite: 1]. Tõepoolest, kui oletame, et leidub selline arv $M$, et iga $x \in \mathbb{R}$ korral $2x \le M$, siis viimane võrratus peab kehtima ka $x = \frac{M+1}{2}$ korral[cite: 1]. Kuna $2 \cdot \frac{M+1}{2} = M + 1 > M$, siis meie oletus oli ekslik[cite: 1].
* Funktsioon $f(x) = 2x$, $x \in [0, 10)$ on tõkestatud, sest iga $x \in [0, 10)$ korral $0 \le 2x < 20$[cite: 1].

---

### 1.2.3 Üksühesed funktsioonid

> **Definitsioon 1.10**  
> Funktsiooni $f$ nimetatakse **üksüheseks funktsiooniks** (**injektiivseks funktsiooniks**), kui määramispiirkonna $X$ iga kahe elemendi $x_1 \neq x_2$ korral ka funktsiooni väärtused erinevad, s.t:  
> $$f(x_1) \neq f(x_2)$$[cite: 1]

Funktsiooni üksühesus tähendab veel seda, et kui $f(x_1) = f(x_2)$, siis peab kehtima elementide võrdus $x_1 = x_2$[cite: 1].

> **Märkus 1.1**  
> Kui iga $x$-teljega paralleelne sirge lõikab funktsiooni $f$ graafikut ülimalt ühes punktis, siis on funktsioon $f$ üksühene[cite: 1].

**Näide 1.6.**
* Funktsioon $f(x) = x^2$ ei ole üksühene, sest näiteks $f(-2) = f(2) = 4$[cite: 1].
* Kui nüüd võtame sama valemiga antud funktsiooni $g(x) = x^2$, aga määramispiirkonnaks valime $X = [0, \infty)$, siis funktsioon $g$ on juba üksühene funktsioon, sest iga mittenegatiivsete $x_1, x_2$ korral võrdusest $x_1^2 = x_2^2$ järeldub võrdus $x_1 = x_2$[cite: 1].

---

### 1.2.4 Pööratavad funktsioonid

> **Definitsioon 1.11**  
> Olgu funktsiooni $f$ määramispiirkond $X$ ja muutumispiirkond $Y$[cite: 1]. Kui leidub funktsioon $f^{-1}$ määramispiirkonnaga $Y$ selline, et  
> $$f^{-1}(f(x)) = x \quad \text{iga } x \in X \text{ korral,}$$  
> siis öeldakse, et funktsioon $f$ on **pööratav**[cite: 1]. Funktsiooni $f^{-1}$ nimetatakse funktsiooni $f$ **pöördfunktsiooniks**[cite: 1].

**Omadus 1.2.**  
Funktsiooni $f$ ja tema pöördfunktsiooni $f^{-1}$ graafikud on sümmeetrilised sirge $y = x$ suhtes[cite: 1].

> **Teoreem 1.3**  
> Funktsioon $f$ on pööratav parajasti siis, kui ta on üksühene[cite: 1].

Funktsiooni $f$ pöördfunktsiooni $f^{-1}$ leidmiseks tuleb:
1. Avaldada võrrandist $y = f(x)$ muutuja $x$ muutuja $y$ kaudu;[cite: 1]
2. Vahetada tähised $x$ ja $y$;[cite: 1]
3. Kirjutada välja pöördfunktsioon $f^{-1}$[cite: 1].

**Näide 1.7.**  
Seame Celsiuse kraadidele vastavusse Fahrenheiti kraadid:
$$f(x) = \frac{9}{5}x + 32$$[cite: 1]
Selleks et teisendada näiteks $30^\circ\text{C}$ Fahrenheiti kraadideks, leiame $f(30) = \frac{9}{5} \cdot 30 + 32 = 86$, s.t $30^\circ\text{C} = 86^\circ\text{F}$[cite: 1].

Leiame funktsiooni $f$ pöördfunktsiooni[cite: 1]. Paneme kirja $y = \frac{9}{5}x + 32$ ja avaldame $x$-i $y$-i kaudu:
$$x = \frac{5}{9}(y - 32)$$[cite: 1]
Vahetades tähised $x$ ja $y$, saame:
$$y = \frac{5}{9}(x - 32) \implies f^{-1}(x) = \frac{5}{9}(x - 32)$$[cite: 1]

Pöördfunktsiooni abil saame leida temperatuuri Celsiuse kraadides, kui see on antud Fahrenheiti kraadides[cite: 1]. Näiteks $f^{-1}(122) = \frac{5}{9}(122 - 32) = 50$, s.o $122^\circ\text{F} = 50^\circ\text{C}$[cite: 1].

---

## 1.3 Põhilised elementaarfunktsioonid

> **Definitsioon 1.12**  
> Põhiliste elementaarfunktsioonide all mõistetakse järgmisi funktsioone:
> 1. **Konstantne funktsioon:** $f(x) = c$[cite: 1]
> 2. **Astmefunktsioon:** $f(x) = x^a$[cite: 1]
> 3. **Eksponentfunktsioon:** $f(x) = a^x \quad (a > 0, a \neq 1)$[cite: 1]
> 4. **Logaritmfunktsioon:** $f(x) = \log_a x \quad (a > 0, a \neq 1)$[cite: 1]
> 5. **Trigonomeetrilised funktsioonid:** $f(x) = \sin x, \, f(x) = \cos x, \, f(x) = \tan x$[cite: 1]
> 6. **Arkusfunktsioonid:** $f(x) = \arcsin x, \, f(x) = \arctan x$[cite: 1]

Toome välja põhiliste elementaarfunktsioonide omadused. Tähistame $X$ kaudu funktsiooni määramispiirkonda ja $Y$ kaudu muutumispiirkonda[cite: 1].

---

### 1.3.1 Konstantsed funktsioonid

* **Valem:** $f(x) = c, \, c \in \mathbb{R}$[cite: 1]
* **Määramis- ja muutumispiirkond:** $X = \mathbb{R}, \, Y = \{c\}$[cite: 1]
* **Omadused:** Paaris (kui $c = 0$, siis ka paaritu), tõkestatud[cite: 1].

---

### 1.3.2 Astmefunktsioonid

Astmefunktsiooni $f(x) = x^a$ määramispiirkond, muutumispiirkond ja graafik sõltuvad astmest $a$[cite: 1].

1. **Kui $a \in \mathbb{N}$:**
   * **Positiivne paaritu täisarv** ($f(x) = x, x^3, x^5, \dots$):
     * $X = \mathbb{R}, \, Y = \mathbb{R}$[cite: 1]
     * Paaritu, üksühene[cite: 1]
     * Pöördfunktsioon: $f^{-1}(x) = x^{1/a}$[cite: 1]
   * **Positiivne paarisarv** ($f(x) = x^2, x^4, x^6, \dots$):
     * $X = \mathbb{R}, \, Y = [0, \infty)$[cite: 1]
     * Paaris[cite: 1]

2. **Kui $a = \frac{n}{m}$ (taandatud murd, $n, m \in \mathbb{N}$), siis $f(x) = x^{n/m} = \sqrt[m]{x^n}$:**[cite: 1]
   * Kui $m$ on paaritu arv, siis $X = \mathbb{R}$[cite: 1].
   * Kui $m$ on paarisarv, siis $X = [0, \infty)$[cite: 1].
   * *Näide ($m$ on paaritu):* $f(x) = \sqrt[m]{x} \implies X = \mathbb{R}, Y = \mathbb{R}$, paaritu, üksühene, pöördfunktsioon $f^{-1}(x) = x^m$[cite: 1].
   * *Näide ($m$ on paaris):* $f(x) = \sqrt[m]{x} \implies X = [0, \infty), Y = [0, \infty)$, üksühene, pöördfunktsioon $f^{-1}(x) = x^m, x \in [0, \infty)$[cite: 1].

3. **Kui $a$ on negatiivne täisarv:**
   * $f(x) = x^a = \frac{1}{x^{-a}}$, pole määratud kohal $x = 0$[cite: 1].
   * **Negatiivne paaritu täisarv** ($f(x) = x^{-1}, x^{-3}, \dots$): $X = \mathbb{R} \setminus \{0\}, Y = \mathbb{R} \setminus \{0\}$, paaritu, üksühene, pöördfunktsioon $f^{-1}(x) = x^{1/a}$[cite: 1].
   * **Negatiivne paarisarv** ($f(x) = x^{-2}, x^{-4}, \dots$): $X = \mathbb{R} \setminus \{0\}, Y = (0, \infty)$, paaris[cite: 1].

---

### 1.3.3 Eksponentfunktsioonid

Eksponentfunktsioonid esinevad sageli kasvu ja kahanemist kirjeldavates mudelites[cite: 1]. Kui $a > 1$, siis funktsiooni $a^x$ väärtused kasvavad argumendi kasvades; kui $0 < a < 1$, siis funktsiooni $a^x$ väärtused kahanevad[cite: 1]. Kasutatakse populatsiooni kasvu, radioaktiivse aine lagunemise ja liitintressi kirjeldamisel[cite: 1].

* **Valem:** $f(x) = a^x \quad (a > 0, a \neq 1)$[cite: 1]
* **Piirkonnad:** $X = \mathbb{R}, \, Y = (0, \infty)$[cite: 1]
* **Omadus:** Üksühene, pöördfunktsioon $f^{-1}(x) = \log_a x$[cite: 1].

**Omadus 1.4.**
1. $a^{x+y} = a^x a^y$[cite: 1]
2. $a^{x-y} = \frac{a^x}{a^y} \quad (a \neq 0)$[cite: 1]
3. $a^{xy} = (a^x)^y$[cite: 1]
4. $(ab)^x = a^x b^x$[cite: 1]
5. $a^0 = 1 \quad (a \neq 0)$[cite: 1]
6. $a^{-1} = \frac{1}{a} \quad (a \neq 0)$[cite: 1]

---

### 1.3.4 Logaritmfunktsioonid

Logaritmfunktsioon $y = \log_a x$, $a > 0, a \neq 1$[cite: 1]. Kõige sagedamini kasutatakse naturaallogaritmi $\ln x = \log_e x$[cite: 1].

* **Piirkonnad:** $X = (0, \infty), \, Y = \mathbb{R}$[cite: 1]
* **Omadus:** Üksühene, pöördfunktsioon $f^{-1}(x) = a^x$[cite: 1].

**Omadus 1.5.**
1. $\log_a(xy) = \log_a |x| + \log_a |y|$[cite: 1]
2. $\log_a \frac{x}{y} = \log_a |x| - \log_a |y|$[cite: 1]
3. $\log_a x^c = c \log_a |x| \quad (c \in \mathbb{R})$[cite: 1]
4. $\log_a x = \frac{\log_b x}{\log_b a}$[cite: 1]
5. $x = a^{\log_a x} \quad (x > 0)$[cite: 1]
6. $\log_a 1 = 0$[cite: 1]
7. $\log_a a = 1$[cite: 1]

**Näide 1.8.**  
Iga eksponentfunktsiooni $a^x$, kus $a > 0$, saab esitada naturaallogaritmi abil kujul:
$$a^x = e^{\ln a^x} = e^{x \ln a}$$[cite: 1]
Näiteks $2^x = e^{x \ln 2}$[cite: 1]. Seda esitust kasutatakse hiljem eksponentfunktsioonide ja muutuvat astendajat sisaldavate funktsioonide diferentseerimisel[cite: 1].

---

### 1.3.5 Trigonomeetrilised funktsioonid

Funktsioonid $\sin x$ ja $\tan x$ ei ole kogu määramispiirkonnas üksühesed[cite: 1]. Sobivale vahemikule ahendatuna on neil pöördfunktsioonid $\arcsin x$ ja $\arctan x$[cite: 1].

* **Siinusfunktsioon $f(x) = \sin x$:**
  * $X = \mathbb{R}, \, Y = [-1, 1]$[cite: 1]
  * Paaritu, tõkestatud, periood $2\pi$[cite: 1].

* **Koosinusfunktsioon $f(x) = \cos x$:**
  * $X = \mathbb{R}, \, Y = [-1, 1]$[cite: 1]
  * Paaris, tõkestatud, periood $2\pi$[cite: 1].

* **Tangensfunktsioon $f(x) = \tan x = \frac{\sin x}{\cos x}$:**
  * $X = \mathbb{R} \setminus \left\{ \frac{\pi}{2} + k\pi : k \in \mathbb{Z} \right\}, \, Y = \mathbb{R}$[cite: 1]
  * Paaritu, periood $\pi$[cite: 1].

---

### 1.3.6 Arkusfunktsioonid

* **Arkussiinus $f(x) = \arcsin x$:**
  * Funktsiooni $\sin x$ pöördfunktsioon vahemikus $\left[-\frac{\pi}{2}, \frac{\pi}{2}\right]$[cite: 1].
  * $X = [-1, 1], \, Y = \left[-\frac{\pi}{2}, \frac{\pi}{2}\right]$[cite: 1]
  * Paaritu, tõkestatud, üksühene[cite: 1].
  * Pöördfunktsioon: $f^{-1}(x) = \sin x, \, x \in \left[-\frac{\pi}{2}, \frac{\pi}{2}\right]$[cite: 1].

* **Arkustangens $f(x) = \arctan x$:**
  * Funktsiooni $\tan x$ pöördfunktsioon vahemikus $\left(-\frac{\pi}{2}, \frac{\pi}{2}\right)$[cite: 1].
  * $X = \mathbb{R}, \, Y = \left(-\frac{\pi}{2}, \frac{\pi}{2}\right)$[cite: 1]
  * Paaritu, tõkestatud, üksühene[cite: 1].
  * Pöördfunktsioon: $f^{-1}(x) = \tan x, \, x \in \left(-\frac{\pi}{2}, \frac{\pi}{2}\right)$[cite: 1].

---

## 1.4 Elementaarfunktsioonid

> **Definitsioon 1.13**  
> **Elementaarfunktsioonideks** nimetatakse funktsioone, mis on saadavad põhilistest elementaarfunktsioonidest lõpliku arvu aritmeetiliste tehete ja liitfunktsiooni moodustamise teel[cite: 1].

**Näide 1.9.**
* Funktsioon $f(x) = \frac{\arctan x}{\sqrt{x^2 + 1}}$ on elementaarfunktsioon, sest see on saadavad põhilistest elementaarfunktsioonidest $f_1(x) = \arctan x$, $f_2(x) = \sqrt{x}$, $f_3(x) = x^2$ ja $f_4(x) = 1$[cite: 1]:
  $$f(x) = \frac{f_1(x)}{f_2(f_3(x) + f_4(x))}$$[cite: 1]
* Funktsioon $f(x) = |x|$ on elementaarfunktsioon, sest on esitatav esituse $f(x) = |x| = \sqrt{x^2}$ kaudu[cite: 1].
* Signumfunktsioon:
  $$f(x) = \operatorname{sgn} x = \begin{cases} 1, & x > 0 \\ 0, & x = 0 \\ -1, & x < 0 \end{cases}$$
  **ei ole** elementaarfunktsioon[cite: 1].

---

## 1.5 Funktsiooni graafiku teisendused

Funktsiooni graafiku teisenduste abil saab tuntud funktsioonide graafikutest saada uute funktsioonide graafikuid[cite: 1].

Oletame, et funktsiooni $f$ graafik on teada[cite: 1]. Olgu $a > 0$ ja $b > 1$[cite: 1].

### Argumendi muutmine
* $g(x) = f(x + a)$: graafik nihkub **vasakule** $a$ ühiku võrra[cite: 1].
* $g(x) = f(x - a)$: graafik nihkub **paremale** $a$ ühiku võrra[cite: 1].
* $g(x) = f(bx)$: graafik surutakse horisontaalselt **kokku** $b$-kordselt[cite: 1].
* $g(x) = f\left(\frac{x}{b}\right)$: graafik venitatakse horisontaalselt **välja** $b$-kordselt[cite: 1].
* $g(x) = f(-x)$: graafik peegeldatakse **$y$-telje** suhtes[cite: 1].

### Funktsiooni väärtuse muutmine
* $g(x) = f(x) + a$: graafik nihkub **üles** $a$ ühiku võrra[cite: 1].
* $g(x) = f(x) - a$: graafik nihkub **alla** $a$ ühiku võrra[cite: 1].
* $g(x) = b f(x)$: graafik venitatakse vertikaalselt **välja** $b$-kordselt[cite: 1].
* $g(x) = \frac{f(x)}{b}$: graafik surutakse vertikaalselt **kokku** $b$-kordselt[cite: 1].
* $g(x) = -f(x)$: graafik peegeldatakse **$x$-telje** suhtes[cite: 1].
* $g(x) = |f(x)|$: $x$-teljest allpool asuv osa peegeldatakse $x$-telje suhtes ülespoole; $x$-teljel ja üleval asuv osa jääb samaks[cite: 1].

---

**Näide 1.10.**  
Vaatleme funktsiooni:
$$g(x) = 1 - 2 \arcsin(x + 1)$$[cite: 1]

Lähtume põhielementaarfunktsioonist $f(x) = \arcsin x$, mille $X_f = [-1, 1]$ ja $Y_f = \left[-\frac{\pi}{2}, \frac{\pi}{2}\right]$[cite: 1].  
Siis $g(x) = 1 - 2f(x + 1)$[cite: 1].

1. **Määramispiirkond $X_g$:**  
   Arkussiinuse argument peab kuuluma lõiku $[-1, 1]$[cite: 1]:
   $$-1 \le x + 1 \le 1 \implies -2 \le x \le 0 \implies X_g = [-2, 0]$$[cite: 1]

2. **Muutumispiirkond $Y_g$:**  
   Kuna $-\frac{\pi}{2} \le \arcsin(x + 1) \le \frac{\pi}{2}$[cite: 1], siis:
   $$-\pi \le -2 \arcsin(x + 1) \le \pi$$[cite: 1]
   $$1 - \pi \le 1 - 2 \arcsin(x + 1) \le 1 + \pi \implies Y_g = [1 - \pi, 1 + \pi]$$[cite: 1]

3. **Graafiku tegemise sammud (abifunktsioonid):**
   * $g_1(x) = f(x + 1) = \arcsin(x + 1)$ — nihutamine **vasakule** 1 ühiku võrra[cite: 1].
   * $g_2(x) = 2 g_1(x) = 2 \arcsin(x + 1)$ — vertikaalne **venitamine** teguriga 2[cite: 1].
   * $g_3(x) = -g_2(x) = -2 \arcsin(x + 1)$ — peegeldamine **$x$-telje** suhtes[cite: 1].
   * $g(x) = g_3(x) + 1 = 1 - 2 \arcsin(x + 1)$ — nihutamine **üles** 1 ühiku võrra[cite: 1].
