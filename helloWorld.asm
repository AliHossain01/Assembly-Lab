.MODEL SMALL
.STACK 100
.DATA 
    
    myMsg DB "Hello Assembly Programmer$"
    

.CODE
  MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
     LEA DX, myMsg
     MOV AH, 9
     INT 21H
    
     MOV AH, 4CH
     INT 21H
     
 MAIN ENDP
    END MAIN 