.model small
.stack 100h
.data

arr dw 7,99,1418,0,521,66,255 ;ARRAY OF 7 INTEGERS.
i   dw ?
j   dw ?

;-----------------------------------------

.code
start:

;INITIALIZE DATA SEGMENT.
  mov  ax, @data
  mov  ds, ax                 

  call bubble_sort_descending

;WAIT FOR ANY KEY.    
  mov  ah, 7
  int  21h

;FINISH PROGRAM.
  mov  ax, 4c00h
  int  21h

;-----------------------------------------
;for ( i = 0; i < len-1; i++ )
;  for ( j = i+1; j < len; j++ )
;    if ( arr[i] < arr[j] ) // '<' BECAUSE IT'S ASCENDING.
;      exchange

bubble_sort_descending proc
  mov  i, 0             ;I = 0.
fori:
  mov  ax, i            ;AX = I.
  inc  ax               ;I++.
  mov  j, ax            ;J = I++.
forj:
;GET ARR[ I ].
  mov  si, offset arr
  mov  ax, i
  shl  ax, 1            ;I * 2, BECAUSE EVERY COUNTER IS 2 BYTES.
  add  si, ax
  mov  ax, [ si ]       ;AX = ARR[ I ].
;GET ARR[ J ].
  mov  di, offset arr
  mov  cx, j
  shl  cx, 1            ;J * 2, BECAUSE EVERY COUNTER IS 2 BYTES.
  add  di, cx
  mov  cx, [ di ]       ;CX = ARR[ J ].
;IF ( ARR[ I ] < ARR[ J ] ).
  cmp  ax, cx           ;CMP ARR[ I ], ARR[ J ].
  jae  bigger           ;IF ( ARR[I] >= ARR[J] ) NO EXCHANGE.
;EXCHANGE BECAUSE ARR[ I ] IS NOT BIGGER THAN ARR[ J ].
  ;EXCHANGE COUNTERS IN ARR.
    mov  [ si ], cx     ;ARR[ I ] = ARR[ J ].
    mov  [ di ], ax     ;ARR[ J ] = ARR[ I ].
bigger:
;NEXT J.
  inc  j                ;J++.
  cmp  j, 7
  jbe  forj             ;IF ( J <= 7 ) REPEAT.  
;NEXT I.
  inc  i                ;I++.
  cmp  i, 7
  jb   fori             ;IF ( I <  7 ) REPEAT.  

  ret
bubble_sort_descending endp    

;-----------------------------------------

end start