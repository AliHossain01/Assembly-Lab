
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  
.MODEL SMALL 
.STACK 100H
.CODE 

; add your code here  

MAIN PROC

    MOV AH,1
    INT 21H     ; INPUT
    
    MOV BL,AL   ; BL = AL
    
    MOV AH,2   ; OUTUT
    MOV DL,0AH ; FOR NEW LINE 
    INT 21H
    MOV DL,0DH  ; CHAR RETURN
    INT 21H
    
    MOV AH,2 ; OUTPUT FUNCTION
    MOV DL,BL ;DL = BL
    INT 21H 
    
    
        

 MOV AH,4CH
 INT 21H
 MAIN ENDP
END MAIN
