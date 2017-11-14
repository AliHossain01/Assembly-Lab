.MODEL SMALL
.STACK 100H

.DATA
 
PROMPT  dw  'The Array elements are : $'
RESULT  dw  0DH,0AH,'The Sum of the Array is = $'

ARRAY   dw  10,20,30,40,50
ll dw ?
.CODE
MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     MOV BX, 5                    ; set BX=10

     LEA DX, PROMPT               ; load and display the string PROMPT
     MOV AH, 9                                                    
     INT 21H

     MOV CX, BX                   ; set CX=BX
     LEA SI, ARRAY                ; set SI=offset address of ARRAY
     XOR Ax, Ax
     @LOOP:                       ; loop label
                                  ; clear AH
     add Ax, [SI]                 ; set AX=[SI]
     add si,2
                                  ; set output function
     mov ll,ax                    ; print a character
     LOOP @LOOP 
     
     mov dx,0
     mov ax,ll
     mov bx,5
     div bx
     mov ll,ax
     
     printDiff:

mov cx , 0
mov ax , ll                       ;jaha print kore taha ax e rakhe :)
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