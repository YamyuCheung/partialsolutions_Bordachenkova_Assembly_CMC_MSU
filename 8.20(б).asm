include console.inc

COMMENT* ����� X � Y � ������� �����, ����� ��� �����. 
�� ��������� ������� ��������� � �������, ����������� ��������� ������������:
Y:=35 ? X
�������, ��� ��������� ���������� � ������������� ���������� ��������� � �����.*

.data
X DD ?
Y DD ?

.code
Start:
 ClrScr

inint X

mov eax, 0
mov ebx, 0

mov eax, X
shl eax, 5
mov ebx, X
shl ebx, 1
add eax, ebx
add eax, X
mov Y, eax

outu Y
newline

exit
end Start
                              