OS - vahekiht riistvara ja rakenduste vahel 
OS haldab arvuti ressursse 

application -> kõrgetasemeline API -> OS -> low level API -> harddware

ressursside jagamine = {
  riistvara, files and dirs, processes, users, safety, memory
}

lowe level liides = { C, ASM }
high level = suht koik muud keeled

OS struktuur = {
  1. kernel (juhib protsesse, haldab mälu, käsitleb katkestusi, tagab safety)
  2. draiverid ja firmware,
  3. yldteenused 
  4. rakendused
}

1 kiht paaseb ligi koigile selle all olevatele kihtidele, kuid ei paase ylemistele
Kui kasutaja soovib kerneliga suhelda liigub paring labi koikide kihtide 

Userspace = rakendused 
Kernelspace = {FS, võrk, mem manager, protsesside haldur, draiverid}
Riistvara = {RAM, disk, CPU, võrguadapter...}

kasutaja kaivitab UNIX käsu (nt. ls) -> syscall (getdents) laheb kernelile -> kernel hangib kataloogikirjed; salvestusseadme juurde poordutakse vajadusel -> kernel tagastab failide nimekirja


