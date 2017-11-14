.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC      
      MOV AH,1
      INT 21H
      MOV BL,AL
      INT 21H
      MOV BH,AL   ;take 3 inputs
      INT 21H
      MOV CL,AL
           
           ;FOR SMALLER NUMBER
    
      CMP BL,BH ;if BL<BH jump L2
      JLE SCND1
      
      JMP SCND2
      
      SCND1:
      CMP BL,CL
      JLE TRD1
      
      MOV AH,2
      MOV DL,CL
      INT 21H
      JMP TRD2
      
      TRD1:
      MOV AH,2
      MOV DL,BL
      INT 21H
      CMP BH,CL
      JLE FRT1
      
      MOV AH,2
      MOV DL,CL
      INT 21H 
      
      MOV AH,2
      MOV DL,BH
      INT 21H
      JMP EXIT
      
      FRT1:
      MOV AH,2
      MOV DL,BH
      INT 21H 
      
      MOV AH,2
      MOV DL,CL
      INT 21H
      JMP EXIT
      
      TRD2:
      MOV AH,2
      MOV DL,CL
      INT 21H
      CMP BL,BH
      JLE FRT2
      
      MOV AH,2
      MOV DL,BH
      INT 21H 
      
      MOV AH,2
      MOV DL,BL
      INT 21H
      JMP EXIT
      
      FRT2:
      MOV AH,2
      MOV DL,BL
      INT 21H 
      
      MOV AH,2
      MOV DL,BH
      INT 21H
      JMP EXIT
      
      
      SCND2:
      CMP BH,CL
      JLE TRD3
      
      MOV AH,2
      MOV DL,CL
      INT 21H
      JMP TRD4
      
      TRD3:
      MOV AH,2
      MOV DL,BH
      INT 21H
      CMP BL,CL
      JLE FRT3
      
      MOV AH,2
      MOV DL,CL
      INT 21H 
      
      MOV AH,2
      MOV DL,BL
      INT 21H
      JMP EXIT
      
      
      FRT3:
      MOV AH,2
      MOV DL,BL
      INT 21H 
      
      MOV AH,2
      MOV DL,CL
      INT 21H
      JMP EXIT
      
      TRD4:
      CMP BL,BH
      JLE FRT4
      
      MOV AH,2
      MOV DL,BH
      INT 21H 
      
      MOV AH,2
      MOV DL,BL
      INT 21H
      JMP EXIT
      
      FRT4:
      MOV AH,2
      MOV DL,BL
      INT 21H 
      
      MOV AH,2
      MOV DL,BH
      INT 21H
      JMP EXIT  
         
        
 EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN