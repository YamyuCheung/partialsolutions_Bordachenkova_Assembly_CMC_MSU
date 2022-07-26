include console.inc

COMMENT* а) ѕодсчитать число двоичных единиц в значении регистра EAX и записать это число в регистр DH. 
“ело цикла должно содержать не более трЄх команд, счита€ команду LOOP.*

.data

.code
Start:
 ClrScr

inint eax
xor dh, dh
mov ecx, 32
L: ror eax, 1
adc dh, 0
loop L

outu dh
newline 

exit
end Start                                          