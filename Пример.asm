include console.inc

COMMENT *
   Пусть x двойное слово, число со знаком. 
         read(X); 
         if X>80 then X:=X+1 else X:=X-1;
         write(X)
         
*

.data

X dd ?

st1 db 'Введите число X: ', 0 
st2 db 'Результат: ', 0


.code


Start:
 ClrScr

   outstr offset st1
   inint X           ; ввод целого числа
   cmp X, 80         ; сравниваем X c 80
   jg  M             ; если X>80, то переход на метку M
   sub X,1           ; X:=X-1
   jmp L
M: add X,1
L: outstr offset st2
   outi X

 

newline


exit
end Start
