.model small
.stack 100h
.data
arr db 1,3,5,7,9
mid db ?
num  db 6
numfound  db  "Found" ,'$'
numNotfound    db  "Not Found" ,'$'

.code
main proc
mov ax,@data
mov ds,ax

LEA SI,arr ;SI points to array
mov ax,SI  ;ax point first index
add ax,4   
mov DI,ax  ;DI points last index 
mov dl,2

L1:
mov ax,SI  ;ax=first
add ax,DI  ;ax=first+last
div dl     ;ax=ax/2
mov BX,00
mov Bl,al  ;bl=mid
mov bh,00
mov al,BYTE PTR [BX] ;al=arr[mid]
cmp al,num           ;if a[mid]<num then first=mid+1 goless else last=mid-1
je ans               ;found
jl Less  
sub BX,1             ;last=mid-1, num mid ar theke small
mov DI,BX            ;di=last
cmp SI,DI            ;if first<=last go l1
jle L1

jmp Nfound

Less:
add BX,1      ;first=mid+1,num mid ar theke big
mov SI,BX     ;si=first
cmp SI,DI     ;if first<=last go l1
jle L1
jmp Nfound
ans:
mov ah,09h
LEA DX,numfound
int 21h
jmp ext
Nfound:
mov ah,09h
LEA DX,numNotfound 
int 21h
jmp ext
ext:
mov ax,4Ch
int 21h                       
main endp
end main