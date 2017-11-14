;title: Charecter print
.MODEL SMALL
.STACK 100H
.DATA
 	SPA DB ' $'
	MSG DB 'The carecters: $' 	
.CODE
MAIN PROC
	MOV AX, @DATA
 	MOV DS, AX

	MOV AH, 9
	LEA DX, MSG
	INT 21H
	
	MOV BL, 65
 	MOV CX, 26

PRINT_LOOP:
	MOV AH, 2
 	MOV DL, BL
	INT 21H

	MOV AH, 9
	LEA DX, SPA
	INT 21H

	INC BL		;increment of a, b,.....
	DEC CX		;26 time runing
	JNZ PRINT_LOOP	
        
	MOV AH, 4CH	;dos exit
	INT 21H


MAIN ENDP
	END MAIN
