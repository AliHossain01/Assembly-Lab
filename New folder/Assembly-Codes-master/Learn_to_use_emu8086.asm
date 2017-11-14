include 'emu8086.inc'
org 100h
.model small
.stack 100h
.data

.code
main proc

       DEFINE_SCAN_NUM
       
       DEFINE_PRINT_NUM_UNS
       
       CALL SCAN_NUM
       CALL PRINT_NUM_UNS

mov ah,4ch
int 21h 


end main



