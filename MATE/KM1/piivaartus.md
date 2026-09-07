# Peatükk 2: Funktsiooni piirväärtus ja pidevus

## 2.1 Funktsiooni piirväärtuse mõiste
Piirväärtus kirjeldab funktsiooni $f(x)$ käitumist punkti $a$ läheduses (mitte funktsiooni väärtust punktis $a$ eneses).

* **Ametlik definitsioon ($\varepsilon-\delta$ keeles):**
  Arv $A$ on funktsiooni $f$ piirväärtus punktis $a$ ($\lim_{x \to a} f(x) = A$), kui iga $\varepsilon > 0$ korral leidub selline $\delta > 0$, et kui $x \in X$ ja $x \in (a-\delta, a+\delta) \setminus \{a\}$, siis $f(x) \in (A-\varepsilon, A+\varepsilon)$.
* **Lõpmatu piirväärtus ($\lim_{x \to a} f(x) = \infty$):**
  Iga $E > 0$ korral leidub $\delta > 0$ nii, et kui $x \in (a-\delta, a+\delta) \setminus \{a\}$, siis $f(x) > E$.

---

## 2.2 Ühepoolsed piirväärtused ja piirväärtused lõpmatuses

* **Parempoolne piirväärtus:** $\lim_{x \to a+} f(x) = A$, kui $x \in (a, a+\delta) \Rightarrow f(x) \in (A-\varepsilon, A+\varepsilon)$.
* **Vasakpoolne piirväärtus:** $\lim_{x \to a-} f(x) = A$, kui $x \in (a-\delta, a) \Rightarrow f(x) \in (A-\varepsilon, A+\varepsilon)$.
* **Teoreem:** Piirväärtus $\lim_{x \to a} f(x)$ eksisteerib parajasti siis, kui mõlemad ühepoolsed piirväärtused eksisteerivad ja on võrdsed:
  $$\lim_{x \to a-} f(x) = \lim_{x \to a+} f(x) = \lim_{x \to a} f(x)$$
* **Piirväärtus lõpmatuses ($\lim_{x \to \infty} f(x) = A$):**
  Iga $\varepsilon > 0$ korral leidub $D > 0$ selliselt, et kui $x > D$, siis $f(x) \in (A-\varepsilon, A+\varepsilon)$.

---

## 2.3 Pidevad funktsioonid

* **Pidevuse definitsioon punktis:** Funktsioon $f$ on pidev punktis $a$, kui:
  $$\lim_{x \to a} f(x) = f(a)$$
* **Teoreem (tehted pidevate funktsioonidega):** Kui $f$ ja $g$ on pidevad punktis $x=a$, siis on punktis $a$ pidevad ka $f \pm g$, $fg$ ja $\frac{f}{g}$ (kui $g(a) \neq 0$).
* **Pidevus hulgal:** Funktsioon on pidev hulgal $X$, kui ta on pidev selle hulga igas punktis.
* **Põhiteoreem:** Kõik elementaarfunktsioonid on pidevad oma määramispiirkonnas.

---

## 2.4 Funktsiooni piirväärtuse omadused

Kui $\lim_{x \to a} f(x) = A$ ja $\lim_{x \to a} g(x) = B$ (mõlemad lõplikud):
1. $\lim (f(x) \pm g(x)) = A \pm B$
2. $\lim (c \cdot f(x)) = c \cdot A \quad (c \in \mathbb{R})$
3. $\lim (f(x) \cdot g(x)) = A \cdot B$
4. $\lim \frac{f(x)}{g(x)} = \frac{A}{B} \quad (B \neq 0)$

### Erilised piirväärtuste reeglid
* Kui $\lim |f(x)| = \infty \implies \lim \frac{1}{f(x)} = 0$
* Kui $\lim f(x) = 0$ (ja $f(x) \neq 0$) $\implies \lim \frac{1}{|f(x)|} = \infty$
* **Tõkestatud funktsiooni reegel:** Kui $f(x)$ on tõkestatud ja $\lim_{x \to a} g(x) = 0$, siis:
  $$\lim_{x \to a} (f(x) \cdot g(x)) = 0$$

---

## 2.5 Funktsiooni piirväärtuse leidmine ja määramatused

Tavalised määramatuste tüübid: $\left[\frac{0}{0}\right], \left[\frac{\infty}{\infty}\right], [\infty - \infty], [0 \cdot \infty], [0^0], [1^\infty], [\infty^0]$.

### Võtted määramatuste kõrvaldamiseks:
1. **Pidev funktsioon / määramatust pole:** Asenda $x = a$ otseselt avaldisse ($\lim_{x \to a} f(x) = f(a)$).
2. **Määramatus $\left[\frac{0}{0}\right]$:**
   * **Polünoomid:** Lahuta lugeja ja nimetaja teguriteks ning taanda ühine tegur $(x - a)$.
   * **Juured:** Kasuta kaaskohatisega korrutamist (nt $(a-b)(a+b) = a^2-b^2$) või tee muutujavahetus.
3. **Määramatus $\left[\frac{\infty}{\infty}\right]$:**
   * Too nii lugejas kui ka nimetajas sulgude ette $x$ kõige kõrgemas astmes ja taanda.
4. **Määramatus $[\infty - \infty]$:**
   * Teisenda avaldis ühisele nimetajale või korruta/jaga kaaskohatisega, et viia see kujule $\left[\frac{0}{0}\right]$ või $\left[\frac{\infty}{\infty}\right]$.
