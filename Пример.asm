include console.inc

COMMENT *
   ����� x ������� �����, ����� �� ������. 
         read(X); 
         if X>80 then X:=X+1 else X:=X-1;
         write(X)
         
*

.data

X dd ?

st1 db '������� ����� X: ', 0 
st2 db '���������: ', 0


.code


Start:
 ClrScr

   outstr offset st1
   inint X           ; ���� ������ �����
   cmp X, 80         ; ���������� X c 80
   jg  M             ; ���� X>80, �� ������� �� ����� M
   sub X,1           ; X:=X-1
   jmp L
M: add X,1
L: outstr offset st2
   outi X

 

newline


exit
end Start