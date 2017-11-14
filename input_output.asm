.Model small
.stack 100h
.data

             ; variable declaration section
            
.code

Main proc   ;Main Procedure       
    
             ;write code section
            
            ;Input 
            MOV AH, 1
            INT 21h   ; set in AL
                 
            ;Output
            
            MOV AH, 2
            MOV DL, AH
            INT 21h
            
    
Main endp       ; Main end procedure

        
                ;other procedure section

       End main