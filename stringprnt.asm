.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'HELLO $'
MSG2 DB 'WORLD $'
.CODE

MAIN PROC
    MOV AX,@DATA ;initialization of data
    MOV DS,AX
    
    
    LEA DX,MSG1
    MOV AH,9    ;printf for string
    INT 21H                       
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H   
    
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN