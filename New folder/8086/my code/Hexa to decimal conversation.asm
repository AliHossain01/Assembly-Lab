;TITLE: hexa to decimal conversation
.MODEL SMALL
.STACK 100H
.DATA
   	MSGA DB 0DH,0AH,'Enter a hexa digit: $'
   	MSGB DB 0DH,0AH,'The Decimal conversetion is: $'
  	MSGC DB 0DH,0AH,'Do u want to do again(Enter Y/N)? $'
	MSGD DB ' Ha..Ha..Ha!!! This is not a Hexa Digit. $'
  	TEMP DB ?
  	A1 DB '10 $'
  	B1 DB '11 $'
  	C1 DB '12 $'
  	D1 DB '13 $'
  	E1 DB '14 $'
  	F1 DB '15 $'
.CODE
MAIN PROC
     	MOV AX,@DATA
     	MOV DS,AX

WHILE:
 	MOV AH,9			;Enter a hexa digit
 	LEA DX,MSGA
     	INT 21H
	
     	MOV AH,1			;take input
     	INT 21H

     	MOV AH,9			;The Decimal conversetion is
     	LEA DX,MSGB
     	INT 21H
     
     	CMP AL,'9'			
     	JLE PRINT_0TO9

     	CMP AL,'9'
     	JG PRINT_ATOF

PRINT_0TO9:
    	MOV AH,2
    	MOV TEMP,AL
    	MOV DL,TEMP
    	INT 21H
 	
 	JMP CHECK

PRINT_ATOF:
	CMP AL,'a'
 	JE PRINT_A
	JMP NEXT_1

 	PRINT_A:
 		MOV AH,9			
    		LEA DX,A1
    		INT 21H
 		
 		JMP CHECK

	NEXT_1:
 		CMP AL,'b'
 		JE PRINT_B
		JMP NEXT_2
	
 		PRINT_B:
 			LEA DX,B1
    			INT 21H
 		
 			JMP CHECK


	NEXT_2:
 		CMP AL,'c'
 		JE PRINT_C
		JMP NEXT_3
	
 		PRINT_C:
 			LEA DX,C1
    			INT 21H
 		
 			JMP CHECK


	NEXT_3:
 		CMP AL,'d'
 		JE PRINT_D
		JMP NEXT_4
	
 		PRINT_D:
 			LEA DX,D1
    			INT 21H
 		
 			JMP CHECK


	NEXT_4:
 		CMP AL,'e'
 		JE PRINT_E
		JMP NEXT_5
	
 		PRINT_E:
 			LEA DX,E1
    			INT 21H
 		
 			JMP CHECK


	NEXT_5:
 		CMP AL,'f'
 		JE PRINT_F
		JMP NEXT_6
	
 		PRINT_F:
 			LEA DX,F1
    			INT 21H
 		
 			JMP CHECK


	NEXT_6:
		MOV AH,2
		MOV DL,2
 		INT 21H

		MOV AH,9
 		LEA DX,MSGD
    		INT 21H

		JMP CHECK
CHECK:
 	MOV AH,9			;Do u want to do again(Enter Y/N)?
    	LEA DX,MSGC
    	INT 21H

    	MOV AH,1
    	INT 21H

    	CMP AL,'y'
    	JE AGAIN_WHILE
    	JMP END_P
	
AGAIN_WHILE:
	MOV AH,2			;new line
	MOV DL,0DH
	INT 21H
	MOV DL,0AH
	INT 21H

 	JMP WHILE
END_P:
	MOV AH,4CH
	INT 21H

MAIN ENDP
   END MAIN
     