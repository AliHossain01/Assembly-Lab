.MODEL SMALL
.STACK 100H 
.CODE

MAIN PROC
    
    XOR BX,BX 
    XOR CX,CX           ; flash the memory
    MOV CL,10           ; initialise BL to 10 to divide
    
INPUT:
    MOV AH,1             ; scanning function
    INT 21H
    CMP AL,13d           ; if AL == 10
    JNE NUMBER           ; if not equal thn jmp to number
    JMP FACTORIAL            ; if equal thn jmp to exit

NUMBER:
    XOR DX,DX
                     
    SUB AL,30h
    MOV DL,AL
    
    MOV AX,BX
    MUL CL
    ADD AX,DX
    MOV BX,AX
    JMP INPUT   



FACTORIAL:
    MOV AX,BX

FIRST:                 ; FACTORIAL CODE
    DEC BX
    MUL BX
    CMP BX,1
    JNE FIRST
    
    MOV BX,AX
        
      


    
EXIT: 
    XOR AX,AX
    MOV AX,BX
    MOV CL,10       
    
    MOV BX,0000H         ;initial address of allocation
    
STORE:
    DIV CL                                      
    MOV [0000H+BX],AH                       
    ADD BX,2h                             
    MOV AH,0                                  
    
    CMP AL,0
    JNE STORE
      
    MOV AH,2
    MOV DL,0Ah
    INT 21H   
    MOV DL,0Dh
    INT 21H
    
PRINT:    
    SUB BX,2h

    MOV DX,[0000h+BX] 
    ADD DX,30h
    INT 21H
    CMP BX,0
    JNE PRINT
    
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN             

