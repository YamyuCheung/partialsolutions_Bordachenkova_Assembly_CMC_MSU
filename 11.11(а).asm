include console.inc

COMMENT *Описать процедуру NextDig, которая вычисляет цифру, следующую за цифрой d, считая что за 9 следует 0. 
Реализовать процедуру с указанным ниже интерфейсом.
а) procedure NextDig(var d:byte); 
процедура реализует оператор d:=след.цифра(d)
Выписать фрагмент программы, в котором вводится цифра и печатаются две следующие за ней цифры.
*
.data
d db ?
.code


NextDig proc
push ebp
mov ebp, esp
push ebx
push eax
push edx
mov ebx, 10
xor edx, edx
movzx eax, d
inc eax
div ebx
mov ebx, [ebp+8]
mov [ebx], edx
pop edx
pop eax
pop ebx
pop ebp
ret 4
NextDig endp


Start:
ClrScr
mov ecx, 2
inint eax
mov d, al
output: push offset d
call NextDig
outu d
outchar ' '
dec ecx
cmp ecx, 0
jne output
newline

exit
   end Start