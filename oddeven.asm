.MODEL SMALL
.STACK 100H  
.DATA
MSG1 DB 'ODD $'
MSG2 DB 'EVEN $'
.CODE 


MAIN PROC 
    MOV AX,@DATA ;initialization of data
    MOV DS,AX
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    MOV AH,2
    MOV DL,10   ;\n
    INT 21H
    MOV DL,13
    INT 21H
    
    SUB BL,48 
     
ABAR:
    SUB BL,2
    CMP BL,1
    JL PRINT
    JMP ABAR 
           
PRINT:
    CMP BL,0
    JE EVEN
    
    LEA DX,MSG1 ;ODD 
    MOV AH,9
    INT 21H
    JMP EXIT

EVEN:
     MOV AH,9
    LEA DX,MSG2 ;EVEN
    INT 21H
    JMP EXIT
    
        
    
    
EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN