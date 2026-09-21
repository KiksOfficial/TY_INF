# Kõrgema matemaatika konspekt: L'Hospitali reegel ja diferentsiaal

---

## 1. L'Hospitali reegel

L'Hospitali reeglit kasutatakse piirväärtuste leidmisel, kui tekib määramatus.

### Põhireegel
* **Määramatused:** Kui piirväärtuse arvutamisel tekib määramatus kujul **$\frac{0}{0}$** või **$\frac{\infty}{\infty}$**, siis leiame lugeja ja nimetaja tuletise eraldi.
* **Valem:** Kui uus piirväärtus eksisteerib, siis:
  $$\lim \frac{f(x)}{g(x)} = \lim \frac{f'(x)}{g'(x)}$$
* **Tähistus:** Võrdusmärgi kohale kirjutatakse `L'H` (nt $\stackrel{L'H}{=}$). Kui seda tähistust kasutada, ei pea sammul piirväärtuse märki (`lim`) uuesti välja kirjutama.
* **Korduv kasutamine:** Kui pärast tuletiste leidmist jääb määramatus ikka sisse, võib L'Hospitali reeglit uuesti rakendada.

### Olulised kitsendused
1. **Piirväärtuse olemasolu:** Kui tuletiste jagatise piirväärtust ei eksisteeri, **ei tohi** L meil L'Hospitali reeglit kasutada.
2. **Määramatus $0 \cdot \infty$:** Seda **ei tohi** lahendada korrutise kujul! Korrutis tuleb kõigepealt teisendada jagatise kujule:
   $$f(x) \cdot g(x) = \frac{f(x)}{\frac{1}{g(x)}} \quad \text{või} \quad \frac{g(x)}{\frac{1}{f(x)}}$$
   Pärast seda saab rakendada L'Hospitali reeglit.

---

## 2. Funktsiooni ekvivalentsused (Piirväärtused $x \to 0$ korral)

Kui $x \to 0$, saab kasutada järgmisi ekvivalentseid teisendusi:
* $\sin x \sim x$
* $\tan x \sim x$
* $\arctan x \sim x$

---

## 3. Geomeetriline tähendus ja puutuja

* **Funktsiooni tuletis** kohal $x_0$ tähistab funktsiooni graafiku **puutuja tõusu** ($k = f'(x_0)$).
* **Puutuja võrrand** on sirge võrrand:
  $$y = kx + b \quad \implies \quad y - y_0 = f'(x_0)(x - x_0)$$
* **Üleminekud:** Ühelt funktsioonilt teisele üleminekut (nt murdepunkte või nurki) näeme sellest, kui puutujate tõusud erinevad, või leiame lihtsalt puutuja tõusu abil funktsiooni käitumise.

---

## 4. Diferentsiaal ja funktsiooni muut

### Mõisted
* **Argumendi diferentsiaal ($dx$):** võrdub argumendi muuduga ($\Delta x$).
  $$dx = \Delta x$$
* **Funktsiooni diferentsiaal ($df(x)$ või $dy$):** funktsiooni tuletise ja argumendi muudu korrutis.
  $$df(x) = f'(x) \, dx$$

### Näited
1. **Üldine diferentsiaal:**
   $$f(x) = x^2 \implies df(x) = 2x \, dx$$

2. **Diferentsiaal punktis $x_0 = 3$:**
   $$df(3) = 2 \cdot 3 \, dx = 6 \, dx$$

3. **Konkreetse muudu $dx = 0{,}2$ korral ($x_0 = 3$):**
   $$df(3) = 2 \cdot 3 \cdot 0{,}2 = 1{,}2$$

---

## 5. Funktsiooni muudu ligikaudne arvutamine

* **Funktsiooni muut ($\Delta y$):**
  $$\Delta y = f(x_{\text{lõpp}}) - f(x_{\text{algus}}) = f(x_0 + \Delta x) - f(x_0)$$

* **Seos diferentsiaaliga:**
  Kui $dx$ (ehk $\Delta x$) on väga väike (läheneb nullile), siis funktsiooni muut on ligikaudu võrdne funktsiooni diferentsiaaliga:
  $$\Delta y \approx dy$$

* **Lähisväärtuste arvutamise valem:**
  $$f(x_0 + \Delta x) \approx f(x_0) + f'(x_0) \cdot \Delta x$$
