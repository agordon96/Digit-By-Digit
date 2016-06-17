     ORG  $8000
START   MOVE.L #$8000,SP
        MOVE N,-(SP)
        MOVE #0,-(SP)
        BSR DISPLAY
END     TRAP #14

*********DISPLAY SUBROUTINE***********

DISPLAY LEA 6(SP),A1
        MOVE (A1)+,D0
        CLR.L D1
        MOVE D0,D1
        CMPI #0,D0
        BNE NOTZERO
        RTS
NOTZERO DIVS #10,D1
        SWAP D1
        MOVE D1,D0
        SWAP D1
        MOVE D1,-(SP)
        MOVE D0,-(SP)
        BSR DISPLAY
        MOVE (SP)+,D1
        MOVE (SP)+,D4
        MOVE.B #3,D0
        MOVE D1,REMAIN
        LEA REMAIN,A1
        TRAP #15
        RTS
        
     ORG  $9000
N       DC 256
REMAIN  DS 1
     END START








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
