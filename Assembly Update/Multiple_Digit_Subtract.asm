INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H 
.DATA
VAR1 DW ?
VAR2 DW ?
.CODE

MAIN PROC
    MOV AX,@DATA   ;initialization of data segment
    MOV DS,AX
    
    XOR BX,BX      ; BX = 0 
    XOR CX,CX      ; CX = 0
    MOV CL,10 
    MOV VAR1,0     
    MOV VAR2,0
    
INPUT:
    MOV AH,1
    INT 21H 
    XOR DX,DX      ; DX = 0
    MOV DL,AL      ; DL = AL
    SUB DL,30H     ; DL = DL - 30h
    
    CMP AL,13d
    JNE NUMBER
    CMP VAR1,0
    JE FIRST_INPUT  
    CMP VAR2,0
    JE SECOND_INPUT
    
NUMBER: 
    XOR AX,AX
    MOV AX,BX
    MUL CL
    ADD AX,DX
    MOV BX,AX 
    JMP INPUT
    
FIRST_INPUT:
    MOV VAR1,BX
    XOR BX,BX
    PRINTN
    JMP INPUT
    
SECOND_INPUT:
    MOV VAR2,BX
    XOR BX,BX
    JMP MINUS

MINUS:  
    MOV BX,VAR1
    SUB BX,VAR2
    
    MOV AX,BX  
    XOR BX,BX
    MOV BX,0000H
                                           
                                           
STORE:
    DIV CL
    MOV [0000H+BX],AH
    ADD BX,2H
    MOV AH,0
    CMP AL,0
    JNE STORE
    PRINTN
PRINT:
    SUB BX,2H  
    MOV AH,2
    MOV DL,[0000H+BX] 
    ADD DL,30H
    INT 21H 
    CMP BX,0
    JNE PRINT
    
EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN