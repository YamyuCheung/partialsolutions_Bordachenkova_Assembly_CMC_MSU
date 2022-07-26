include console.inc

COMMENT *
   Заготовка программы
*

.data
n EQU 10

B DD n DUP (?)


st1 db 'Введите массив: ', 0
st2 db 'Последний элемент массива: ', 0


.code
Start:
    ClrScr

    outstr offset st1
    mov EAX, 0 
    mov ECX, n 

MAS:
    inint B[type B * EAX] ;ввод массива  
    inc EAX  ;EAX:=EAX+1
    loop MAS 


    outstr offset st2
    outint B[size B-type B] ;Вывести 


    newline
     
exit
end Start