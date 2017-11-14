.model small
.stack 100h
.code

main proc
    ;ask user for single digit input
              
    mov Ah,2          
    mov DL,'?'   ;asking for input
    int 21h
    ;Taking an input digit
    
    mov Ah,1
    int 21h
    
    mov CL,Al ;save the first input to CL
    ;SUB CL,48
    ;ask for 2nd input
              
    mov AH,2          
    mov DL,':'
    int 21h
    ;Taking 2nd input 
    
    mov AH,1
    int 21h
            
    MOV BL,AL        
    ADD BL,CL
    SUB BL,48
    mov AH,2  
    MOV DL,BL
    
    int 21h
    
    mov AH,4CH
    int 21h
    
    main endp
    End main