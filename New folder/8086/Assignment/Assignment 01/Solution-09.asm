.MODEL SMALL
.STACK 100H
.DATA
	MSGA DB 'Enter two numbers: $'
	MSGB DB 13,10,'Enter Base: $'
	MSGC DB 'Enter Power: $'
	MSGD DB 'B to the power p is: $'
	COUNT DB 2           
	BASE DW ?
	POWER DW ?
	TEMP DW ?

.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	LEA DX,MSGA				;Print 'Enter two numbers(Max 5 digits):'
	MOV AH,9
	INT 21H               

	LEA DX,MSGB				;Print 'First Number:'
	MOV AH,9
	INT 21H
	
	MOV DX,0
	
GET_INPUTS: 
	MOV BX,0     			;Clear bx       
	MOV AH,1
	INT 21H 
	
	CMP AL,0DH
	JE END_INPUTS   		;If enter      

	CON_NUM:        
		AND AX,000FH         ;Use full 16 bits of AX 
		MOV TEMP,AX          
		MOV AX,10                             
		MUL BX               
		MOV BX, AX           
		ADD BX,TEMP          

	MOV AH,1				 ;Input new digit
	INT 21H                             
	CMP AL,0DH
	JNE CON_NUM

	END_INPUTS:
		CMP COUNT,1
		JNE GET_N1
		
		MOV POWER,BX             	;Get power 
		JMP GET_N2
		
		GET_N1:      				
			MOV BASE,BX 			;Get base
			
			LEA DX,MSGC				;Print 'Scond Number:'
			MOV AH,9
			INT 21H
	
		
		GET_N2:             
			DEC COUNT            
			CMP COUNT,0
			JNE GET_INPUTS         

	MOV CX,POWER             
	MOV BX,BASE             
	MOV AX,1

GET_RESULTS:
	MUL BX  
	DEC CX
	CMP CX,0 
	JNE GET_RESULTS
	MOV BX,AX 

START_PRINT:
	LEA DX,MSGD					;B to the power p is: 
	MOV AH,9
	INT 21H 
	
	MOV AX,BX                  
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

	MOV AH,4CH
	INT 21H

MAIN ENDP
	END MAIN