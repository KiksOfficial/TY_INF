# $\lambda$-arvutus: $\eta$-reduktsioon ja reduktsioonijärjekorrad

## 1. $\eta$-reduktsioon (*eta-reduction*)

### Mõiste ja ekstensionaalsus
* **Ekstensionaalsus:** Loogikas tähendab see seda, et kaks funktsiooni $f$ ja $g$ on võrdsed, kui nad annavad võrdse sisendi ehk iga argumendi puhul sama tulemuse.
* **Vajadus:** $\beta\delta$-normaalkujul olevad termid (nt `add` ja $\lambda x y. \text{add } x y$) ei ole $\alpha$-ekvivalentsed, kuid käituvad väliselt identselt. $\eta$-reduktsioon võimaldab tuvastada selliste funktsioonide võrdsuse ($\beta\eta\delta$-võrdsus).

### Reegel
$$(\lambda x. e \, x) \to_\eta e \quad \text{kui } x \notin \text{FV}(e)$$
* **Tähendus:** Kui term on kujul $(\lambda x. e \, x)$ ja alamterm $e$ ei sisalda $x$-i vaba muutujana, saab ümbritseva $\lambda$ ja rakenduse (*application*) ära jätta.
* **Näide:** 
  $$(\lambda x y. \text{add } x y) = (\lambda x. \lambda y. (\text{add } x) y) \to_\eta (\lambda x. \text{add } x) \to_\eta \text{add}$$

---

## 2. Reduktsioonijärjekorrad

Termide lihtsustamine (väärtustamine) toimub reduktsiooni reeglite kaudu. Kuna termis võib olla mitu kohalikku teisendust (reekssi), on oluline valitud reduktsioonijärjekord.

### Standardsejärjekorra tüübid
1. **Normaaljärjekord (*Normal order*):**
   * Redutseerib alati **välimise vasakpoolse** alamtermi (väljast-sisse).
   * **Eelis:** Garanteerib normaalkuju saavutamise, kui see üldse eksisteerib.
   * **Puudus:** Võib tekitada dubleerivat tööd, kui parameetrit kasutatakse abstraktsiooni kehas mitu korda.
2. **Aplikatiivjärjekord (*Applicative order*):**
   * Redutseerib alati **sisemise vasakpoolse** alamtermi (seest-välja) — enne funktsioonile andmist arvutatakse argumentide väärtused.
   * **Eelis:** Kui argumenti kasutatakse funktsioonis mitu korda, võib see olla kiirem, sest argument arvutatakse läbi vaid üks kord.
   * **Puudus:** Võib jääda lõpmatusse tsüklisse ega leia normaalkuju, kui argument ei koondu (isegi kui funktsioon seda argumenti ei kasuta).

### Normaalkuju leiduvus ja lõputud tsüklid
* Redutseerimisel **ei ole normaalkuju leidumine garanteeritud** iga termi puhul (nt $\omega \omega = (\lambda x. x x)(\lambda x. x x)$ jääb lõpmatusse $\beta$-reduktsiooni tsüklisse).
* Mõnel termil eksisteerib normaalkuju, kuid selle saavutamine sõltub järjekorrast:
  * Term $(\lambda x. 1) (\omega \omega)$:
    * **Normaaljärjekord:** $\to_\beta 1$ (saavutab normaalkuju 1 sammuga, sest eirab argumenti $(\omega \omega)$).
    * **Aplikatiivjärjekord:** üritab enne välimist sammu väärtustada $(\omega \omega)$, tekitades lõputu tsükli.

---

## 3. Olulised teoreemid ja omadused

### Church-Rosseri teoreem
* **Sisu:** Kui termist $t$ saab redutseerida termid $u$ ja $v$ ($t \twoheadrightarrow_{\beta\eta} u$ ja $t \twoheadrightarrow_{\beta\eta} v$), siis leidub kindlasti selline term $k$, kuhu mõlemad lõpuks jõuavad ($u \twoheadrightarrow_{\beta\eta} k$ ja $v \twoheadrightarrow_{\beta\eta} k$).
* **Järeldus:** Reduktsiooni järjekorra valik võib teha lisatööd, kuid ei saa viia umbtänavasse, kust õige tulemus oleks kättesaamatu.

### Normaalkuju unikaalsus
* Kui termil $t$ leidub $\beta\eta$-normaalkuju, siis on see **ainulaadne** (unikaalne).

### Normaalkuju saavutatavus
* Kui termil on üldse olemas normaalkuju, siis **normaaljärjekorras redutseerimine tagab alati selle leidmise** lõpliku arvu sammude järel.
