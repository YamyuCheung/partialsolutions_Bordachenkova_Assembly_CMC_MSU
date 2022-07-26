include console.inc

COMMENT *  N=30
Z DB N DUP (?) ; Z[0..N–1], числа со знаком
б) поменять знаки у всех элементов массива Z с чётными индексами.
*

.data
n EQU 6

Z DB n DUP (?)


st1 db 'Введите массив: ', 0
st2 db 'Вывод массива: ', 0


.code
Start:
    ClrScr

    outstr offset st1
    newline
    mov EAX, 0 
    mov ESI, 0
    mov EDI, 0
    mov EBX, 2
    mov ECX, n 

MAS:
    inint Z[type Z * EAX] ;ввод массива  
    mov ESI, EAX ;сохраним EAX
    mov EDI, EAX ;EDI:=EAX
    xor EDX, EDX ;EDX:=0
    div EBX ;разделим на 2
    cmp EDX, 0 ;сравним с 0
    je cont ;переходим на метку cont
    mov EAX, ESI
    inc EAX  ;EAX:=EAX+1
    loop MAS
    jmp FIN ;переходим на метку FIN, чтобы выводить массив
cont: mov EAX, ESI ;восстановим EAX
      NEG Z[type Z * EAX] ;negate элемент
      inc EAX  
      loop MAS
      

 FIN:   outstr offset st2
    newline
    mov EBX, 0  
    mov ECX, n  

MAS1:
    outint Z[EBX] 
    outchar ' '
    add EBX, type Z
    dec ECX         
    cmp ECX, 0      
    jne MAS1
    newline
     
exit
end Start


     
