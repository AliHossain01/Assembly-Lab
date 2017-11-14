		.MODEL SMALL
		.STACK 100H
		.DATA
			MSGA DB 'How many line do want to write: $'
			MSGB DB ' Requared copy-paste time: $'
			MSGC DB 'Case : $'
			MSGD DB 13,10,'$'
			INPUT DW ?
			OUTPUT DW ?
			TEMP DW ?
			CASE DW ?
			COUNT DW ?
		
		.CODE
		MAIN PROC
			MOV AX,@DATA
			MOV DS,AX
			MOV CASE,0
		
			RAND_IO:
				LEA DX,MSGA
				MOV AH,9
				INT 21H
				MOV COUNT,0
				
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
						MOV INPUT,BX
						CMP INPUT,0
						JE END_PRO
						
		GET_RESULT:
			MOV BX,2H
			MOV AX,INPUT
			
			FOR_LOOP:
				DIV BX
				INC COUNT
				CMP AX,1H
				JG FOR_LOOP
				
		START_PRINT:
			LEA DX,MSGC
			MOV AH,9
			INT 21H
			JMP CASE_NUMBER
			
			BACK_TO_PRINT:
				LEA DX,MSGB
				MOV AH,9
				INT 21H
				MOV AX,COUNT
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
				JMP NEW_INPUT
		
		CASE_NUMBER:
			MOV AX,CASE
			MOV CX,0
			MOV BX,10
			
			STOR_CASE_NUM:
				XOR DX,DX
				DIV BX
				PUSH DX
				INC CX
				CMP AX,0
				JNE STOR_CASE_NUM
			
			PRINT_CASE_NUM:
				MOV AH,2
				POP DX
				ADD DL,48
				INT 21H
				LOOP PRINT_CASE_NUM
				
			INC CASE
			JMP BACK_TO_PRINT
		
		NEW_INPUT:
			LEA DX,MSGD
			MOV AH,9
			INT 21H
			INT 21H
			JMP RAND_IO
			
		END_PRO:
			MOV AH,4CH
			INT 21H
			
		MAIN ENDP
		END MAIN