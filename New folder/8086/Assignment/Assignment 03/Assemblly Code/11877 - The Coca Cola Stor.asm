		.MODEL SMALL
		.STACK 100H
		.DATA
			MSGA DB 'Enter the Empty Bottols: $'
			MSGB DB 'Bottols taken for Empty: $'
			MSGC DB 13,10,'$'	
			COUNT DB ?           
			INPUT DW ? 
			OUTPUT DW ?
			TEMP DW ?
			CASE DW ?

		.CODE
		MAIN PROC
			MOV AX,@DATA
			MOV DS,AX
			MOV CASE,10					;This for 10th test case 
		
		RAND_IO:
			CMP CASE,0
			JE END_PRO
			
			LEA DX,MSGA					
			MOV AH,9
			INT 21H  
			
			GET_INPUTS:             	;Get Input 
				MOV DX,0
				MOV BX,0     			      
				MOV AH,1
				INT 21H 
			
				CMP AL,0DH
				JE END_INPUTS   		      

				CONVERT_TO_NUM:        
					AND AX,000FH        
					MOV TEMP,AX          
					MOV AX,10                             
					MUL BX               
					MOV BX, AX           
					ADD BX,TEMP          

				MOV AH,1				
				INT 21H                             
				CMP AL,0DH
				JNE CONVERT_TO_NUM 

				END_INPUTS:
					MOV INPUT,BX
					CMP INPUT,0
					JE END_PRO
						
			GET_RESULT: 
				MOV BX,2H
				MOV AX,INPUT
				DIV BX 
				MOV OUTPUT,AX 
				
				
			START_PRINT:
				LEA DX,MSGB				 
				MOV AH,9
				INT 21H 
			          
				MOV AX,OUTPUT
				MOV CX,0                  
				MOV BX,10
			
				STOR_RESULTS:			;stor each digits in stack  
					XOR DX,DX                  
					DIV BX                     
					PUSH DX       			           
					INC CX
					CMP AX,0
					JNE STOR_RESULTS
			
				PRINT_RESULTS:			;print each digits from stack       
					MOV AH,2
					POP DX      		         
					ADD DL,48
					INT 21H
					LOOP PRINT_RESULTS      

			NEW_INPUT:
				LEA DX,MSGC
				MOV AH,9
				INT 21H 
				INT 21H
				DEC CASE
				JMP RAND_IO
		
		END_PRO:
			MOV AH,4CH
			INT 21H
		
		MAIN ENDP
			END MAIN