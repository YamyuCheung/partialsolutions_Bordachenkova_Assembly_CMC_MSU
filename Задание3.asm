include console.inc

COMMENT * 2) Текст начинается цифрой и оканчивается цифрой, причем эти цифры различны.
5) Заменить все заглавные латинские буквы на соответствующие строчные буквы.
*

.data
n EQU 100
B DB n DUP (?)

st1 db 'Введите текст: ', 0
st2 db 'Исходный текст: ', 0
st3 db 'Номер примененного правила: 5', 0
st4 db 'Преобразованный текст: ', 0

.code
chg proc
 push ebp
 mov ebp, esp
 push eax
 push ebx
 push edx
 xor ebx, ebx
 mov eax, [ebp+8] ;eax: = адрес B
 
 check: cmp byte ptr [eax][ebx], '0' ;определить первый символ, число или другой(если другой символ, то переходим на метку nochg)
 ja check1
 jmp nochg
 check1: cmp byte ptr [eax][ebx], '9'
 ja nochg
 
 mov ecx, [ebp+12]
 check2: cmp byte ptr [eax][ecx-type B], '0'  ;определить последний символ, число или другой(если другой символ, то переходим на метку nochg)
 ja check3
 jmp nochg
 check3: cmp byte ptr [eax][ecx-type B], '9'
 ja nochg
 
 mov dl, byte ptr [eax][ebx] ;поставить 1-ый элемент в регистре CL
 cmp dl, byte ptr [eax][ecx-type B] ;сравнить между первым элементом и последнем элементом
 je nochg
 
 M: cmp byte ptr [eax][ebx], '0'
    ja chk1
    jmp M3 
    chk1: cmp byte ptr [eax][ebx], '9'
    ja chk2
    jmp M3
    chk2: cmp byte ptr [eax][ebx], 'A'
    jae chk3
    jmp M3
    chk3: cmp byte ptr [eax][ebx], 'Z'
    ja chk4
    jmp M2
    chk4: cmp byte ptr [eax][ebx], 'a'
    ja chk5
    jmp M3
    chk5: cmp byte ptr [eax][ebx], 'z'
    ja M3
    
M2: or byte ptr [eax][ebx], 32 ;поменять заглавные латинские буквы на соответствующие строчные буквы, по таблице ASCII нашел правило(если заглавная буква, то 3-ий бит равен 1, слева напрово)
M3: inc ebx
    cmp ebx, [ebp+12]
    jne M
    jmp chgsym
nochg: inc esi
chgsym:
 pop edx
 pop ebx
 pop eax
 pop ebp
 ret 8
chg endp



Start:
ClrScr
    xor ecx, ecx
    xor eax, eax
    xor esi, esi
outstr offset st1
MAS:
    inchar dl     ;Входить массив
    mov B[type B * eax], dl
    inc eax
    inc ecx
    cmp dl, '.'
    jne MAS



    dec ecx
    push ecx
    mov edx, ecx
    push edx

outstr offset st2 ;Вывести исходный текст
    xor ebx, ebx 
output1:
    mov dl, B[ebx] 
    outchar dl
    add EBX, type B  
    dec ECX         
    cmp ECX, 0      
    jne output1
    pop edx
    newline    


    mov ecx, edx
    push offset B
    call chg

cmp esi, 0
jnz fin

outstr offset st3 ;Вывести 'Номер примененного правила: 5'
newline
outstr offset st4 ;Вывести 'Преобразованный текст: '
  
    xor ebx, ebx 
output2:
    mov dl, B[ebx]
    outchar dl
    add EBX, type B  
    dec ECX         
    cmp ECX, 0      
    jne output2
    newline
fin:

exit
end Start


     
