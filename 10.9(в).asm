include console.inc

COMMENT *����� � ���� �������� 40 ������� ����. ����������� ��������� ���� ��������. ���� � ������ �� ������� ��������, ���� �� �������.
�) �� ������� �������� �� �����, �������� ��� �������� ����� � ����� �� ����� 1.*
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