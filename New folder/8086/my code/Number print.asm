;title: print number
.MODEL SMALL
.STACK 100H
.DATA
	SPA DB ' $'
 	MSG DB 'The numbers: $'
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX

	LEA DX,MSG
	MOV AH,9
     	INT 21H

	MOV BL, 48
	MOV CX, 10

PRINT_LOOP:
 	MOV AH, 2
 	MOV DL,BL
	INT 21H

     	LEA DX,SPA
	MOV AH,9
     	INT 21H
	
	INC BL		;increment of 1, 2,.....
	DEC CX		;10 time runing
	JNZ PRINT_LOOP	
        
	MOV AH, 4CH	;dos exit
	INT 21H


MAIN ENDP
	END MAIN