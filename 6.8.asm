include console.inc

COMMENT * Q DB 256 DUP (?) ; 
Q[0..255] of 0..255 ������, ��� � �������� AL ��������� ����� i �� 0 �� 255, �����������
������������ Q[Q[i]]:=i.
*

.data
n EQU 10

Q DB n DUP (1,3,5,7,9,2,4,6,8,0)





.code
Start:
    ClrScr



    mov al, 6 ;al:=i (����� i=6)
    movzx eax, al 
    mov bl, Q[eax] ;bl:=Q[eax]:=Q[i]=0
    movzx ebx, bl
    mov Q[ebx], al

    outu al
    newline
    outu bl
    newline
    
    



    mov EBX, 0  
    mov ECX, n  

MAS1:
    outint Q[EBX] 
    outchar ' '
    add EBX, type Q  
    dec ECX         
    cmp ECX, 0       
    jne MAS1
    newline


     
exit
end Start