include console.inc

COMMENT *Пусть в стек записано 40 двойных слов. Реализовать указанную ниже операцию. Если в задаче не указано обратное, стек не портить.
в) Не вынимая элементы из стека, заменить все нечётные числа в стеке на число 1.*
.data

.code
Start:
ClrScr

mov ecx, 40

InAr: inint eax
      test eax, 1
      jnz cont
      push eax
      xor eax, eax
      loop InAr
      jmp fin
cont: mov eax, 1
      push eax
      xor eax, eax
      loop InAr
      
fin: mov ecx, 40
     mov ebp, esp
output:     
     outint dword ptr [ebp]
     outchar ' '
     add ebp, 4
     dec ecx
     cmp ecx, 0
     jne output
     newline
     

exit
   end Start