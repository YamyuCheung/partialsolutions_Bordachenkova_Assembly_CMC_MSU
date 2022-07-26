include console.inc

COMMENT * N DD ? ; число без знака 
Записать в регистр CL: 
б) сумму цифр десятичной записи числа N;
*
.data
N dd ?
S dd ?


st1 db 'Введите число N: ', 0 
st2 db 'Значение CL: ', 0

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
