Kaudne mood - operandi efektiivne address antakse registri adressina kus operandi aadress kirjas on
N1: Load R5,(R1)
esimese operandi vaartus registri R5 sisu, teise operandi vaartus registris R1 viidatud aadressil asuva malupesa sisu

register kus efektiivne aadress kirjas kutsutakse viidaks e pointeriks

Malu

- load R5,(R1)

LOC  arv 1

registrid

R1 LOC
R2 ...
R3 ...
R4 ...
R5 arv2 

tehe arv1 + arv2 kaudses moodis

R1 viitab malupesale LOC, kus asuv arv 1 viiakse registrisse R5

Load R2, COUNT kasutama nii abs kui ka registri moodi
Store R1,SUM sama, mis ylemine
Add R3,R3,#4 kasutame lisaks registri moodile immediate moodi
Load R7,(R3) kasutame lisaks registri moodile kaudset moodi 
Move R3, #j ei saa kasutada Load kaske, sest see on aind malust lugemiseks
Add R3, R0, #j - tegelik kuju

INdekseerimine ja massiivid/jadad
Indeks mood - operandu efektiivne aadress saadakse registri sisule const liitmisel
load R5, 40(R1)

CISC
complex instruction set computer
voimaldab kasutada erinea pikkusega kaske (kask saab olla pikem kui 1 sona)
Operand voib olla malu pesa

# Arvutiarhitektuur: Addresseerimisviisid

| Ingliskeelne nimi | Assembler süntaks | Aadressi kujunemine |
| :--- | :--- | :--- |
| **Immediate** | `#väärtus` | $\text{operand} = \text{väärtus}$ |
| **Register** | $R_i$ | $EA = R_i$ |
| **Absolute (Direct)** | $\text{LOC}$ | $EA = \text{LOC}$ |
| **Indirect** | $(R_i)$ | $EA = [R_i]$ |
| **Index** | $X(R_i)$ | $EA = [R_i] + X$ |
| **Base with index** | $(R_i, R_j)$ | $EA = [R_i] + [R_j]$ |
| **Base with index and offset** | $X(R_i, R_j)$ | $EA = [R_i] + [R_j] + X$ |
| **Relative** | $X(\text{PC})$ | $EA = [\text{PC}] + X$ |
| **Autoincrement** | $(R_i)+$ | $EA = [R_i];\ R_i\text{++}$ |
| **Autodecrement** | $-(R_i)$ | $R_i\text{--};\ EA = [R_i]$ |

---

### Mõisted ja tähised:
* **$EA$ (Effective Address):** Andmete tegelik lõplik aadress operatiivmälus (RAM).
* **$[R_i]$:** Registris $R_i$ sisalduv väärtus.
* **$\text{PC}$ (Program Counter):** Käsuloendur, mis näitab järgmise täidetava käsu aadressi.

staatus-register aka condition register
vaartus vastavalt 0 v 1
Z - null
N - negatiivne
V - overflow
C - carry out (kas oli 1 machine word sonast yleminek v ei)

moned kasud aind muudavad lippude vaartust
Add - ei muuda
AddsetCC - muudab

Add R1,R1,(R3) ja Add R3,R3,#4 saab votta 1 kasuks kokku
=
Aadd R1,(R3)+

Pinu (stack)

andmeid saab lugeda aind 1st otsast
nagu sooklast kandikute virn (LIFO ehk last in first out)
spets. register peab meles, millisel aadressil koige varskem element asub
pinu kasvab vaiksemate adressite suunas

RISC {
Pinusse panemine
Subtract SP,SP,#4
Store Rj,(SP)

Pinust votmine
Load Rj,(SP)
Add SP, SP,#4
}

CISC {
Pinusse panemine
Move-(SP), Rj

Pinust votmine 
Move Rj, (SP)+
}

Alamprogrammid

alamprogrammi valja kutsumine (call)
peale alamprogrammi valjakutsumist on vaja endisesse kohta tagasi jouda (return) (link register)

Subroutine linkage method

tagasi poordumise aadresse salvestatakse pinus (link registri sisu)
viimasse asjana votab registri pinust tagasi

Parameetrite edastamine 

alamprogrammi valjakutsusmisel tuleb saata sinna ka teatav hulk parameetreid
alamprogrammist naastes on pohiprogrammi midagi vaja tuua (kasutatakse pinu)

lisaks stack pointerile too kasuks 1 register frame pointer
frame pointer voimaldab muutujatele pinus mugavalt viidata
tavaks on et FP viitab vahetult tagasipoordumise aadressi peal olevale valjale

reaalses elus ei saa pinusse panna arvu kui ylemine piir on kaes
kui pinu pohi kaes on ei saa votta pinust arvu 
