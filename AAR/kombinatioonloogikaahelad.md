loofika pohifuncs


```mermaid
graph LR
    graph TD
    subgraph "JA-elemendid (AND)"
        A1[L1]
    end

    subgraph VÕI-element (OR)
        AND1 --> OR[OR / VÕI]
        OR --> F[Väljund f]
    end
```

| L1 | L2 | False | AND | L1·L2̄ | L1 | L1̄·L2 | L2 | XOR | OR | NOR | XNOR | L2̄ | L1̄+L2 | L1̄ | L1+L2̄ | NAND | True |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 1 |
| 1 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 1 |

OR (V,+)
AND (korrutamine, tagurpidi V)
XOR (+ ringi sees)
XNOR (punkt ringi sees)
Puhver f = L
NOT (f = L kriips yleval)
NOR (f = L nool alla L = not (L1+L2) = NOT L1 NOT L2)
NAND (f = L1 nool yles L2 not (L1+L2) = NOT L1 NOt L2)

**Loogikaelementide praktiline teostus**

NOT
* Kui lüliti on lahti, siis on väljundis pinge $U_\text{allikas}$[cite: 5]
* Kui lüliti on kinni, on väljundis pinge 0[cite: 5]
* Sama asja saaks teha ka transistori kasutades[cite: 5]
* Kui $U_\text{sisend} = 0$, siis on "lüliti" lahti[cite: 5]
* Kui $U_\text{sisend} = U_\text{allikas}$, siis on "lüliti" kinni[cite: 5]
* Ei-ahel (NOT)[cite: 5]

**Pinge ülekarakteristik**

* $U_\text{väljund} \approx U_\text{allikas}$, kui $U_\text{sisend} < U_\text{lävi} - \delta$
* $U_\text{väljund} \approx 0$, kui $U_\text{sisend} > U_\text{lävi} + \delta$

Myra olemasolu sunnib meid seadma teatava keelatud ala loogiliste olekute 0 ja 1 vahel
Signaali levimisel võib pinge muutuda, seetõttu on värati väljundis nõutavad ja sisendis aksepteeritavad pinged nats aksepteeritavad

pinge sisendis muutub x aja jooksul ss kulub y aeg, mille jooksul muutumine votab z aega
ehk languse aeg, ja tõusu aeg molemad 10-90% levimise viivis - aeg sisendi ja valjundi 50% vahel

NOR
* Kui mõlemad lülitid on lahti, siis on väljundis pinge $U_\text{allikas}$[cite: 6]
* Kui kasvõi üks lüliti on kinni, on väljundis pinge 0[cite: 6]
* Sama asja saaks teha ka transistori kasutades[cite: 6]
* Kui $U1_\text{sisend} = U2_\text{sisend} = 0$, siis on "lülitid" lahti[cite: 6]
* Kui $U1_\text{sisend} = U_\text{allikas}$ või $U2_\text{sisend} = U_\text{allikas}$, siis on üks "lüliti" kinni[cite: 6]
* NOR-ahel[cite: 6]

**NING-EI-ahel**

* Kui kasvõi üks lüliti on lahti, siis on väljundis pinge $U_\text{allikas}$
* Kui mõlemad lülitid on kinni, on väljundis pinge 0
* Sama asja saaks teha ka transistori kasutades
* Kui $U1_\text{sisend} = 0$ või $U2_\text{sisend} = 0$, siis on üks "lüliti" lahti
* Kui $U1_\text{sisend} = U2_\text{sisend} = U_\text{allikas}$, siis on "lülitid" kinni
* NAND-ahel

**CMOS-ahelad (1)**

* *Metal-oxide semiconductor*[cite: 8]
  * n-kanaliga[cite: 8]
  * p-kanaliga[cite: 8]
* Kui $U_\text{värav} = 0$, siis on "lüliti" lahti[cite: 8]
* Kui $U_\text{värav} = U_\text{allikas}$, siis on "lüliti" kinni[cite: 8]

**CMOS-ahelad (2)**

* *Metal-oxide semiconductor*[cite: 9]
  * n-kanaliga[cite: 9]
  * p-kanaliga[cite: 9]
