include console.inc

COMMENT * ѕусть X и Y Ч двойные слова, числа без знака. Ќе использу€ команды умножени€ и делени€, реализовать следующее присваивание: 
а) Y := 4 ?? X - X div 8 + X mod 16 
—читать, что результат вычислений и промежуточные результаты умещаютс€ в слово.
*
.data
X DD ?
Y DD ?

st1 db '¬ведите X: ',0
st2 db 'Y:=', 0

.code
Start:
outstr offset st1
newline
inint X


mov EAX, X
shl EAX, 2
mov EBX, X
shr EBX, 3
sub EAX, EBX
xor EBX, EBX
mov EBX, X
and EBX, 15
add EAX, EBX
mov Y, EAX
outstr offset st2
outu Y
newline

exit
   end Start