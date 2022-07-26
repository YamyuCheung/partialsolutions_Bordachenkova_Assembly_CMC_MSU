include console.inc

COMMENT * N=30 
Z DB N DUP (?) ; 
Z[0..N–1], числа со знаком Решить следующую задачу: 
а) Вычислить максимальный элемент среди элементов c нечётными индексами. Результат записать в AL.
*

.data
N EQU 6
Z DB N DUP (?)

.code
Start:
ClrScr
xor eax, eax
xor ebx, ebx
mov ecx, length N
mov al, -128
MAS: inint Z[type Z * ebx]
     test ebx, 1
     jnz cont
     inc ebx
     loop MAS
     jne MAS
     jmp fin
cont:cmp al, Z[type Z * ebx]
     jl chg
     inc ebx
     dec ecx
     cmp ecx, 0
     jne MAS
     jmp fin
chg: mov al, Z[type Z * ebx]
     inc ebx
     dec ecx
     cmp ecx, 0
     jne MAS
     jmp fin

fin: outi al
newline

exit
end Start
