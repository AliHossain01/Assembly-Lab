		.MODEL SMALL
		.STACK 100H
		.DATA
			MSGA DB 'Enter Velocity: $'
			MSGB DB 'Enter Time: $'
			MSGC DB 'Distence: $'
			MSGD DB 13,10,'$'
			COUNT DB ?           
			VELOCITY DW ?
			TIME DW ?
			DISTENCE DW ? 
			TEMP DW ?

		.CODE
		MAIN PROC
			MOV AX,@DATA
			MOV DS,AX

		RAND_IO:
			MOV COUNT,2 
			LEA DX,MSGA						;Print 'Enter Velocity:'
			MOV AH,9
			INT 21H  
			
			GET_INPUTS:             
				MOV DX,0
				MOV BX,0     				;Clear bx       
				MOV AH,1
				INT 21H 
			
				CMP AL,0DH
				JE END_INPUTS   			;If enter      

				CONVERT_TO_NUM:        
					AND AX,000FH        	;Use full 16 bits of AX 
					MOV TEMP,AX          
					MOV AX,10                             
					MUL BX               
					MOV BX, AX           
					ADD BX,TEMP          

				MOV AH,1				 	;Input new digit
				INT 21H                             
				CMP AL,0DH
				JNE CONVERT_TO_NUM 

				END_INPUTS:
					CMP COUNT,1
					JNE GET_V
					
					MOV TIME,BX             ;Get Time 
					JMP GET_T
				
					GET_V:      				
						MOV VELOCITY,BX 	;Get Velocity 			
						LEA DX,MSGB			;Print 'Enter Time:'
						MOV AH,9
						INT 21H
			
					GET_T:             
						DEC COUNT            
						CMP COUNT,0
						JNE GET_INPUTS         

						
			GET_DISTANCE:
				MOV BX,TIME             
				MOV AX,VELOCITY
				MUL BX  					;AX = AX*BX 
				MOV BX,2
				MUL BX 
				MOV DISTENCE,AX 			;Get result in destence

			START_PRINT:
				LEA DX,MSGC					;Print Distence 
				MOV AH,9
				INT 21H 
			
				MOV AX,DISTENCE                  
				MOV CX,0                  
				MOV BX,10
			
				STOR_RESULTS:				;stor each digits in stack  
					XOR DX,DX                  
					DIV BX                     
					PUSH DX       			           
					INC CX
					CMP AX,0
					JNE STOR_RESULTS
			
				PRINT_RESULTS:				;print each digits from stack       
					MOV AH,2
					POP DX      		         
					ADD DL,48
					INT 21H
					LOOP PRINT_RESULTS                

			NEW_INPUT:
				LEA DX,MSGD
				MOV AH,9
				INT 21H 
				JMP RAND_IO

		MAIN ENDP
			END MAIN