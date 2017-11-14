org 100h
.model small
.stack 100h
.data
.code

 
    XOR BX,BX 
    MOV CL,4 
    MOV AH,1 
    INT 21H
    
    WHILE_:

      cmp al,0dh
    je LETTER
    
    AND AL,0FH
    JMP SHIFT
    
    LETTER:
    SUB AL,37H
    
    SHIFT:
    SHL BX,CL
    OR BL,AL
    INT 21H
    JMP WHILE_
    
    END_WHILE:
    
    
     
  
  
main proc

