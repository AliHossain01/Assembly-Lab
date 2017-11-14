;TITLE: show number using array
.MODEL SMALL
.STACK 100H
.DATA
	MSGA DB 'Enter the Searching Number: $'
	MSGB DB 13,10,'Data Found! $'
	MSGC DB 13,10,'Data Not Found! $'
	MSGD DB 13,10,'Data of Array: $'
 	SPA  DB ' $'
	ARRAY DW 1,0,2,9,3,8,4,5,3,2,8,4,1,0,3

.CODE
MAIN PROC
   	
	MOV AX,@DATA
	MOV DS,AX

	LEA DX, MSGA				;Enter the Searching number:
	MOV AH, 9
	INT 21H

	MOV AH, 1
	INT 21H
 	ADD AL, 0 
	MOV BL, AL				;searching number is in BL
    	
	LEA SI, ARRAY
     	MOV CX,15

FIND_DATA:
	MOV AL,[SI]				;print data of array
	ADD AL, 48

     	CMP AL,BL
	JE PRINT_FOUND
     
     	ADD SI,2
	DEC CX
	JNZ FIND_DATA

	JMP PRINT_NOT_FOUND

PRINT_FOUND:	
	LEA DX, MSGB					
 	MOV AH,9
	INT 21H

	JMP END_PRO

PRINT_NOT_FOUND:	
	LEA DX, MSGC					
 	MOV AH,9
	INT 21H

END_PRO:
      	MOV AH,4CH
      	INT 21H

MAIN ENDP
   END MAIN