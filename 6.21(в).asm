include console.inc

COMMENT * N=15
X DD N DUP (?); ����� ��� �����
�) ���������, �������� �� �������� ������� �������������� ���������� � ����� ������������. 
���� ��������, ���������� ����� ��������������� ����������� � ���������� ����������� ����������, ���� �� �������� ���������� ����� ����.
*

.data
N EQU 15

X DD N DUP (?)
Q DD ?
R DD ?


st1 db '������� �������� �������: ', 0
st2 db '���', 0
st3 db '�������������� ����������', 0
st4 db '�����������: ', 0


.code
Start:
    ClrScr

; ���� �������

    outstr offset st1
    newline
    mov EAX, 0 
    mov ECX, N


MAS:
    inint X[type X * EAX]
    inc EAX
    loop MAS


    mov EAX, 0
    mov EBX, 0
    mov ESI, 0
    mov ECX, N
MAS1:
    mov EAX, dword ptr X[ESI+4] 
    cmp EAX, 0
    je FIN1
    xor EDX, EDX ;����� ��� �����
    mov EBX, dword ptr X[ESI]
    cmp EBX, 0
    je FIN1
    div EBX
    mov Q, EAX ;������ �������
    mov R, EDX ;xpa��� �������
    ADD ESI, type X
    SUB ECX, 2 ;��� ������ �������� N-1 ���, �������, ����� ECX:=ECX-2
MAS2:
    mov EAX, dword ptr X[ESI+4]
    xor EDX, EDX
    mov EBX, dword ptr X[ESI]
    div EBX
    cmp EAX, Q
    je cont1
    jmp FIN1
 cont1: cmp EDX, R
        je cont2
        jmp FIN1
 cont2: ADD ESI, type X
        loop MAS2
        jmp FIN2

FIN2: outstr offset st3
      newline
      outstr offset st4
      outu Q
      newline
      exit

FIN1: outstr offset st2
newline
    
    
     
exit
end Start