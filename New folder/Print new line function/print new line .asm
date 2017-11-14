.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
        
        MOV AH,1
        INT 21H
        
        CALL PRINT_NEWLINE
        
        MOV DL,AL
        MOV AH,2
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
    
    MAIN ENDP 
    
    PRINT_NEWLINE PROC
        
            PUSH AX
            PUSH DX
            
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
            
            POP DX
            POP AX
            
            RET
        
        PRINT_NEWLINE ENDP
    
   


END MAIN