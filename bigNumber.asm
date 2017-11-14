.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    MOV AH,1  ;scanf
    INT 21H    
    MOV BL,AL
    
    INT 21H   ;ask for second input
    MOV CL,AL
    
    CMP BL,CL ;if BL>=CL
    JNAE ELSE ;if not jump to ELSE_
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
    
    ELSE:
    MOV AH,2
    MOV DL,CL
    INT 21H 
    
    
        
        
 EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN