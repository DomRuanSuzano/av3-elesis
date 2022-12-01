;-------------------------------------
; add32.nasm
; Leia o README.md para detalhes
;-------------------------------------

; valores iniciais


leaw $0, %A
movw (%A), %D
leaw $2, %A
movw (%A), %A
addw %D, %A, %D
leaw $4, %A
movw %D, (%A)

leaw $1, %A
movw (%A), %D
leaw $3, %A
movw (%A), %A
addw %D, %A, %D
leaw $5, %A
movw %D, (%A)

movw (%A), %D
leaw $32768, %A
andw %D, %A, %D

leaw $21184, %A
movw $0, (%A)

leaw $LEDOFF, %A
je %D
nop

leaw $21184, %A
movw $1, (%A)
LEDOFF:
    
leaw $0, %A
movw (%A), %D
leaw $32768, %A
andw %D, %A, %D
leaw $RDOIS, %A
jne %D
nop

leaw %FINAL, %A
jmp
nop

RDOIS:
leaw $2, %A
movw (%A), %D
leaw $32768, %A
andw %D, %A, %D
leaw $SOMA, %A
jne %D
nop


SOMA:
leaw $1, %A
movw %A, %D
leaw $4, %A
addw %D, (%A), %D
movw %D, (%A)

FINAL:
