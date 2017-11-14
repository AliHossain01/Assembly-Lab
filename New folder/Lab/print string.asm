
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H  
.DATA

STRING DB 'ENTER A DIGIT :$'
.CODE

MAIN PROC 
    
    
     
      MOV AX,@DATA    ; DATA SEGMENT 
      MOV DS,AX
      
     MOV AH,9
     LEA DX,STRING   ; LOAD EFFECTIVE ADDRESS ;; LOAD THE FIRST ADDRESS
     INT 21H 
    
     MOV AH,1
     INT 21H
    
    MOV BL,AL
    
    
    MOV AH,2
    MOV DL,0DH ;FOR CARRIEGE RETURN
    INT 21H
    MOV DL,0AH  ; FOR NEW LINE
    INT 21H
    MOV DL,BL  ;FOR OUTPUT
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
        END MAIN

ret




