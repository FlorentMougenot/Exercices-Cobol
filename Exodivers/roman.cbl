       IDENTIFICATION DIVISION.
       PROGRAM-ID. roman.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMBR                    PIC 9(4).
       01 ROMAN                     PIC X(30) VALUE SPACES.
       01 REMAINING                 PIC 9(4).
       01 I                         PIC 9(4).

       01 ROMAN-VALUES.
          05 R-VALUES OCCURS 13 TIMES INDEXED BY IDX.
             10 R-NUMBER           PIC 9(4).
             10 R-SYMBOL           PIC X(5).

       PROCEDURE DIVISION.
       BEGIN.
           DISPLAY "Enter a number: "
           ACCEPT NUMBR
           MOVE NUMBR TO REMAINING

           INITIALIZE ROMAN-VALUES
           SET IDX TO 1
           MOVE 1000 TO R-NUMBER (IDX)
           MOVE "M"    TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 900 TO R-NUMBER (IDX)
           MOVE "CM"   TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 500 TO R-NUMBER (IDX)
           MOVE "D"    TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 400 TO R-NUMBER (IDX)
           MOVE "CD"   TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 100 TO R-NUMBER (IDX)
           MOVE "C"    TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 90 TO R-NUMBER (IDX)
           MOVE "XC"   TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 50 TO R-NUMBER (IDX)
           MOVE "L"    TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 40 TO R-NUMBER (IDX)
           MOVE "XL"   TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 10 TO R-NUMBER (IDX)
           MOVE "X"    TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 9 TO R-NUMBER (IDX)
           MOVE "IX"   TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 5 TO R-NUMBER (IDX)
           MOVE "V"    TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 4 TO R-NUMBER (IDX)
           MOVE "IV"   TO R-SYMBOL (IDX)
           SET IDX UP BY 1
           MOVE 1 TO R-NUMBER (IDX)
           MOVE "I"    TO R-SYMBOL (IDX)

           PERFORM WITH TEST AFTER UNTIL REMAINING = 0
               SET IDX TO 1
               PERFORM VARYING I FROM 1 BY 1 UNTIL I > 13
                   IF REMAINING >= R-NUMBER (I)
                       COMPUTE REMAINING = REMAINING - R-NUMBER (I)
                       STRING ROMAN DELIMITED BY SIZE
                              R-SYMBOL (I) DELIMITED BY SIZE
                              INTO ROMAN
                   END-IF
                   SET IDX UP BY 1
               END-PERFORM
           END-PERFORM

           DISPLAY "Roman numeral: " ROMAN
           STOP RUN.
