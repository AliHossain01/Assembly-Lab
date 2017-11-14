ORG 100h
.stack 100h

.Data
a DB 100 dup(?)   
pal DB 10,13,'Palindrome $'
npal DB 10,13,'Not Palindrome $'

.CODE 
MOV AX,@data
MOV DS,AX
MOV SI, 0
MOV AH, 1
INT 21h
INPUTLOOP:
CMP AL, 13
JZ ENDLOOP
    MOV a[SI], AL
    INC SI
    PUSH AX
    INT 21h 
    JMP INPUTLOOP
ENDLOOP:   

MOV CX, SI
SAR CX,1
XOR SI, SI
CHECKLOOP:
    MOV AH,2
    MOV DL,10
    INT 21h
    MOV DL,13
    INT 21h
    POP AX
    CMP AL, a[SI]
    JNZ ENDCHECK
    INC SI
LOOP CHECKLOOP  
ENDCHECK: 

OR CX, CX
JNZ NPALINDROME
LEA DX,pal
MOV AH,9
INT 21h
RET
NPALINDROME:
LEA DX,npal
MOV AH,9
INT 21h
RET
