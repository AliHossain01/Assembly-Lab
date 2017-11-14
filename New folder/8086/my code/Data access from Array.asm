;TITLE: show number using array
.MODEL SMALL
.STACK 100H
.DATA

	ARRAY DW 1,8,4,0,4,9,6,7,8,2,3,8
	SPA   DB ' $'
.CODE
MAIN PROC
   	
	MOV AX,@DATA
	MOV DS,AX
    	
	LEA SI,ARRAY
     	MOV CX,12

LABLE:
     	MOV AL,[SI]
     	ADD AL,48			;pure number
     	MOV DL,AL

     	MOV AH,2
     	INT 21H

     	MOV AH,9
     	LEA DX,SPA
     	INT 21H
     
     	ADD SI,2
	DEC CX
     	JNZ LABLE

      	MOV AH,4CH
      	INT 21H

MAIN ENDP
   END MAIN