include console.inc

COMMENT * ����� X � ������� �����, ����� ��� �����. �� ��������� ������ ��������� � �������, �������� ������������������ ������, ����������� ������������
�) Y:= (X + 52) div 16 + X ? 32
������� ���������� Y ����������� �������.
�������� ������ ��������� �������� ��� ����� �������� ������, ���� ���� ������������� ���������� �� ��������� � ������� �����.
*
.data
X DD ?
Y DQ ?

st1 db '������� X: ',0
st2 db 'Y:= ', 0
st3 db '�������� EDX: ', 0

.code
Start:
outstr offset st1
inint X


mov eax, X ;EAX:=X
add eax, 52 ;EAX:=EAX+52
shr eax, 4 ;EAX:=EAX div 16
mov ebx, X ;EBX:=X
mov edx, ebx ;EDX:=X
shl ebx, 5 ;EBX:=EBX*32
rol edx, 5 
and edx, 31
outstr offset st3
outu edx
newline
add eax, ebx ;EAX:=EAX+EBX
adc edx, 0
mov dword ptr Y, eax ;Y:=EAX
mov dword ptr Y+4, edx ;Y+4:=EDX


outstr offset st2
outu Y
newline

exit
   end Start