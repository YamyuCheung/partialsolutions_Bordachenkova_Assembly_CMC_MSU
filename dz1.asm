include console.inc

COMMENT *N DD ? ;����� ��� �����
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
   mov bx, 10
   mov bl, 10
   mov dx, word ptr N+2
   mov ax, word ptr N
   div bx
   add S, dx
   
   M: mov cx, ax ;cx:=ax
   div bl  ;al-������� ah-�������
   cmp cx, 0 ;������� cx � 0
   je L ;���� =; �� ��������� �� ����� L
   mov ch, ah ;�������� ah � �������� ch
   movzx ax, al ;convert al �� ax
   movzx dx, ch ;convert ch �� dx 
   add S, dx ;S:=S+dx
   jmp M


   L: outstr offset st2
   mov cl, byte ptr S
   outu cl

newline


exit
end Start