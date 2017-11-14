		.MODEL SMALL
		.STACK 100H
		.DATA
			MSGA DB 'Present Chanel: $'
			MSGB DB 'Requred Chanel: $'
			MSGC DB 'Lowst Step: $'
			MSGD DB 13,10,'$'
			COUNT DB ?           
			PC DW ?
			RC DW ?
			STEP DW ?
			RESULT DW ?
			TEMP DW ?

		.CODE
		MAIN PROC
			MOV AX,@DATA
			MOV DS,AX

		RAND_IO:
			MOV COUNT,2 
			LEA DX,MSGA					
			MOV AH,9
			INT 21H  
			
			GET_INPUTS:             
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
					CMP COUNT,1
					JNE GET_PC
					
					MOV RC,BX         	
					JMP GET_RC
				
					GET_PC:      				
						MOV PC,BX 					
						LEA DX,MSGB		
						MOV AH,9
						INT 21H
			
					GET_RC:             
						DEC COUNT            
						CMP COUNT,0
						JNE GET_INPUTS         

						
			GET_RESULT:
				MOV BX,PC             
				MOV AX,RC
				CMP BX,RC
				JGE FIRST_CON
				JMP SECOND_CON
				
				FIRST_CON:
					SUB BX,RC 
					MOV STEP,BX 
					JMP START_PRINT
					
				SECOND_CON:
					SUB AX,PC
					MOV STEP,AX 
				
				MOV TEMP,50H
				CMP AX,TEMP
				JLE START_PRINT
				MOV TEMP,100H
				SUB TEMP,AX 
				MOV AX,TEMP
				MOV STEP,AX 

			START_PRINT:
				LEA DX,MSGC				
				MOV AH,9
				INT 21H 
			
				MOV AX,STEP                  
				MOV CX,0                  
				MOV BX,10
			
				STOR_RESULTS:			 
					XOR DX,DX                  
					DIV BX                     
					PUSH DX       			           
					INC CX
					CMP AX,0
					JNE STOR_RESULTS
			
				PRINT_RESULTS:			      
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