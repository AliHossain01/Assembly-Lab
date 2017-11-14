;problem name : 913 - joana and the odd numbers
;Description : In this problem i took input n and then divide by 2 and add with n
.MODEL SMALL
 .STACK 100H
.data
a dw ?
b dw ?
c dw ?
d dw ?
sum dw ?
.code
main proc
mov ax,@data
mov ds,ax
while:
call decimal_input
mov a,bx
mov d,bx
mov sum,0
mov ax,a
mov a,2
div a
mov c,ax
sub bx,ax
mov b,bx
mov ax,d
mul b
add ax,c
add sum,ax
sub ax,2
add sum,ax
sub ax,2
add sum,ax
mov bx,sum
call decimal_output
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h
jmp while
mov ah,4ch
int 21h

main endp

 DECIMAL_INPUT PROC
   ; this procedure will read a number indecimal form    
   ; input : none
   ; output : store binary number in BX
   ; uses : MAIN

   JMP @READ                      ; jump to label @READ

  

   @READ:                         ; jump label
   XOR BX, BX                     ; clear BX
   XOR CX, CX                     ; clear CX

   MOV AH, 1                      ; set input function
   INT 21H                        ; read a character

   CMP AL, "-"                    ; compare AL with "-"
   JE @MINUS                      ; jump to label @MINUS if AL="-"

   CMP AL, "+"                    ; compare AL with "+"
   JE @PLUS                       ; jump to label @PLUS if AL="+"
   JMP @INPUT                     ; jump to label @INPUT

   @MINUS:                        ; jump label
   MOV CX, 1                      ; set CX=1

   @PLUS:                         ; jump label
   INT 21H                        ; read a character
   CMP AL, 0DH                    ; compare AL with CR
   JE @END                        ; jump to label @END if AL=CR

   @INPUT:                        ; jump label
                   ; jump to label @ERROR if AL>9

     AND AX, 000FH                ; convert ascii to decimal code

     PUSH AX                      ; push AX onto the STACK

     MOV AX, 10                   ; set AX=10
     MUL BX                       ; set AX=AX*BX
     MOV BX, AX                   ; set BX=AX

     POP AX                       ; pop a value from STACK into AX

     ADD BX, AX                   ; set BX=AX+BX

     MOV AH, 1                    ; set input function
     INT 21H                      ; read a character

     CMP AL, 0DH                  ; compare AL with CR
     JNE @INPUT                   ; jump to label if AL!=CR
                                   
   @END:                          ; jump label

   OR CX, CX                      ; check CX is 0 or not
   JE @EXIT                       ; jump to label @EXIT if CX=0
   NEG BX                         ; negate BX


   @EXIT:                         ; jump label
     

   RET                            ; return control to the calling procedure
 DECIMAL_INPUT ENDP

 DECIMAL_OUTPUT PROC
   ; this procedure will display a decimal number
   ; input : BX
   ; output : none
   ; uses : MAIN

   CMP BX, 0                      ; compare BX with 0
   JGE @START                     ; jump to label @START if BX>=0
   MOV AH, 2                      ; set output function
   MOV DL, "-"                    ; set DL='-'
   INT 21H                        ; print the character

   NEG BX                         ; take 2's complement of BX

   @START:                        ; jump label

   MOV AX, BX                     ; set AX=BX
   XOR CX, CX                     ; clear CX
   MOV BX, 10                     ; set BX=10

   @REPEAT:                       ; loop label
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                      ; push DX onto the STACK
     INC CX                       ; increment CX
     OR AX, AX                    ; take OR of Ax with AX
   JNE @REPEAT                    ; jump to label @REPEAT if ZF=0

   MOV AH, 2                      ; set output function

   @DISPLAY:                      ; loop label
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                      ; print a character
   LOOP @DISPLAY                  ; jump to label @DISPLAY if CX!=0

   RET                            ; return control to the calling procedure
 DECIMAL_OUTPUT ENDP

 END MAIN
