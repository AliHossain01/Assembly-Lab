.model small
.stack 100h
.data
	array dw 9 dup(?)
	msga db 'enter the numbers: $'
	msgb db 'the maximum: $' 
	msgc db 10,13,'the minimum: $'
	newl db 10,13,'$'
	temp1 dw ?
	temp2 dw ?
	temp3 dw ?
	max dw ?
	min dw ? 
	
	
.code
main proc
	mov ax,@data
	mov ds,ax
	
	lea dx,msga				
	mov ah,9
	int 21h
	
	lea dx,newl				
	mov ah,9
	int 21h

	mov cx,9
	mov temp1,0

input:
   	mov ah,1
	xor bx,bx
	int 21h                                
	cmp al,0dh
	je end_input              

	con_to_num:            
		and ax,000fh             
		mov temp3,ax               
		mov ax,10                                 
		mul bx                    
		mov bx, ax                
		add bx,temp3               

		mov ah,1
		int 21h                                  
		cmp al,0dh
		jne con_to_num

		end_input:
			mov ax,bx
			mov bx,temp1
			mov array[bx],ax
			add temp1,2
			loop input


;print maximum number
	xor dx,dx
	xor bx,bx
	mov cx,9 
	 
	mov bx,0
	mov ax,array[bx]
	mov max,ax
	mov temp2,2
	
	lea dx,msgb				
	mov ah,9
	int 21h
	
find_max:
	mov bx,temp2
	mov ax,array[bx]
	cmp ax,max
	jl check_again1
	mov max,ax

	check_again1:
		add temp2,2
		cmp temp2,18
		jne find_max 
	
	xor cx,cx
	mov ax,max
	mov bx,10
	
get_max:
	xor dx,dx
	div bx
	push dx
	inc cx
	cmp ax,0
	jne get_max

	print_max:
		mov ah,2
		pop dx                     
		add dl,48
		int 21h
		loop print_max
	
;print minimum number 
	xor dx,dx
	xor bx,bx
	mov cx,9 
	 
	mov bx,0
	mov ax,array[bx]
	mov min,ax
	mov temp2,2
	
	lea dx,msgc				
	mov ah,9
	int 21h
	
find_min:
	mov bx,temp2
	mov ax,array[bx]
	cmp ax,min 
	jg check_again2
	mov min,ax

	check_again2:
		add temp2,2
		cmp temp2,18
		jne find_min	
		
	xor cx,cx
	mov ax,min
	mov bx,10
	
get_min:
	xor dx,dx
	div bx
	push dx
	inc cx
	cmp ax,0
	jne get_min 

	print_min:
		mov ah,2
		pop dx                     
		add dl,48
		int 21h
		loop print_min	
	
		
exit_dox:
	mov ah,4ch
	int 21h
	main endp
	end main