include console.inc

COMMENT *����� � ���� �������� 40 ������� ����. ����������� ��������� ���� ��������. ���� � ������ �� ������� ��������, ���� �� �������.
�) �� ������� �������� �� �����, �������� ��� �������� ����� � ����� �� ����� 1.*
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