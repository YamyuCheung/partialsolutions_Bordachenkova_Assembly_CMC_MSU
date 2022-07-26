include console.inc

COMMENT *Дан непустой текст, оканчивающийся символом 'h'. 
Проверить, является ли текст записью числа в 16-ричной системе (без знака). 
Ответ (является/не является) напечатать.
*
.data
N dd ?

st1 db 'Введите текст(закончивший с буквой h): ', 0
st2 db 'является', 0 
st3 db 'не является', 0

.code
Start:
ClrScr
mov ebx, 0

outstr offset st1
newline
 
it: inchar al
    cmp al, 'h'
    je fin ;если 'h', то переходим на метку fin
    cmp al, ' ' ; проверим пробел
    je cont4 ;если да, то переходим на метку cont4
    cmp al, '0' ;'0':=48(по таблице ASCII)
    jae cont
    
cont: cmp al, '9' ;'9':=57
    jbe it ;если al<='9', то переходим на метку it
    cmp al, 'A' ;'A':=65
    jae cont2 ;если al>='A', то переходим на метку cont2
    inc ebx
    jmp it
cont2: cmp al, 'F' ;'F':=70
    jbe it
    cmp al, 'a' ;'a':=97
    jae cont3
    inc ebx
    jmp it
cont3: cmp al, 'f' ;'f':=102
 jbe it
 inc ebx
 jmp it

cont4: cmp ebx, 0
je fin
xor ebx, ebx ;ebx:=0
jmp it


fin:
 cmp ebx, 0 ;если EBX:=0, то это 16-ричное число. Иначе, в тексте нет такого числа 
 jne fin2
 outstr offset st2
 newline
 exit


fin2: outstr offset st3
newline
   

exit
   end Start
