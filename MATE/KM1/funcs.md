# PEATÜKK 1: FUNKTSIOONID (LÜHIKONSPEKT)

## 1. Põhimõisted ja valemid
* **Funktsioon ($y = f(x)$):** Eeskiri, mis seab igale $x \in X$ vastavusse täpselt ühe $y \in \mathbb{R}$[cite: 1].
* **$X$ (määramispiirkond):** Argumendi $x$ lubatud väärtused (loomulik määramispiirkond: piirkond, kus eeskiri omab mõtet)[cite: 1].
* **$Y$ (muutumispiirkond):** Funktsiooni väärtuste $y$ hulk[cite: 1].
* **Tehted:** $(f \pm g)(x)$, $(fg)(x)$ ja $\left(\frac{f}{g}\right)(x)$ tehakse piirkondade ühisosas $X_1 \cap X_2$ (jagatises $g(x) \neq 0$)[cite: 1].
* **Liitfunktsioon:** $(g \circ f)(x) = g(f(x))$[cite: 1].
* **Naturaalalusele viimine:** $a^x = e^{x \ln a}$[cite: 1].

---

## 2. Funktsioonide omadused
* **Paarisfunktsioon:** $f(-x) = f(x) \implies$ sümmeetriline $y$-telje suhtes[cite: 1].
* **Paaritu funktsioon:** $f(-x) = -f(x) \implies$ sümmeetriline nullpunkti suhtes[cite: 1].
* **Tõkestatud:** Leidub $C > 0$ nii, et $|f(x)| \le C$ iga $x$ korral[cite: 1].
* **Üksühene (injektiivne):** Kui $x_1 \neq x_2$, siis $f(x_1) \neq f(x_2)$ (horisontaalsirge lõikab graafikut ülimalt ühes punktis)[cite: 1].
* **Pöördfunktsioon ($f^{-1}$):** Eksisteerib vaid üksühestel funktsioonidel[cite: 1]. Graafik on sümmeetriline sirge $y = x$ suhtes[cite: 1].
* **Pidevus:** Kõik elementaarfunktsioonid on pidevad oma määramispiirkonnas.

---

## 3. Põhilised elementaarfunktsioonid

| Funktsioon | Määramispiirkond ($X$) | Muutumispiirkond ($Y$) | Omadused |
| :--- | :--- | :--- | :--- |
| **$f(x) = c$** | $\mathbb{R}$[cite: 1] | $\{c\}$[cite: 1] | Paaris, tõkestatud[cite: 1] |
| **$f(x) = x^n$ ($n$ paaris)** | $\mathbb{R}$[cite: 1] | $[0, \infty)$[cite: 1] | Paaris[cite: 1] |
| **$f(x) = x^n$ ($n$ paaritu)** | $\mathbb{R}$[cite: 1] | $\mathbb{R}$[cite: 1] | Paaritu, üksühene[cite: 1] |
| **$f(x) = a^x$ ($a>0, a \neq 1$)** | $\mathbb{R}$[cite: 1] | $(0, \infty)$[cite: 1] | Üksühene, pöörd: $\log_a x$[cite: 1] |
| **$f(x) = \log_a x$** | $(0, \infty)$[cite: 1] | $\mathbb{R}$[cite: 1] | Üksühene, pöörd: $a^x$[cite: 1] |
| **$f(x) = \sin x$** | $\mathbb{R}$[cite: 1] | $[-1, 1]$[cite: 1] | Paaritu, tõkestatud, $T = 2\pi$[cite: 1] |
| **$f(x) = \cos x$** | $\mathbb{R}$[cite: 1] | $[-1, 1]$[cite: 1] | Paaris, tõkestatud, $T = 2\pi$[cite: 1] |
| **$f(x) = \tan x$** | $\mathbb{R} \setminus \{\frac{\pi}{2} + k\pi\}$[cite: 1] | $\mathbb{R}$[cite: 1] | Paaritu, $T = \pi$[cite: 1] |
| **$f(x) = \arcsin x$** | $[-1, 1]$[cite: 1] | $\left[-\frac{\pi}{2}, \frac{\pi}{2}\right]$[cite: 1] | Paaritu, üksühene, tõkestatud[cite: 1] |
| **$f(x) = \arctan x$** | $\mathbb{R}$[cite: 1] | $\left(-\frac{\pi}{2}, \frac{\pi}{2}\right)$[cite: 1] | Paaritu, üksühene, tõkestatud[cite: 1] |

---

## 4. Graafikute ja piirkondade teisendused
Olgu $X = [x_1, x_2]$, $Y = [y_1, y_2]$, $a > 0$ ja $b > 1$.

| Tehe / Avaldis | Uus $X$ | Uus $Y$ | Efekt graafikul |
| :--- | :--- | :--- | :--- |
| **$f(x \pm a)$** | $[x_1 \mp a, x_2 \mp a]$[cite: 1] | $[y_1, y_2]$[cite: 1] | Nihe horisontaalselt ($+a$ vasakule, $-a$ paremale)[cite: 1] |
| **$f(-x)$** | $[-x_2, -x_1]$ | $[y_1, y_2]$[cite: 1] | Peegeldus $y$-telje suhtes[cite: 1] |
| **$f(bx)$** | $\left[\frac{x_1}{b}, \frac{x_2}{b}\right]$ | $[y_1, y_2]$[cite: 1] | Kokkusurumine horisontaalselt $b$ korda[cite: 1] |
| **$f\left(\frac{x}{b}\right)$** | $[b \cdot x_1, b \cdot x_2]$ | $[y_1, y_2]$[cite: 1] | Venitamine horisontaalselt $b$ korda[cite: 1] |
| **$f(x) \pm a$** | $[x_1, x_2]$[cite: 1] | $[y_1 \pm a, y_2 \pm a]$[cite: 1] | Nihe vertikaalselt ($+a$ üles, $-a$ alla)[cite: 1] |
| **$-f(x)$** | $[x_1, x_2]$[cite: 1] | $[-y_2, -y_1]$ | Peegeldus $x$-telje suhtes[cite: 1] |
| **$b \cdot f(x)$** | $[x_1, x_2]$[cite: 1] | $[b \cdot y_1, b \cdot y_2]$[cite: 1] | Venitamine vertikaalselt $b$ korda[cite: 1] |
| **$\|f(x)\|$** | $[x_1, x_2]$[cite: 1] | $[\max(0, y_1), \max(\|y_1\|, \|y_2\|)]$ | Negatiivsed $y$-väärtused peegeldatakse üles[cite: 1] |
