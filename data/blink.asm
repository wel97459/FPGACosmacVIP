R0:	    equ	0
R1:	    equ	1
R2:	    equ	2
R3:	    equ	3
R4:	    equ	4
R5:	    equ	5
R6:	    equ	6
R7:	    equ	7
R8: 	equ	8
R9:	    equ	9
R10:	equ	10
R11:	equ	11
R12:	equ	12
R13:	equ	13
R14:	equ	14
R15:	equ	15

_main:
Loop:
    bq Q_Off
	seq
	br Delay
Q_Off:
    req
    br Delay

Delay:
    glo r0
    plo r8
    phi r8
    ldi 20
    plo R8
DelayLoop:
    dec R8
    glo R8
    bnz d1
    ghi R8
    bnz DelayLoop

	br Loop


