include console.inc

COMMENT *�������� �������� ���������, � ������� �������� ������������������ ��������� �����, ��������������� �����, 
� ��� ����� ��������� � �������� �������, �� ������ ���� ����� ��� ��� ������������� ����� (� ��������� ������ ������ �� ��������). 
�������� �������� �������� ESP ������ ���� ���������.
*
.data

.code
Start:
ClrScr

xor ecx, ecx
xor eax, eax
xor ebx, ebx

InAr: inint eax
cmp ebx, 0
jne fin3
cmp eax, 0
je fin
jl fin2
N: push eax
inc ecx
xor eax, eax
jmp InAr

fin: mov ebp, esp
cl1: outint dword ptr [ebp]
     outchar ' '
     add ebp, 4
     dec ecx
     cmp ecx, 0
     jne cl1
     newline
     exit
fin2: inc ebx
jmp N

fin3:


exit
   end Start