# Peatükk 5: Määramata integraal

## 5.1 Algfunktsioon ja määramata integraal

* **Algfunktsioon:** Funktsiooni $f(x)$ algfunktsiooniks hulgas $X$ nimetatakse funktsiooni $F(x)$, mille korral kehtib $F'(x) = f(x)$ iga $x \in X$ korral.
* **Algfunktsioonide hulk:** Kui $F(x)$ on funktsiooni $f(x)$ üks algfunktsioon, siis kõik selle funktsiooni algfunktsioonid avalduvad kujul $F(x) + C$, kus $C \in \mathbb{R}$ on suvaline konstant.
* **Määramata integraal:** Funktsiooni $f(x)$ kõigi algfunktsioonide hulka $F(x) + C$ nimetatakse funktsiooni $f(x)$ määramata integraaliks ja tähistatakse:
  $$\int f(x) \, dx = F(x) + C$$
  * $f(x)$ – integreeritav funktsioon
  * $f(x)\,dx$ – integreeritav avaldis
  * $x$ – integreerimismuutuja
  * $C$ – integreerimiskonstant

---
integraal du = u + C
integraal(x)d2x = integraal(x *(2x)')dx
$$\int \cos(3x) \, dx$$
   * Sisefunktsioon: $3x \Rightarrow (3x)' = 3$
   * **Tulemus:** $\frac{1}{3} \sin(3x) + C$

## 5.2 Määramata integraali leidmine

Integreerimine on diferentseerimise pöördtehe.

### Põhilised omadused:
1. **Tuletis ja integraal:** $\left( \int f(x) \, dx \right)' = f(x)$
2. **Diferentsiaal ja integraal:** $d\left( \int f(x) \, dx \right) = f(x) \, dx$
3. **Konstandi ettetoomine:** $\int c \cdot f(x) \, dx = c \int f(x) \, dx \quad (c \neq 0)$
4. **Summa ja vahe integreerimine:** $\int (f(x) \pm g(x)) \, dx = \int f(x) \, dx \pm \int g(x) \, dx$

### Põhiliste elementaarfunktsioonide integraalid:
* $\int 0 \, dx = C$
* $\int 1 \, dx = x + C$
* $\int x^\alpha \, dx = \frac{x^{\alpha+1}}{\alpha+1} + C \quad (\alpha \neq -1)$
* $\int \frac{1}{x} \, dx = \ln|x| + C$
* $\int e^x \, dx = e^x + C$
* $\int a^x \, dx = \frac{a^x}{\ln a} + C \quad (a > 0, a \neq 1)$
* $\int \sin x \, dx = -\cos x + C$
* $\int \cos x \, dx = \sin x + C$
* $\int \frac{1}{\cos^2 x} \, dx = \tan x + C$
* $\int \frac{1}{1 + x^2} \, dx = \arctan x + C$
* $\int \frac{1}{\sqrt{1 - x^2}} \, dx = \arcsin x + C$

---

## 5.3 Muutujavahetus integraalis

Kui integraali $\int f(x) \, dx$ ei saa otse põhivalemite abil leida, kasvatatakse tihti muutujavahetust.

### Võte/Teoreem:
Tehes muutujavahetuse $x = \varphi(t)$, kus $\varphi$ on diferentseeruv ja pööratav funktsioon, saame:
$$\int f(x) \, dx = \int f(\varphi(t)) \cdot \varphi'(t) \, dt$$

**Sammud:**
1. Valitakse uus muutuja $t = g(x)$ või $x = \varphi(t)$.
2. Arvutatakse vastav diferentsiaal $dx = \varphi'(t) \, dt$ (või $dt = g'(x) \, dx$).
3. Asendatakse integraalis kõik algse muutuja $x$ avaldised $t$ kaudu.
4. Integreeritakse saadud lihtsam integraal muutuja $t$ suhtes.
5. Asendatakse tulemuses $t$ tagasi algse muutuja $x$ avaldisega.
