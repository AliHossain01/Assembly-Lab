;asending order
.Model small
.Stack 100h
.Data
.Code
Main proc

Initialize:
	Mov ax,@data
	Mov ds,ax

Input:                   
	Mov ah,1		;input a number/charecter(bl)
	Int 21h
	Mov bl,al

	Mov ah,1		;input a number/charecter(bh)
	Int 21h
	Mov bh,al

	Mov ah,1		;input a number/charecter(cl)
	Int 21h
	Mov cl,al 

Newline:
	Mov ah,2		;creat a new line (\n)
	Mov dl,0dh
	Int 21h
	Mov dl,0ah
	Int 21h
    
COMPARE:
	Cmp bl,bh 		;check bl > bh?
	Jg Cond1		;if true go to Cond1
	Jmp Cond2 		;else go to Cond2
Cond1:
   	Xchg bl,bh		;exchange bl and bh (smallest data in bl than bh)
    	Cmp bl,cl		;compare bl>cl
    	Jg Cond3       		;if true go to Cond3
Cond2:
    	Cmp bl,cl		;compare bl>cl
    	Jg Cond3		;if true go to Cond3
    	Jmp PrintSmall  	;jump for printing bl as a small data
Cond3:
   	Xchg bl,cl   		;exchange bl and cl (smallest data in bl than bh,cl)

PrintSmall: 
    	Mov ah,2		;print small vallu bl
   	Mov dl,bl
    	Int 21h
	
	Cmp bh,cl		;compare bh > cl
    	Jg Cond4		;if true go to Cond4
    	Jmp PrintMidLast	;then print
Cond4:
      	Xchg bh,cl		;after printing mid and 2nd data exchange bh,cl

PrintMidLast:       
    	Mov ah,2		;print mid vallu bh
    	Mov dl,bh
    	Int 21h 

    	Mov ah,2		;print mid vallu cl
    	Mov dl,cl
    	Int 21h

    	Mov ah,4ch 		;return to dos
    	Int 21h  

Main endp
	end main
