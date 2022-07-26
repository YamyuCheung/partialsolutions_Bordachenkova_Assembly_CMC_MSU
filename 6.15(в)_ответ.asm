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
mov EBX, 0
mov edx, 0
mov ecx, N
mov esi, 0

MAS:
inint X[type X * EBX]
inc EBX
loop MAS


;просмотр массива от конца к началу 
MOV EAX, 2147483647 ; самое большое число со знаком 
MOV ECX, length X 
MOV EBX, ECX 
FMin: 
CMP EAX, X[(type X)*ECX-(type X)]
JGE CONT 
MOV EAX, X[(type X)*ECX-(type X)]
MOV EBX, ECX 
CONT: LOOP FMin 
; индекс = EBXЦ1 
DEC EBX

outi EAX
newline
outi EBX
newline

    mov EBX, 0  
    mov ECX, N  
MAS1:
    outint X[EBX] 
    outchar ' '
    add EBX, type X 
    dec ECX         
    cmp ECX, 0       
    jne MAS1
    newline



exit
end Start