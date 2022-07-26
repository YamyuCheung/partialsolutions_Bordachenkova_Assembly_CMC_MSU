include console.inc

COMMENT *
   Заготовка программы
*

.data
Q DB 10 DUP (1,3,5,7,9,2,4,6,8,0) 

; 6.8
; 

.code

; Q[Q[i]]:=i



Start:
    ClrScr
    newline

    mov EAX, 0  ; модификатор адреса
    mov EBX, 0  ; модификатор адреса
    mov AL, 1   ; al:=i ( пусть i=1)
    mov BL, Q[EAX] ; BL:=Q[i] bl:=3
    mov Q[EBX], AL ; Q[0]:=i Q[3]:=1

    outu EAX ; i
    newline
    outu EBX ; Q[i]
    newline
    mov ECX, 0
  cycle:
    movzx EDX, Q[ECX] 
    outu EDX
    outchar ' '
    inc ECX
    cmp ECX,10
    jne cycle
    

    newline
     
exit
end Start