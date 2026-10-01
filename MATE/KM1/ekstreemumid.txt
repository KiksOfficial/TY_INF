TULETISE RAKENDUSED (Peatükid 4.5–4.7)

=========================================
4.5 FUNKTSIOONI KASVAMINE JA KAHANEMINE
=========================================

Definitsioon 4.4
Funktsiooni f nimetatakse hulgas X:
1. kasvavaks, kui kõigi x1, x2 kuuluva hulka X korral tingimuse x1 < x2 puhul f(x1) <= f(x2);
2. kahanevaks, kui kõigi x1, x2 kuuluva hulka X korral tingimuse x1 < x2 puhul f(x1) >= f(x2).

Teoreem 4.4
Olgu funktsioon f diferentseeruv vahemikus (a, b):
1. Funktsioon f kasvab vahemikus (a, b) parajasti siis, kui f'(x) >= 0 iga x kuulub (a, b) korral.
2. Funktsioon f kahaneb vahemikus (a, b) parajasti siis, kui f'(x) <= 0 iga x kuulub (a, b) korral.

Geomeetriline tähendus:
- Kui f'(x) > 0, moodustab graafiku puutuja x-telje positiivse suunaga teravnurga.
- Kui f'(x) < 0, on puutujanurk nürinurk.


=========================================
4.6 FUNKTSIOONI LOKAALSED EKSTREEMUMID
=========================================

Definitsioon 4.5
- Lokaalne maksimum: Funktsioonil f on punktis c lokaalne maksimum, kui leidub delta > 0, nii et f(x) <= f(c) iga x kuulub (c - delta, c + delta) korral.
- Lokaalne miinimum: Funktsioonil f on punktis c lokaalne miinimum, kui leidub delta > 0, nii et f(x) >= f(c) iga x kuulub (c - delta, c + delta) korral.
- Mõisted: Arvu c nimetatakse lokaalse ekstreemumi kohaks ning punkti (c, f(c)) lokaalseks ekstreemumpunktiks.

Teoreem 4.5 (Fermat' teoreem)
Kui funktsioon f on diferentseeruv punktis c ja tal on selles punktis lokaalne ekstreemum, siis:
f'(c) = 0

Märkus:
1. Ekstreemum võib leiduda ka punktis, kus funktsioon EI OLE diferentseeruv (nt f(x) = |x| punktis x = 0).
2. Tingimus f'(c) = 0 ei taga veel ekstreemumi olemasolu (nt f(x) = x^3 kohal x = 0).

Definitsioon 4.6 ja Järeldus 4.6
- Kriitilised punktid: Funktsiooni määramispiirkonna punktid, kus f'(x) = 0 või kus funktsioon ei ole diferentseeruv.
- Järeldus: Lokaalne ekstreemum võib funktsioonil olla VAID kriitilises punktis.

Ekstreemumi tunnused tuletise märgi kaudu (c on pidev kriitiline punkt):
- c-st vasakul f'(x) > 0 ja paremal f'(x) < 0 --> Lokaalse MAKSIMUMI koht
- c-st vasakul f'(x) < 0 ja paremal f'(x) > 0 --> Lokaalse MIINIMUMI koht
- Märk ei muutu --> Ekstreemumit ei ole

Lause 4.1 (Ekstreemumi tunnus teise tuletise abil)
Olgu c funktsiooni f kriitiline punkt ning leidugu teine tuletis f''(c):
- Kui f''(c) > 0, on c lokaalse MIINIMUMI koht.
- Kui f''(c) < 0, on c lokaalse MAKSIMUMI koht.
- Kui f''(c) = 0, ei võimalda see tunnus otsustada.


=========================================
4.7 FUNKTSIOONI GLOBAALSED EKSTREEMUMID
=========================================

Definitsioon 4.7
Olgu funktsioon f määratud hulgal D:
- Globaalne maksimum (suurim väärtus): Punktis c kuulub hulka D, kui iga x kuulub D korral f(x) <= f(c).
- Globaalne miinimum (vähim väärtus): Punktis c kuulub hulka D, kui iga x kuulub D korral f(x) >= f(c).

Teoreem 4.7 (Weierstrassi teoreem)
Iga lõigus [a, b] pidev funktsioon saavutab selles lõigus oma suurima ja vähima väärtuse.

Lõigus [a, b] pideva funktsiooni globaalsete ekstreemumite leidmine:
1. Leida funktsiooni f kriitilised punktid.
2. Valida neist lõiku [a, b] kuuluvad punktid ning arvutada funktsiooni väärtused nendes punktides ja lõigu otspunktides a ja b.
3. Saadud väärtustest valida välja suurim ja vähim.
