include console.inc

COMMENT* N=100
X DD N DUP (?) ; X[0..NЦ1] Ц числа со знаком
–ешить следующую задачу:
в) записать в регистр EAX наименьший элемент массива X, в регистр BL Ч его индекс (от 0 до 99);
*

.data
N=10
X DD N DUP (?)

.code
Start:
 ClrScr

mov eax, 0
mov ebx, 0
mov edx, 0
mov ecx, N
mov esi, 0

inint X[edx]
mov eax, dword ptr X[edx]
add edx, type X
inc esi
dec ecx
MAS: inint X[edx]
     cmp eax, dword ptr X[edx]
     jg chg
     add edx, type X
     inc esi
     loop MAS
     jmp output
chg: mov eax, dword ptr X[edx]
     mov ebx, esi
     add edx, type X
     inc esi
     loop MAS

output: outi eax
        newline
        outi ebx
        newline

exit
end Start

 