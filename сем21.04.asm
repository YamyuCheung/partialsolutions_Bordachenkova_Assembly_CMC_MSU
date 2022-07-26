include console.inc

COMMENT * Проверить с помощью команды TEST, является число в регистре AL четными или нет.
Если четное, то напечатать-0, иначе-1
*
.data

.code
Start:
ClrScr
  mov al, 5
  test al, 1
  jz fin
  outchar '1'
  newline
  exit
fin: outchar '0'
newline
  

exit
   end Start
