# Peatükk 5: Määramata integraal ja integreerimise põhireeglid

## 1. Integraali ja diferentsiaali seos
* Integraali märk ja diferentsiaal ($d$) taandavad teineteist otse välja: $\int du = u + C$.
* Näide: $\int d(2 + \arctan x) = 2 + \arctan x + C = \arctan x + C$.

## 2. Astmeintegraalid ja murrud
* Põhireegel: $\int x^n \, dx = \frac{x^{n+1}}{n+1} + C$.
* Nimetajas olevad juured viiakse lugejasse negatiivsete astmetena.
  * Näide: $\int \frac{dx}{x\sqrt{x}} = \int x^{-\frac{3}{2}} \, dx = -\frac{2}{\sqrt{x}} + C$.
* Muutuja viimine diferentsiaali märgist läbi ($d(x)$ meetod):
  * $\int \sqrt{x} \, d\sqrt{x} = \frac{(\sqrt{x})^2}{2} + C = \frac{x}{2} + C$.
  * $\int (x - 3)^5 \, d(x - 3) = \frac{(x - 3)^6}{6} + C$.

## 3. Lineaarne asendus (kordajaga arvestamine)
Kuna integreerimine on tuletise võtmise vastupidine tehe, tuleb $x$-i kordajaga jagada (või arvestada ahelreegli mõjuga):
* **Trigonomeetrilised funktsioonid:** 
  * $\int \cos(2x) \, dx = \frac{1}{2}\sin(2x) + C$.
  * $\int \cos(1 - x) \, dx = -\sin(1 - x) + C$.
* **Eksponentfunktsioonid:**
  * $\int e^{3-x} \, dx = -e^{3-x} + C$.
* **Logaritmilised ja murdintegraalid:**
  * $\int \frac{1}{x + 7} \, dx = \ln|x + 7| + C$.
