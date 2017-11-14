		.MODEL SMALL
		.STACK 100H
		.DATA
			MSGA DB 'Input: $'
			MSGB DB 'Output: $'
			MSGC DB 13,10,'$'	
			COUNT DW ?           
			INPUT DW ? 
			OUTPUT DW ?
			TEMP DW ?

		.CODE
		MAIN PROC
			MOV AX,@DATA
			MOV DS,AX
		
		RAND_IO:
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
					JLE END_PRO 
						
			GET_RESULT:
				MOV COUNT,0H
				MOV CX,INPUT
				MOV AX,INPUT
				
				FOR_LOOP:
					ADD AX,COUNT
					MOV Output,AX
					DEC CX
					INC COUNT
					CMP CX,0H
					JE FOR_LOOP
				
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
				JMP RAND_IO
				
			END_PRO:
				MOV AH,4CH
				INT 21H
				
		MAIN ENDP
			END MAIN