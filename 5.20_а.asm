include console.inc

COMMENT * Написать фрагмент решения задачи. Дана последовательность из 40 чисел со знаком.
а) Посчитать и напечатать количество чисел последовательности, кратных 3.
*
.data
N dd ?


st1 db 'Введите последовательность: ', 0 
st2 db 'Числа: ', 0
st3 db 'Количество чисел последовательности, кратных 3: ', 0

.code
Start:
ClrScr
 mov ebx, 3
 mov esi, 0 ; esi:=0
 mov ecx, 5 ; ecx:=40
 outstr offset st1
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