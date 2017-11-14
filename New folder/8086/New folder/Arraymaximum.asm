.MODEL SMALL
.STACK 100H

.DATA
 
PROMPT  dw  'The Array elements are : $'
RESULT  dw  0DH,0AH,'The Sum of the Array is = $'

ARRAY   dw  90,120,5,3,2,7
ll dw ?
p dw ?
nn dw ?
.CODE
MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

    ; MOV BX, 6                    ; set BX=10


     MOV CX, 6
     xor bx,bx                   ; set CX=BX
     LEA SI, ARRAY
     mov bx,[si]
     mov p,bx
                     ; set SI=offset address of ARRAY
     ;XOR Ax, Ax
     @LOOP: 
                           ; loop label
     add si,2                            ; clear AH
     mov bx, [SI]                 ; set AX=[SI]
     mov nn,bx
     mov ax,nn
     
     cmp ax,p
     jl check 
                                  ; set output function
                                  ; print a character
     LOOP @LOOP
     
     check : 
     
     mov p,ax
     dec cx
     cmp cx,0
     jmp printDiff
     jmp @LOOP
     
     printDiff:

mov cx , 0
mov ax , p                       ;jaha print kore taha ax e rakhe :)
mov bx , 10
store_in_stack:
mov dx , 0
div bx
push dx
inc cx
cmp ax , 0
jne store_in_stack

ending:
mov ah,2
pop dx                             ;pop
add dl,48
int 21h
loop ending

mov ah,2
mov dl,0dh                          ;new line er jonno
int 21h
mov dl,0ah                          ;cursor point 1st e anar jnno
int 21h                             ; jump to label @LOOP while CX!=0

    
   MOV AH, 4CH                      ; return control to DOS
   INT 21H
   MAIN ENDP