include console.inc

COMMENT *��� �������� �����, �������������� �������� 'h'. 
���������, �������� �� ����� ������� ����� � 16-������ ������� (��� �����). 
����� (��������/�� ��������) ����������.
*
.data
N dd ?

st1 db '������� �����(����������� � ������ h): ', 0
st2 db '��������', 0 
st3 db '�� ��������', 0

.code
Start:
ClrScr
mov ebx, 0

outstr offset st1
newline
 
it: inchar al
    cmp al, 'h'
    je fin ;���� 'h', �� ��������� �� ����� fin
    cmp al, ' ' ; �������� ������
    je cont4 ;���� ��, �� ��������� �� ����� cont4
    cmp al, '0' ;'0':=48(�� ������� ASCII)
    jae cont
    
cont: cmp al, '9' ;'9':=57
    jbe it ;���� al<='9', �� ��������� �� ����� it
    cmp al, 'A' ;'A':=65
    jae cont2 ;���� al>='A', �� ��������� �� ����� cont2
    inc ebx
    jmp it
cont2: cmp al, 'F' ;'F':=70
    jbe it
    cmp al, 'a' ;'a':=97
    jae cont3
    inc ebx
    jmp it
cont3: cmp al, 'f' ;'f':=102
 jbe it
 inc ebx
 jmp it

cont4: cmp ebx, 0
je fin
xor ebx, ebx ;ebx:=0
jmp it


fin:
 cmp ebx, 0 ;���� EBX:=0, �� ��� 16-������ �����. �����, � ������ ��� ������ ����� 
 jne fin2
 outstr offset st2
 newline
 exit


fin2: outstr offset st3
newline
   

exit
   end Start