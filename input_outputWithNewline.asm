.Model small
.stack 100h
.data

             ; variable declaration section
            
.code

Main proc   ;Main Procedure       
    
             ;write code section
              
              ; ask user for a nsingle char
              
              MOV DL, ':'
              MOV AH, 2
              INT 21h   
              
              ; taking a single char from user
              
              MOV AH, 1
              INT 21h  
              
              mov BL,AL
              
             ; SHOWING NEWLINE
              MOV DL, 0DH
              MOV AH, 2 
              INT 21h
              
              MOV DL, 0Ah 
              INT 21h       ; 2 is given in AH
              
              ;showing the input char
              
              MOV DL, BL
              INT 21h
              
              ; return to DOS
          
          MOV AH, 4ch
          INT 21h
              
    
Main endp       ; Main end procedure

        
                ;other procedure section




       End main