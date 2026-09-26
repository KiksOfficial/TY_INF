# Peatükk 3: Funktsiooni tuletis

## 3.1 Tuletise definitsioon

Funktsiooni tuletis näitab selle funktsiooni väärtuse muutumise kiirust funktsiooni argumendi muutumisel.

### Argumendi ja funktsiooni muut
* **Argumendi muut ($\Delta x$):** Anname argumendile $x_0$ muudu $\Delta x$. Argumendi uus väärtus on $x = x_0 + \Delta x$.
* **Funktsiooni muut ($\Delta y$):** 
  $$\Delta y = \text{väärtus lõpp-punktis} - \text{väärtus algpunktis} = f(x_0 + \Delta x) - f(x_0) = f(x) - f(x_0)$$

### Tuletise tuletamine ja definitsioon
Funktsiooni muudu ja argumendi muudu suhe väljendab keskmist muutumiskiirust:
$$\frac{\Delta y}{\Delta x} = \frac{f(x_0 + \Delta x) - f(x_0)}{\Delta x} = \frac{f(x) - f(x_0)}{x - x_0}$$

Kui $\Delta x \to 0$ (ehk $x \to x_0$), saame hetkelise muutumiskiiruse.

> **Definitsioon:** Funktsiooni $f$ tuletiseks punktis $x_0$ nimetatakse piirväärtust:
> $$f'(x_0) = \lim_{x \to x_0} \frac{f(x) - f(x_0)}{x - x_0} = \lim_{\Delta x \to 0} \frac{f(x_0 + \Delta x) - f(x_0)}{\Delta x}$$

### Näide: $f(x) = x^2$ tuletis kohal $x_0 = 3$
* Olgu $x_0 = 3$, siis $f(x_0) = f(3) = 3^2 = 9$.
* Arvutame tuletise piirväärtusena definitsiooni järgi:
  $$f'(3) = \lim_{x \to 3} \frac{x^2 - 9}{x - 3} = \lim_{x \to 3} \frac{(x - 3)(x + 3)}{x - 3} = \lim_{x \to 3} (x + 3) = 3 + 3 = 6$$

---

## 3.2 Funktsiooni tuletise leidmine

### Põhiliste elementaarfunktsioonide tuletised
* $(c)' = 0$ (kus $c$ on konstant)
* $(x^\alpha)' = \alpha x^{\alpha - 1}$
  * **Erijuhud astmefunktsioonidest:**
    * $(\sqrt{x})' = (x^{1/2})' = \frac{1}{2} x^{-1/2} = \frac{1}{2\sqrt{x}}$
    * $\left(\frac{1}{x}\right)' = (x^{-1})' = -1 \cdot x^{-2} = -\frac{1}{x^2}$
* $(e^x)' = e^x$
* $(a^x)' = a^x \ln a$
* $(\ln |x|)' = \frac{1}{x}$
* $(\log_a x)' = \frac{1}{x \ln a}$
* $(\sin x)' = \cos x$
* $(\cos x)' = -\sin x$
* $(\tan x)' = \frac{1}{\cos^2 x}$
* $(\arcsin x)' = \frac{1}{\sqrt{1 - x^2}}$
* $(\arctan x)' = \frac{1}{1 + x^2}$

### Diferentseerimisreeglid
Olgu $u = u(x)$ ja $v = v(x)$ diferentseeruvad funktsioonid ning $c$ konstant:
1. **Summa ja vahe tuletis:** $(u \pm v)' = u' \pm v'$
2. **Konstandiga korrutis:** $(c \cdot u)' = c \cdot u'$
3. **Korrutise tuletis:** $(u \cdot v)' = u'v + uv'$
4. **Jagatise tuletis:** $\left(\frac{u}{v}\right)' = \frac{u'v - uv'}{v^2}$

---

## 3.3 Liitfunktsiooni tuletis

Kui $y = f(g(x))$, siis selle tuletis võrdub välise funktsiooni tuletisega sisemise funktsiooni kohal korrutatult sisemise funktsiooni tuletisega:
$$(f(g(x)))' = f'(g(x)) \cdot g'(x)$$

---

## 3.4 Kõrgemat järku tuletised

* **Teist järku tuletis:** Funktsiooni $f$ esimest järku tuletise tuletis:
  $$f''(x) = (f'(x))'$$
* **$n$-ndat järku tuletis:** $(n-1)$-ndat järku tuletise tuletis:
  $$f^{(n)}(x) = (f^{(n-1)}(x))'$$

## 3.5 Funktsiooni diferentsiaal

### Diferentsiaali mõiste ja valem
Funktsiooni $y = f(x)$ **diferentsiaaliks** (tähis $\mathrm{d}y$) nimetatakse funktsiooni tuletise ja argumendi muudu (diferentsiaali) $\mathrm{d}x$ korrutist.

$$\mathrm{d}y = f'(x) \, \mathrm{d}x$$

* **$\mathrm{d}x$** — argumendi diferentsiaal ($\mathrm{d}x = \Delta x$)
* **$\mathrm{d}y$** — funktsiooni diferentsiaal (funktsiooni muutus piki puutujat)

### Seos tuletisega
Tuletist saab esitada kahe diferentsiaali jagatisena:
$$\frac{\mathrm{d}y}{\mathrm{d}x} = f'(x)$$

### Geomeetriline tähendus
* **$\Delta y$ (funktsiooni tegelik muut):** $f(x + \Delta x) - f(x)$ graafikut pidi.
* **$\mathrm{d}y$ (diferentsiaal):** funktsiooni muut piki graafiku puutujat.
* Kui $\Delta x \to 0$, siis $\Delta y \approx \mathrm{d}y$.

### Näide
Leida funktsiooni $y = 3x^2 + 5x$ diferentsiaal.
1. Leiame tuletise: $y' = 6x + 5$
2. Kirjutame diferentsiaali: $\mathrm{d}y = (6x + 5) \, \mathrm{d}x$
