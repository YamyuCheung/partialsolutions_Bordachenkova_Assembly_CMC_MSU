include console.inc

COMMENT * ������� ��������� PrLD(n,p: dword), ������� �������� ������� ����� ����� n (��� �����) � ������� ��������� �� ��������� p. 
���������� ��������� � ���������; �������� ��������� ����� ����.
*
.data
n DD ?
p DD ?

st1 db '������� ����� n (����������): ', 0
st2 db '������� ��������� p: ', 0
st3 db '������� ����� ����� n (��� �����) � ������� ��������� �� ��������� p: ', 0
st4 db '������ ���������', 0
st5 db '������ ���������', 0

.code
PrLD proc 
 xor edx, edx ;����� ��������
 div ebx
 outstr offset st3
 outu edx ;������� �������(������� �����)
 newline
 ret 
PrLD endp

PrLD2 proc
 push ebp ;����� ����
 mov ebp, esp
 push eax
 push ebx
 push edx
 mov eax, [ebp+12] ;eax:=n
 xor edx, edx ;edx:=0
 mov ebx, [ebp+8] ;ebx:=p
 div ebx ;������ �� ���������
 outstr offset st3
 outu edx
 newline
 pop edx ;��������������� ��������
 pop ebx
 pop eax
 pop ebp
 ret 8 ;RET 2*4 2-���������� ����������
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
push n ;����������
push p
call PrLD2


exit
   end Start