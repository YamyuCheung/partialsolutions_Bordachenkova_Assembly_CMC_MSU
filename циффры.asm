include console.inc

COMMENT *������ ������������������ �� ��������. 
����� ������������������ - �����. 
����������, ������� � ���� ������������������ ����.
*
.data
N dd ?


st1 db '������� ������������������ �� �����.: ', 0 
st2 db '����� ����: ', 0

.code
Start:
ClrScr
 mov ebx, 0
 outstr offset st1
    inchar al
it: cmp al, '.'
    je fin
    cmp al, '0'
    jb cont
    cmp al, '9'
    ja cont
    inc ebx
   cont: 
   inchar al
   loop it
   fin:
   outstr offset st2 
   outu ebx
   newline

exit
   end Start