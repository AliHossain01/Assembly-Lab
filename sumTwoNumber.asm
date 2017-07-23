.Model small
.stack 100h
.data

             ; variable declaration section
            
.code

Main proc   ;Main Procedure       
    
             ;write code section
              
              ; ask user for a number
              
              MOV DL, ':'
              MOV AH, 2
              INT 21h   
              
              ; taking a digit from user
              
              MOV AH, 1
              INT 21h
              
              
              ;SAVE the taking value
              
              MOV CL, AL
              
              ; Ask for second input
              
              MOV DL, ':'
              MOV AH, 2
              INT 21h
              
              ;taking second input
              
              MOV AH, 1
              INT 21h
              
              ; add two number & save in AL
              
              ADD AL, CL
              
              SUB Al, 48   ; sub ascii value 
                         
                   
              MOV DL, AL         
              
              MOV AH, 2
              INT 21h  
              
              
          
          MOV AH, 4ch
          INT 21h
              
    
Main endp       ; Main end procedure

        
                ;other procedure section




       End main