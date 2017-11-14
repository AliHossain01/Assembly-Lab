
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    ; FUNCTION NO '1' SINGLE KEY INTPUE
    ; FUNCTION NO '2' SINGLE KEY OUTPUT  
    
    
    MOV DL,':'  ;ASK USER FOR SINGLE DIGIT INTPUT
    MOV AH,2
    INT 21H
    
    
    
    MOV AH,1
    INT 21H     ; TAKING 1ST INPUT 
    
    MOV BL,AL 
    
    MOV DL,'+'
    MOV AH,2
    INT 21H
    
    MOV AH,1
    INT 21H     ; TAKING 2ND INTPUT 
    
    MOV BH,AL  
    
    ADD BH,BL  ; BH+=BL
    
    SUB BH,30H ;BH-=30H 
    
    MOV DL,'='
    MOV AH,2
    INT 21H
    
    
    MOV AH,2 
    MOV DL,BH
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN

ret




