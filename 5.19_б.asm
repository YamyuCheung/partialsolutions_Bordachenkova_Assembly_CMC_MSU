include console.inc

COMMENT * N DD ? ; ����� ��� ����� 
�������� � ������� CL: 
�) ����� ���� ���������� ������ ����� N;
*
.data
N dd ?
S dd ?


st1 db '������� ����� N: ', 0 
st2 db '�������� CL: ', 0

.code
Start:
ClrScr
  outstr offset st1
  inint N
  mov S, 0
  mov cl, 0
  mov ebx, 10
  mov eax, N
L: mov edx, 0
   div ebx
   add S, edx
   cmp eax, 0
   jne L
 outstr offset st2
 mov cl, byte ptr S
 outu cl
 newline
    

exit
   end Start