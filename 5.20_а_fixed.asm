include console.inc

COMMENT * �������� �������� ������� ������. ���� ������������������ �� 40 ����� �� ������.
�) ��������� � ���������� ���������� ����� ������������������, ������� 3.
*
.data
N dd ?


st1 db '������� ������������������: ', 0 
st2 db '�����: ', 0
st3 db '���������� ����� ������������������, ������� 3: ', 0

.code
Start:
ClrScr
 mov ebx, 3
 mov esi, 0 ; esi:=0
 mov ecx, 5 ; ecx:=40
 outstr offset st1
 inint N ;������ ������ �����
 dec ecx
 mov eax, N
 cdq
 idiv ebx
 outstr offset st2
 cmp edx, 0
 jne L
 inc esi
 outi N
 outchar ' '
L: inint N 
   cmp N, 0
   je cont
   mov eax, N 
   cdq
   idiv ebx
   cmp edx, 0
   jne cont
   inc esi
   outi N
   outchar ' '
cont: dec ecx
      cmp ecx, 0
      jne L
newline

FIN: outstr offset st3
     outu esi
     newline

exit
   end Start