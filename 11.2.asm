include console.inc

COMMENT * Описать процедуру PrLD(n,p: dword), которая печатает младшую цифру числа n (без знака) в системе счисления по основанию p. 
Передавать параметры в регистрах; передать параметры через стек.
*
.data
n DD ?
p DD ?

st1 db 'Введите число n (десятичное): ', 0
st2 db 'Введите основание p: ', 0
st3 db 'Младшая цифра числа n (без знака) в системе счисления по основанию p: ', 0
st4 db 'Первая процедура', 0
st5 db 'Вторая процедура', 0

.code
PrLD proc 
 xor edx, edx ;через регистры
 div ebx
 outstr offset st3
 outu edx ;Выводим остаток(младшая цифра)
 newline
 ret 
PrLD endp

PrLD2 proc
 push ebp ;через стек
 mov ebp, esp
 push eax
 push ebx
 push edx
 mov eax, [ebp+12] ;eax:=n
 xor edx, edx ;edx:=0
 mov ebx, [ebp+8] ;ebx:=p
 div ebx ;делить на основание
 outstr offset st3
 outu edx
 newline
 pop edx ;восстанавливаем регистры
 pop ebx
 pop eax
 pop ebp
 ret 8 ;RET 2*4 2-количество параметров
PrLD2 endp


Start:
ClrScr
outstr offset st1 
inint n
outstr offset st2
inint p
outstr offset st4
newline
mov eax, n
mov ebx, p
call PrLD

outstr offset st5
newline
push n ;подготовка
push p
call PrLD2


exit
   end Start