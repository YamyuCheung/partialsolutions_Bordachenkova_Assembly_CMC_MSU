include console.inc

COMMENT *������� ��������� NextDig, ������� ��������� �����, ��������� �� ������ d, ������ ��� �� 9 ������� 0. 
����������� ��������� � ��������� ���� �����������.
�) procedure NextDig(var d:byte); 
��������� ��������� �������� d:=����.�����(d)
�������� �������� ���������, � ������� �������� ����� � ���������� ��� ��������� �� ��� �����.
*
.data
d db ?
.code


NextDig proc
push ebp
mov ebp, esp
push ebx
push eax
push edx
mov ebx, 10
xor edx, edx
movzx eax, d
inc eax
div ebx
mov ebx, [ebp+8]
mov [ebx], edx
pop edx
pop eax
pop ebx
pop ebp
ret 4
NextDig endp


Start:
ClrScr
mov ecx, 2
inint eax
mov d, al
output: push offset d
call NextDig
outu d
outchar ' '
dec ecx
cmp ecx, 0
jne output
newline

exit
   end Start