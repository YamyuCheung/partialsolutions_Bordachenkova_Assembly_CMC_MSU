include console.inc

COMMENT * N=100
X DD N DUP (?) ; X[0..NЦ1] Ц числа со знаком
а) записать в регистр EAX число нулевых элементов массива X;
*

.data
n EQU 100

X DD n DUP (?)


st1 db '¬ведите массив: ', 0
st2 db '„исло нулевых массива X: ', 0


.code
Start:
    ClrScr

    outstr offset st1
    mov EAX, 0 
    mov EDX, 0
    mov ECX, n 

MAS:
    inint X[type X * EDX] 
    cmp X[type X * EDX], 0
    je cont
    inc EDX  
    loop MAS
    jmp FIN
cont: inc EAX
      inc EDX
      loop MAS


FIN:    outstr offset st2
    outu EAX


    newline
     
exit
end Start