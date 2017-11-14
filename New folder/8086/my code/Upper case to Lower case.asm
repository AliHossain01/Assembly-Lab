;TITLE : Lower case to upper case letter
.MODEL SMALL
.STACK 100H
.DATA
	MSGA DB 'Enter the Lower case Letter: $'
	MSGB DB 'The required Upper case Letter: $'
 	CHAR DB ?

.CODE
MAIN PROC
	MOV AX,@DATA
 	MOV DS,AX

	LEA DX,MSGA
 	MOV AH,9
 	INT 21H

	MOV AH,1
	INT 21H
	MOV CHAR,AL
 
	MOV AH,2			;new line
	MOV DL,0DH
	INT 21H
	MOV DL,0AH
	INT 21H		
			
	LEA DX,MSGB
 	MOV AH,9
 	INT 21H

	SUB CHAR,32				;SUB CHAR,20H
 	MOV AH,2
	MOV DL,CHAR
	INT 21H

	MOV AH,4CH
	INT 21H

MAIN ENDP
	END MAIN