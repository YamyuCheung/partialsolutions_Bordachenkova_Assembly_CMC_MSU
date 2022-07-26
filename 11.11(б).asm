include console.inc

COMMENT *Описать процедуру NextDig, которая вычисляет цифру, следующую за цифрой d, считая что за 9 следует 0. 
Реализовать процедуру с указанным ниже интерфейсом.
б) function NextDig(d:byte):byte;
Выписать фрагмент программы, в котором вводится цифра и печатаются две следующие за ней цифры.
*
.data
d db ?
y db ?
.code

NextDig proc
push ebp
mov ebp, esp
push ebx
push edx
mov ebx, 10
xor edx, edx
mov eax, [ebp+8]
inc eax
div ebx
mov eax, edx
pop edx
pop ebx
pop ebp
ret 4
NextDig endp


Start:
ClrScr
mov ecx, 2
inint d

output: movzx ebx, d
push ebx
call NextDig
mov y, al
outu y
outchar ' '
add d, type d
dec ecx
cmp ecx, 0
jne output
newline


exit
   end Start