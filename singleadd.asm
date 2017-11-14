.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    
    MOV AH,1  ;scanf
    INT 21H
    
    MOV BL,AL
    
    INT 21H   ;ask for second input
    
    MOV CL,AL
    
    
    ADD BL,CL  ;BL=BL+CL
    
    
    MOV AH,2
    MOV DL,BL 
    SUB DL,48
    INT 21H  
    
    
    EXIT:
    MOV AH,4CH  
    INT 21H
    MAIN ENDP
END MAIN
    