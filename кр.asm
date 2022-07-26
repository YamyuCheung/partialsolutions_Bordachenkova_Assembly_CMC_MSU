include console.inc

COMMENT *        
*

.data

X db 5
Z dd ?




.code


Start:
 ClrScr
mov al, X
mov bl, X
imul bl
mov cx, 5
imul cx
mov word ptr Z, ax
mov word ptr Z+2, dx
mov eax, Z
movsx ebx, X
sbb eax, ebx
mov Z, eax
outi Z
newline
 

newline


exit
end Start