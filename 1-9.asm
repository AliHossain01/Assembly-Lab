.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC      
      MOV AH,1
      INT 21H
      MOV BL,AL
      
      MOV BH,'1'
      
TOP:      
      MOV AH,2
      MOV DL,BH
      INT 21H
      INC BH
      CMP BH,BL
      JG EXIT
      
      JMP TOP
      
    
      
       
        
        
 EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN