.MODEL SMALL
.STACK 100
.DATA


.CODE
    MAIN PROC
        
        MOV AX, @DATA ; AH REFFERENCING DATA ADDRESS
        MOV DS, AX    ; DS IS THE TEMPORY DATA STORAGE
        
        
        ReadAgain:
                      
                      ; INTPUT DATA
        MOV AH, 1
        INT 21H  
        
        CMP AL, 13  ; COMPARING WITH ENTER, ENTER'S ASCII = 13.
        JE EXIT    ; JE = JUMP IF EQUAL AND HERE EXIT IS A LEBEL 
        
        MOV BL, AL   ; MOVING DATA INTO BL
                       
                       ;DISPLAYING DATA
        MOV DL, BL    ; MOVING DATA INTO BL
        MOV AH, 2
        INT 21H    
        
        LOOP ReadAgain
        
        EXIT:
        MOV AH, 4CH
        INT 21H
        
        MAIN ENDP
    END MAIN
