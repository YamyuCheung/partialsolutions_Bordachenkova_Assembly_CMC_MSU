include console.inc

COMMENT* N=100
X DD N DUP (?) ; X[0..N�1] � ����� �� ������
������ ��������� ������:
�) �������� � ������� EAX ���������� ������� ������� X, � ������� BL � ��� ������ (�� 0 �� 99);
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


;�������� ������� �� ����� � ������ 
MOV EAX, 2147483647 ; ����� ������� ����� �� ������ 
MOV ECX, length X 
MOV EBX, ECX 
FMin: 
CMP EAX, X[(type X)*ECX-(type X)]
JGE CONT 
MOV EAX, X[(type X)*ECX-(type X)]
MOV EBX, ECX 
CONT: LOOP FMin 
; ������ = EBX�1 
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