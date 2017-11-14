;Title: read the carecter from keybord and disply it.
.model small
.stack 100hmount
.data
.code
Main Proc

 	MOV AH, 2			;display carecter funtion
	MOV DL, '?'			;comand fro input
	INT 21H				;display it

 	MOV AH, 1			;enter the input
	INT 21h				;scanf("%", &AL)

 	MOV AH, 2			;display carecter funtion
	MOV DL, AL			
	INT 21H				;display it

	MOV AX, 4c00H 		     	;exit to DOS
	INT 21H 

MAIN ENDP
     END MAIN