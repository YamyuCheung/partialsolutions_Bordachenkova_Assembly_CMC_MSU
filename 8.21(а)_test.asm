include console.inc

COMMENT * ����� X � ������� �����, ����� ��� �����. �� ��������� ������ ��������� � �������, �������� ������������������ ������, ����������� ������������
�) Y:= (X + 52) div 16 + X ? 32
������� ���������� Y ����������� �������.
�������� ������ ��������� �������� ��� ����� �������� ������, ���� ���� ������������� ���������� �� ��������� � ������� �����.
*
.data
X DD ?
Y DD ?

st1 db '������� X: ',0
st2 db 'Y:= ', 0
st3 db '�������� EDX: ', 0

.code
Start:
outstr offset st1
inint X


mov eax, X ;EAX:=X
outu eax
newline
add eax, 52 ;EAX:=EAX+52
outu eax
newline
shr eax, 4 ;EAX:=EAX div 16
outu eax
newline
mov ebx, X ;EBX:=X
shl ebx, 5 ;EBX:=EBX*32
add eax, ebx ;EAX:=EAX+EBX
mov Y, eax ;Y:=EAX


outstr offset st2
outu Y
newline

exit
   end Start