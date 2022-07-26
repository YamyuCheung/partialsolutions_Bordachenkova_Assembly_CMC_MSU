include console.inc

COMMENT *N DD ? ;число без знака
Записать в регистр CL:    
б) сумму цифр десятичной записи числа N;
*

.data

N dd ?
S dw ?


st1 db 'Введите число N: ', 0 
st2 db 'Значение CL: ', 0


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
   div bl  ;al-частное ah-остаток
   cmp cx, 0 ;сравним cx и 0
   je L ;если =; то переходим на метку L
   mov ch, ah ;сохраним ah в регистре ch
   movzx ax, al ;convert al на ax
   movzx dx, ch ;convert ch на dx 
   add S, dx ;S:=S+dx
   jmp M


   L: outstr offset st2
   mov cl, byte ptr S
   outu cl

newline


exit
end Start
