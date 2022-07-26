include console.inc

COMMENT *Пусть в стек записано 40 двойных слов. Реализовать указанную ниже операцию. Если в задаче не указано обратное, стек не портить.
в) Не вынимая элементы из стека, заменить все нечётные числа в стеке на число 1.*
.data

.code
Start:
ClrScr

mov ecx, 5

InAr: inint eax
      push eax
      xor eax, eax
      loop InAr
      jmp fin
      
fin: mov ecx, 5
     mov ebp, esp
output: 
     test dword ptr [ebp], 1
     jnz cont
     outint dword ptr [ebp]
     outchar ' '
N:   add ebp, 4
     dec ecx
     cmp ecx, 0
     jne output
     exit
cont: mov dword ptr [ebp], 1
      outint dword ptr [ebp]
      outchar ' '
      jmp N

exit
   end Start