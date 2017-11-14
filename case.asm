.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'DIGIT $'
MSG2 DB 'UPPERCASE $'
MSG3 DB 'LOWERCASE $'
MSG4 DB 'SPECIAL $'

.CODE
MAIN PROC
    MOV AX,@DATA ;INITIALIZATION
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
     MOV AH,2
    MOV DL,10
    INT 21H              ;\n
    MOV DL,13
    INT 21H   
    
    
    CMP BL,48
    JGE DIGIT_UPPER
    JMP SPECIAL  ;
    
    
    DIGIT_UPPER:
    CMP BL,57
    JLE PRINT_DIGIT 
    JMP DOWN_UPPER 
    JMP SPECIAL  ;
    
    PRINT_DIGIT:
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    JMP EXIT    
    
   DOWN_UPPER: 
    CMP BL,65
    JGE UP_UPPER
    JMP SPECIAL  ;
    
    
    UP_UPPER:
    CMP BL,90
    JLE PRINT_UP
    JMP DOWN_LOWER
    JMP SPECIAL  ;
    
    PRINT_UP:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    JMP EXIT  
    
     DOWN_LOWER: 
    CMP BL,97
    JGE UP_LOWER
    JMP SPECIAL  ;
    
    UP_LOWER:
    CMP BL,122
    JLE PRINT_LOW
    JMP SPECIAL  ;
    PRINT_LOW:
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    JMP EXIT
    
    SPECIAL:
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    JMP EXIT
    
    
    
     EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN