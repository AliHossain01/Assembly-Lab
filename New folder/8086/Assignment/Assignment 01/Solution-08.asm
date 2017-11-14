.MODEL SMALL
.STACK 100H
.DATA
	MSGA DB 'Enter two numbers: $'
	MSGB DB 13,10,'First Number: $'
	MSGC DB 'Scond Number: $'
	MSGD DB 'GCD of these Number: $'
	COUNT DB 2           
	N1 DW ?
	N2 DW ?
	TEMP DW ?

.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	LEA DX,MSGA				;Print 'Enter two numbers:'
	MOV AH,9
	INT 21H               

	LEA DX,MSGB				;Print 'First Number:'
	MOV AH,9
	INT 21H
	
	MOV DX,0
	
GET_INPUTS: 
	MOV BX,0            
	MOV AH,1
	INT 21H 
	
	CMP AL,0DH
	JE END_INPUTS         

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
		
		MOV N2,BX             
		JMP GET_N2
		
		GET_N1:      
			MOV N1,BX 
			
			LEA DX,MSGC				;Print 'Scond Number:'
			MOV AH,9
			INT 21H
	
		
		GET_N2:             
			DEC COUNT            
			CMP COUNT,0
			JNE GET_INPUTS         

	MOV CX,N2             
	MOV BX,N1             
	CMP BX,CX
	JB GET_GCD               
	XCHG BX,CX           

GET_GCD:
	MOV DX,0                     
	MOV AX,CX
	DIV BX               
	CMP DX,0             
	JE START_PRINT
	MOV CX,BX            
	MOV BX,DX            
	JMP GET_GCD

START_PRINT:
	LEA DX,MSGD					;GCD of these Number: 
	MOV AH,9
	INT 21H 
	
	MOV AX,BX                  
	MOV CX,0                  
	MOV BX,10
	
	STOR_GCD:
		XOR DX,DX                  
		DIV BX                     
		PUSH DX                    
		INC CX
		CMP AX,0
		JNE STOR_GCD

	PRINT_GCD:
		MOV AH,2
		POP DX                     
		ADD DL,48
		INT 21H
		LOOP PRINT_GCD                

	MOV AH,4CH
	INT 21H

MAIN ENDP
	END MAIN