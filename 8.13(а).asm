include console.inc

COMMENT* �) ���������� ����� �������� ������ � �������� �������� EAX � �������� ��� ����� � ������� DH. 
���� ����� ������ ��������� �� ����� ��� ������, ������ ������� LOOP.*

.data

.code
Start:
 ClrScr

inint eax
xor dh, dh
mov ecx, 32
L: ror eax, 1
adc dh, 0
loop L

outu dh
newline 

exit
end Start                                          