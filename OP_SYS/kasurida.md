ls -> /bin/bash (shell/interpretaator) kutsub valja /bin/ls, mis korjab kausta sisu ning tagastab bashi

terminaliemulaator -graafiline rakendus (nt. kitty)
käsukeht ehk shell - interpretaator (nt shell)
käsuprogram (ls) täidab konkreetse ylesande

moned kasud nagu cd pwd on built in

user@host:~$

user - kasutaja nimi
host - arvuti nimi
~ - asud kodukaustas
$ - tavakasutaja
# - root

ls -l /etc
ls - kask ise 
-l - kindel arg, mis mojutab kasu kaitumist (antud hetkel naitab tapsemat infot)
/etc - tavaline arg

Doug Mcllroy - yhendatavad tooriistad (UNIX philosophy) vähemalt loi teooria 1964 {
  iga tooriist taidab mingit kindlat func,
  yhe programmi valjund saab olla jargmise programmi sisend
  keerukamad ylesanded nouavad tooriistade yhendamist
}

Ken Thompson ja Denis Ritchie - arendasid 1969 esimese UNIX'i
esimeses UNIX'is oli shell ehk sh

Kest - tolgendab kasurida, kaivitab programme, korraldab sisendit ja valjundit
1972-73 lisanduvad pipes

sort andmed.tx | ubiq | wc -l (sorteeri faili sisu, eemalda korduvad read, loeanda alles jaanud read)

1983 Richard Stallman kuulutab valja GNU (GNU Not UNIX) {
  vaba, avalik lahtekood, UNIX-iga yhelduv tarkvarakeskkond,
  1989 Brian Fox loi GNU Bas Beetaversiooni, Bash - Bourne-Again SHell
}

Programmil on 3 standardvoogu {
  stdin(0) - standardsisend
  stdout(1) - standardvaljund
  stderr(2) - veateatevaljund

  (runnivad koguaeg)
  < - loe standardsisend failist
  > - kirjuta failia standardsisend
  >> - kirjuta faili sisend ja truncate 
  2> - kirjuta veateated faili
  a | b - a valjund muutub b sisesndiks

  terminal paneb stdout ja stderr samaks (vaikimisi)
  
}

