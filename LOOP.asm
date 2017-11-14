.MODEL small    
.stack 100h 

.data

.code

MAIN PROC
    MOV AH, 2       ; SET DISPLAY PROCEDURE
    MOV DL, 48      ; SET INITIAL DISPLAY FOR DL
    MOV CL, 10      ; SET INITIAL DISPLAY FOR CL
    
    Display_loop: INT 21h   ; DISPLAY DL AND LEVELING THE LINE 
    INC DL                  ; INCREMENT DL
    DEC CL                  ; DECREMENT CL
    JNZ Display_loop     ; jump not zero = JNZ AND WHEN CL = 0 THEN OUT FROM THE LOOP
    
                         ; END THE LOOP
                         
    MOV AH, 4ch
    INT 21h
    
MAIN ENDP
END MAIN
    