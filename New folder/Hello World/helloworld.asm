
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA

STRING DB 'HELLE WORLD $'  


.CODE 
  MAIN PROC ; MAIN PROCEDURE
    
    MOV AX,@DATA ; INTILIZATION OF DATA SEGMENT
    MOV DS,AX
    
     
    LEA DX,STRING ; DX = STRING (LEA :: LOAD EFFECTIVE ADDRESS)
    MOV AH,9        ; STRING PRINTING FUNCTION
    INT 21H
     
     
     
    
    MOV AH,4CH
    INT 21H
    
   MAIN ENDP  ; END MAIN PROCEDURE
  END MAIN

ret




