
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH,1 ; INTPUT FUNCTION
    
    
    INT 21H
    MOV BL,AL
    
    INT 21H
    MOV BH,AL
    
    INT 21H
    MOV CL,AL
    
    INT 21H
    MOV CH,AL  
    
   
    MOV AH,2
    MOV DL,0AH      ; FOR NEW LINE
    INT 21H
    MOV DL,0DH
    INT 21H
    
    INT 21H
    MOV DL,BL
    INT 21H
    MOV DL,BH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,CH
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN

ret




