.MODEL SMALL
.STACK 100H
.DATA
        ucaseMSG    DB  "This is an upper case character$"
        lcaseMSG    DB  "This is an lower case character$"
        digitMSG    DB  "This is a digit$"
        spclMSG    DB  "This is special character$"
.CODE
MAIN PROC    
    ;initialize data segment
            MOV AX,@DATA
            MOV DS,AX               
            
        	;prompt user 
        	MOV AH,2
        	MOV DL,':'
        	INT 21H
        	;input from user
        	MOV AH,1
        	INT 21H			;the number has been stored in AL
        	MOV CL,AL		;save the 1st number in CL
upper_case_checking:        	
        	CMP CL,65       ;check for upper case lower bound
        	JGE 2ND_STEP_UCASE 
            
lower_case_checking:
            CMP CL,97       ;check for lower case lower bound
            JGE 2ND_STEP_lCASE
            
digit_checking:
            cmp cl,48       ;check for digit case lower bound
            jge 2ND_STEP_DIGIT
            jmp special            
2ND_STEP_UCASE:
            CMP CL,90       ;;check for upper case upper bound
            JLE upper_case 
            JMP lower_case_checking
2ND_STEP_lCASE:
            CMP CL,122       ;check for lower case upper bound
            JLE lower_case
            JMP digit_checking
2ND_STEP_DIGIT:              
            cmp cl,57        ;;check for digit upper bound
            jle digit
            jmp special
        	
upper_case: LEA DX,ucaseMSG
            MOV AH,9
            INT 21H
            JMP EXIT
            
lower_case: LEA DX,lcaseMSG
            MOV AH,9
            INT 21H
            JMP EXIT
            
digit:      LEA DX,digitMSG
            MOV AH,9
            INT 21H
            JMP EXIT
            
special:	LEA DX,spclMSG
            MOV AH,9
            INT 21H
            JMP EXIT
	
exit:
	MOV AH,4CH
	INT 21H
MAIN ENDP
	END MAIN