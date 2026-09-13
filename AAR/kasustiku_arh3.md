
N1:
  Positive int -> negative int
  olgu arv +5 (0101) registris R1

  Not R1, R1 annab -6 (1010)
  Add, R1, R1, #1 annab -5 (1011)
N2:
  olgu meil vaja leida kas registris R1 oleva 3 bitise parempoolseim taht on X ehk 0101 1000 ehk 0x58

  And R1, 0xFF (jatab aind parempoolse osa registrist)
  Compare R1, 0x58
  Branch_if_[R1]=0

Arvude kirjapanek
for decimal
Add R1, R1,#27 VOI ADDI R6, R6,27

for binary
ADDI, R1, R1, %00011011

for hexa
(ADDI) 0x1B v $1B

Korrutamine ja jagammine

Enamuses kasustikke voimaldabad teha korrutamistehet:
Rk<-[Ri]x[Rj]
Multiply Rk,Ri,Rj
kui sisenduurused on n-bitised ss vastus voib olla kuni 2n-bittine
seega voib tulemuse salvestamiseks vaja 2 registrit

Moned kasustikud voimaldavad jagamistehet
Rk<-[Ri]/[Rj]
Divide Rk,Ri,Rj
siin on vaja salvestada taisosa ja jaak seega tulemus voib votta 2 registrit (Rk - taisosa, Rk+1 - jaak)

32 bitised args 32 bitise kasu sees

Or Rdst,Rscr,#Value //alumised 16 bitti
OrHigh Rdst,Rscr,#Value //ylemised 16 bitti

kuidas kirjutada 0x20004FF0

OrHigh R2,R0,#0x2000
Or R2,R2,#0x4FF0

Nihe

Paljudes rakendustes on tarvis bitte nihutada paremale v vasakule mingi arvu kohtade vorra

Loogline nihe 
LShiftL asukoht,arv
LShiftR asukoht,arv

Aritmeetiline nihe
AshiftR asukoht, arv

Pööre

Nihke ouhul lahevad osad bitid kaotsi a poorde puhul salvestame kogu info
Poore ilma ylekannet (carry) kasutamata
- RotateL asukoht, arv
- RotateR asukoht, arv

Poore carryt kasutades
- RotateLC asukoht, arv
- RotateRC asukoht, arv

Masinkood

CPU-s kaivitamiseks tleb koik kasud kodeerida 
see ple enam asm vaid bin aka Masinkood

Registri aadressid
32 registri puhul tleks 5 bitti 
meil on selles kasus vaja kirjeldada 3 registrit

yle jaab 17 bitti
operatsiooni koodi
adresseerunuse viiside jne jaoks

32 bitti
[00001|00000|00010|...]
R1|R0|R2|(argument nagu Add, Or jne...)
Add R1,R0,R2

Tarkvara

Load - LD 
Store - STR,ST 
Add - ADD,ADDI
Branch - BR,BGT,BLT

Sirektiivid

Twenty EQU 20 
Origin
Resverve
Dataword

Assembly jagub tulpadeks

Mem address label | Operation | Addressing or data inf aka operand | comments

driektiivid koodi alla 

ASM keeles kirjutatud programmid on binaarkoodis tahed
fail salvestatakse kovakettal
vaja tolkida masinkeelde
{
  OP koodid binaarkoodi
  sama lugu andmetega
  equ direktiiv
  nimed ja aadressid hargnemiseks, alamprogrammide jaoks, andmete asukoha jaoks
} seda koike teeb Assembler


2x labikaiguga assembler

esimese kaiguga pannakse kirja koik nimed
yhtlasi saavad nad ka numbrilised tahendused
teise labikaiguga asendatakse need nimed tegelikke addressite/numbrilise sisuga
aadressid suhtelised aka programmi alguse suhtes kirjeldatud 

programmi kaivitamine
programm loetakse kettalt mallu
esimese kasu aadress jouab programmiloendurisse
seda koike korraldab programm loader , mis peab olema teadlik programmi suurusest, malu aadressist, kuhu ta panna, esimese kasu asukohast, assember paneb selle info tavaliselt objekt-faili paisesse

linkimine
alamprogrammid, ka teiste poolt tehtud
rakendusprogramm linker
too lopuks on meil olemas loplik objeprogramm

raamatukogud ehk libraries 
erinevate alamprogrammide kogud, mida saame programmide kasutada
rakendusprogramm archiver teeb neud
programmeerija naitab millist lib soovib kasutada nt #include <stdio.h> ja linker votab vajaliku info ja lisab objeprogrammi

kompilaator

asm keeles progemine eeldab teadmisi konkreetsest masinast

korgkeeles progemine ei eelda esmalt asm tolgendamist ss masinakeelde

seda esimest teeb compiler

optimeerimisprobleemid {
  eriline tahelepanu tsyklitele
  voib-olla jupike koodi kohe asm keeles?

}

kompilaator tolgib korgkeele kasud masinale arusaadavaks masinkeeleks

t = (N x S) / F 
selleks et N oleks voimalikult vaie peab olema hea kasustik ja compiler peab seda eff kasutama

taktide arv ei soltu mitte aind valitud kaskudest vaid ka nende jarjekoorast

Lähtefailid -> compiler -> asm lahtefailid -> assembler (korjab koik asm failid ning muudab binaariks) -> objefail -> linker (lisab libs) -> objeprogramm 

debugger - leiab syntax vead 

OS - kaskude kogum ,mis haldab ressursside jagamisr, suhtlust, riistvara, interpetator jne

boot-strapping process {
  
}

N:
  olgu meil arvuti (cpu, malu, kettaseade, vorguseade)
  kaivitame programmi, mis loeb andmeid kettalt ja tootleb neid ss saadab tulemuse serverisse
  
  OS- loeb kovakettalt programmi malusse - os tombab programmi kaima - rakendus kysib os'ilt kettalt andmeid - os loeb ketast - rakendus rehkendab midagi andmetest - poordub os poole - os suhtleb vorguga - koontroll laheb os-le tagasi 
