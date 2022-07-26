include console.inc

COMMENT *Перевернуть содержимое регистра EAX.*

.data

.code
Start:
 ClrScr
 inint EAX
 
 xor ebx, ebx
 mov ecx, 32
L: rol eax, 1
 rcr ebx, 1
 loop L
 mov eax, ebx

outu ebx
newline

exit
end Start
 