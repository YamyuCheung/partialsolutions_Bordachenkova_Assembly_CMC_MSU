include console.inc

COMMENT * N DD ? ; ����� ��� ����� 
�������� � ������� CL: 
�) ����� ���� ���������� ������ ����� N;
*
.data
N dd ?
S dw ?

st1 db '������� ����� N: ', 0 
st2 db '�������� CL: ', 0

.code
Start:
ClrScr
  outstr offset st1
  inint N
  mov S, 0
  mov bl, 10
  mov bx, 10
  mov ax, word ptr N
  mov dx, word ptr N+2
  div bx
  add S, dx

mov ecx, 10
loope M
L:  div bl
    movzx dx, ah
    add S, dx
    movzx ax, al
    loop L

M: mov cl, byte ptr S
outstr offset st2
outu cl
newline
    

exit
   end Start