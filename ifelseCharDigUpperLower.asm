.model small
.stack 100h
.data 
    
    digitmsg db "This is a digit..$" 
    spmsg db "This is a special character..$"
    lowermsg db "This is a lower case letter..$"
    upermsg db "This is a upper case letter..$"

.code
main proc   
    
    mov ax, @data
    mov ds, ax
    
           ;first input from user
    mov ah, 1
    int 21h
    
    mov bl, al
               ; displaying single space
    mov dl, ' '
    mov ah, 2
    int 21h
                 ; displaying new line
    mov dl, 10
    mov ah, 2
    int 21h
                ; displaying carriage return
    mov dl, 13
    mov ah, 2
    int 21h
             ; checking for digit
    cmp bl, 48
    JGE digit  ; if greater than or equal then jump to digit
    
    jmp special  ; else jump to special             
     
    
    
digit:          ; checking digit's upper bound
    cmp bl, 57
    jle digit2 
               ; checking upper case
     cmp bl, 65
     jge uppercaseLetter  ; jump to uppercaseLetter if bl greater than equal 65
     jmp special          ; jump if bl< 65
          
           
           
           
           
    digit2:             ; display digit message
        lea dx, digitmsg
        mov ah, 9
        int 21h
        jmp exit:  
                    ; compare uppercase upper bound
  uppercaseLetter:
        cmp bl, 90  ;
        jle upper2  ; jump to upper2
                    ;jump to lower
        jmp lower     
        
   
   
   upper2:       ; displaying upper case message
    lea dx,upermsg
    mov ah, 9
    int 21h
    jmp exit   
    
             ; dispalying special char msg
    special:
    lea dx, spmsg
    mov ah, 9
    int 21h
    jmp exit
    
    lower:        ; checking lower case lower bound
        cmp bl, 97
        jge lower2  ; if bl greater than eual 97 then jump lower2
        jmp special ; else jump special
        
  lower2:       ;cheking lowercase upper bound
        cmp bl, 122
        jle lower3   ; if less than equal them jump lower3
        jmp special  ; else jump special
        
   lower3:         ; displaying lower case msg
       lea dx, lowermsg
       mov ah, 9
       int 21h
       jmp exit     
                  ; exit
    exit:
    mov ah, 4ch
    int 21h    
         
    
    
    main endp
end main