* Kui $U_\text{värat} = 0$, siis on "lüliti" kinni[cite: 9]
* Kui $U_\text{värat} = U_\text{allikas}$, siis on "lüliti" lahti[cite: 9]
* **MURE: voolutarve ühes asendis väga suur!**[cite: 9]

**KMOP-tehnoloogiaga EI**

* KMOP (*CMOS - Complementary metal-oxide semiconductor*)[cite: 10]
  * Üks n-kanaliga transistor[cite: 10]
  * Üks p-kanaliga transistor[cite: 10]
* Kui $U_\text{värat} = 0$, siis on[cite: 10]
  * NMOP-transistor lahti[cite: 10]
  * PMOP-transistor kinni[cite: 10]
* Kui $U_\text{värat} = U_\text{allikas}$, siis on[cite: 10]
  * NMOP-transistor kinni[cite: 10]
  * PMOP-transistor lahti[cite: 10]
* **Stabiilses olekus voolutarve minimaalne!**[cite: 10]

| Sisend | $U_\text{sisend}$ | T1 | T2 | $U_\text{väljund}$ | Väljund |
| :---: | :---: | :---: | :---: | :---: | :---: |
| **0** | madal | kinni | lahti | kõrge | **1** |
| **1** | kõrge | lahti | kinni | madal | **0** |

**KMOP-tehnoloogiaga NING-EI**

* Kui $U_\text{värav} = 0$, siis on[cite: 11]
  * NMOP-transistor lahti[cite: 11]
  * PMOP-transistor kinni[cite: 11]
* Kui $U_\text{värav} = U_\text{allikas}$, siis on[cite: 11]
  * NMOP-transistor kinni[cite: 11]
  * PMOP-transistor lahti[cite: 11]

| $U1_\text{s}$ | $U2_\text{s}$ | T1 | T2 | T3 | T4 | $U_\text{v}$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **0** | **0** | kinni | kinni | lahti | lahti | **1** |
| **0** | **1** | kinni | lahti | lahti | kinni | **1** |
| **1** | **0** | lahti | kinni | kinni | lahti | **1** |
| **1** | **1** | lahti | lahti | kinni | kinni | **0** |

---

**KMOP-tehnoloogiaga EI-EGA**

* Kui $U_\text{värav} = 0$, siis on[cite: 11]
  * NMOP-transistor lahti[cite: 11]
  * PMOP-transistor kinni[cite: 11]
* Kui $U_\text{värav} = U_\text{allikas}$, siis on[cite: 11]
  * NMOP-transistor kinni[cite: 11]
  * PMOP-transistor lahti[cite: 11]

| $U1_\text{s}$ | $U2_\text{s}$ | T1 | T2 | T3 | T4 | $U_\text{v}$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **0** | **0** | kinni | kinni | lahti | lahti | **1** |
| **0** | **1** | kinni | lahti | lahti | kinni | **0** |
| **1** | **0** | lahti | kinni | kinni | lahti | **0** |
| **1** | **1** | lahti | lahti | kinni | kinni | **0** |

KUI TRANSISTOR SAAB VOOLU SS LAHEB KINNI!!!

Binaarloogika algebra 

Aksioomid

kommutatiivsus x + y = y + x | xy = yx (argumentide jarjekorda voib tehtes muuta)

distibutiivsus x + yz = (x + y)(x + z) | x(y + z) = xy + xz

identsus 0 + x = x | 1x = x

täiend x + not x = 1 | x * not x = 0


Sulgude puudumisel tuleb tehteid teha selles jarjestuses
1. NOT
2. AND
3. OR

Binaarloogika seadused
Domineerimine 1 + x + y = 1 | 0xy = 0

Samaväärsus x + x = x | xx = x

Assotsiatiivsus (x + y) + z = x + (y + z) | (xy)z = x(yz)

Eituse eitamine NOT (NOT x) = x

De Morgani seadus NOT ( x + y) = (NOT x)(NOT y) | NOT (xy) = NOT x + NOT y

Kleepimisseadus: (x + y)(x̄ + z)(y + z) = (x + y)(x̄ + z) | xy + x̄z + yz = xy + x̄z

Neelduvus: x + xy = x | x(x + y) = x
