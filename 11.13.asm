include console.inc

COMMENT * A DB 500 DUP (?) ; числа со знаком 
B DD ?
Описать процедуру SUM(X,N,S), которая присваивает параметру-
двойному слову S сумму элементов массива X из N знаковых байтов. 
Выписать заголовок процедуры на Паскале. 
Выписать команды, соответствующие следующему обращению к процедуре: SUM(A,500,B).
*
.data
A DB 500 DUP (?)
B DD ?
.code
num proc
push ebp
mov ebp, esp
push eax
push ebx
push edx
movsx edx, A[eax]
mov ebx, [ebp+8]
mov [ebx], edx 
pop edx
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
xor eax, eax
xor edx, edx
sum:  inint A[eax]
      lea ebx, A[eax]
      push ebx
      call num 
      mov esi, dword ptr A[eax]
      add edx, esi
      add eax, type A
      loop sum


outi edx
newline


exit
   end Start