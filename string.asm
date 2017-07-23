.Model small
.stack 100h
.data

             ; variable declaration section 
             
             st1 DB "Enter a number:$"
            
.code

Main proc   ;Main Procedure       
    
             ;write code section
              
            
         ; initialize data segment
         MOV AX, @Data
         MOV DS, AX           
         
         
         ; load the starting address of st1
         LEA DX, st1                     ; LEA =LOad effective address
         
         
         ;display st1
         MOV AH, 9
         INT 21h
                
                MOV AH, 4ch
                INT 21h
          
              
    
Main endp       ; Main end procedure

        
                ;other procedure section




       End main