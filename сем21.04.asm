include console.inc

COMMENT * ��������� � ������� ������� TEST, �������� ����� � �������� AL ������� ��� ���.
���� ������, �� ����������-0, �����-1
*
.data

.code
Start:
ClrScr
  mov al, 5
  test al, 1
  jz fin
  outchar '1'
  newline
  exit
fin: outchar '0'
newline
  

exit
   end Start