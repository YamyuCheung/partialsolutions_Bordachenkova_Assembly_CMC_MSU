include console.inc

COMMENT * A DB 500 DUP (?) ; числа со знаком 
B DD ?
Описать процедуру SUM(X,N,S), которая присваивает параметру-
двойному слову S сумму элементов массива X из N знаковых байтов. 
Выписать заголовок процедуры на Паскале. 
Выписать команды, соответствующие следующему обращению к процедуре: SUM(A,500,B).
*
.data
A DB 10 DUP (?)
B DD ?
.code
num proc
push ebp
mov ebp, esp
push eax
push ebx
movsx eax, A
mov ebx, [ebp+8]
mov [ebx], eax 
pop ebx
pop eax
pop ebp
ret 4
num endp



Start:
ClrScr
mov esi, 0
mov ecx, length A
xor ebx, ebx
Sum: inint A
      push offset A
      call num
      mov eax, dword ptr A
      add ebx, eax
      loop Sum

mov B, ebx
outi B
newline



exit
   end Start
