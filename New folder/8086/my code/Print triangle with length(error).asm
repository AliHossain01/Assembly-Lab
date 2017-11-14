;TITLE: PRINT TRIANGLE
.MODEL SMALL
.STACK 100H
.DATA
	MSGA DB 'Enter the Front for triangle: $'
	MSGB DB 13,10,'The Required Triangle: $'
 	MSGC DB 13,10,'Enter the length: $'
 	MSGD DB 13,10,'$'

 	FRO DB ?
 	LEN DB ?

.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX

	LEA DX, MSGA
 	MOV AH,9
 	INT 21H

 	MOV AH, 1			;INPUT OF FRONT FOR TRIANGLE
 	INT 21H
 	MOV FRO,AL

	LEA DX, MSGC
 	MOV AH,9
 	INT 21H

	MOV AH,1
 	INT 21H
 	MOV LEN,AL

	LEA DX, MSGB
 	MOV AH,9
 	INT 21H

	LEA DX, MSGD
 	MOV AH,9
 	INT 21H

 	MOV CX,'0'				;if just 0; 48+len line will print 

PRINT_TRIANGLE:

	INC CX
	MOV BH,CX
 	
	PRINT_EACH_LINE:
		MOV AH, 2
 		MOV DL,FRO			;PRINT FRONT
 		INT 21H

		DEC BH
 		JNZ PRINT_EACH_LINE	

	LEA DX, MSGD
 	MOV AH,9
 	INT 21H

	CMP CX,LEN
	JE END_PRO
 	JMP PRINT_TRIANGLE
	
END_PRO: 
 	MOV AH, 4CH
	INT 21H

MAIN ENDP
   END MAIN
 	













