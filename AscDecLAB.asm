include 'emu8086.inc' 

.MODEL SMALL
.STACK 100H
.DATA     
                ; data section
 MAX DB ?        ; a variable named MAX with no initial value
 MID DB ?        ; a variable named MID with no initial value
 MIN DB ?        ; a variable named MIN with no initial value

.CODE   ; code section     

MAIN PROC              ; main procedure start
    MOV AX,@DATA        ; initialisation of data segment
    MOV DS,AX
                        ; first input from user
    MOV AH,1            ; set input function 1 into AH
    INT 21H             ; interrupt 21h
    MOV CL,AL           ; CL = first input
    
    print ' '           ; print single space
    
    MOV AH, 1           ;   ; set input function 1 into AH
    INT 21H              ; interrupt 21h
    MOV BL,AL           ; BL = 2nd number
    
     print ' '           ; print single space
    
    MOV AH, 1
    INT 21H
    MOV CH,AL           ; CH = 3rd number 
    
     print ' '           ; print single space
    
CHECK_CL_1:    
    CMP CL,BL           ; checking CL as max
    JL CHECK_BL_1       ; if CL < BL then jumpto CHECK_BL_1 
    
    CMP CL,CH           ; else CL > BL 
    JL CHECK_BL_1       ; if CL < CH then jumpto CHECK_BL_1
    
    MOV MAX,CL          ; else MAX = CL
    
    CMP BL,CH           ; checking MID & MIN
    JL CHECK_CL_2       ; if BL < CH then jumpto CHECK_CL_2 
    
    MOV MID,BL          ; else MID = BL
    MOV MIN,CH          ; MIN = CH
    JMP PRINT 
    
CHECK_CL_2:             ; else checking MID & MIN where MAX = CL  

    MOV MID,CH          
    MOV MIN,BL
    JMP PRINT            ;jump to print 


CHECK_BL_1:             ; checking BL as max
    CMP BL,CH
    JL CHECK_CH_1       ; if BL < CH thn jumpto CHECK_CH_1
    
    MOV MAX,BL          ; else MAX = BL
    
    CMP CL,CH           ; checking MID & MIN
    JL CHECK_BL_2       ; if CL < CH thn jumpto CHECK_BL_2
    MOV MID,CL
    MOV MIN,CH
    JMP PRINT
CHECK_BL_2:             ; else checking MID & MIN where MAX = BL
    MOV MID,CH          
    MOV MIN,CL 
    JMP PRINT
    
    
CHECK_CH_1:             ; checking CH as max
    MOV MAX,CH
              
    CMP CL,BL           ; checking MID & MIN where MAx = CH
    JL CHECK_CH_2       ; IF CL < BL then jumpto CHECK_CH_2
    MOV MID,CL
    MOV MIN,BL
    JMP PRINT
CHECK_CH_2:             ; else checking MID & MIN where MAX = CH
    MOV MID,BL
    MOV MIN,CL
    JMP PRINT
    


PRINT:                 
                ; displaying newline
   
     MOV DL,0AH 
      MOV AH,2
     INT 21H    
     MOV DL,0DH 
      MOV AH,2
     INT 21H
                      ; displaying the min
     MOV DL,MIN 
      MOV AH,2
     INT 21H       
     
     print ' '         ; displaying space
                        ; displaying the mid
      MOV DL,MID
       MOV AH,2
     INT 21H           
      
      print ' '        ; displaying single space
                       
                       ; displaying the max
       
     MOV DL,MAX
     MOV AH,2
     INT 21H            
           
     print ' '          ; displaying single space
                       
                       ; displaying new line
     
     MOV DL,0AH        ; 0AH = newline
     MOV AH,2
     INT 21H           
     MOV DL,0DH        ; ODH = cret 
     MOV AH,2
     INT 21H
                       
                        ; displaying the max
     MOV AH,2
     MOV DL,MAX
     INT 21H           
     
     print ' '          ; display the max
                 
     MOV DL,MID 
      MOV AH,2
     INT 21H            ; display the mid
    
     
     print ' '         ; displying a space
                        
                        ; display the min
     MOV DL,MIN 
      MOV AH,2
     INT 21H           
    
 
 Exit:
                ; EXIT
  MOV ah, 4ch
  int 21h
               ; main procedure end
  MAIN ENDP
  END MAIN
    