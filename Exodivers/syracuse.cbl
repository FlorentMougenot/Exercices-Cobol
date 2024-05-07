       IDENTIFICATION DIVISION.
       PROGRAM-ID. syracuse.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 START-NUMBER             PIC 9(09) VALUE ZERO.
       01 CURRENT-NUMBER           PIC 9(09) VALUE ZERO.
       01 NEXT-NUMBER              PIC 9(09) VALUE ZERO.
       01 STEP-COUNTER             PIC 9(09) VALUE ZERO.

       PROCEDURE DIVISION.
       BEGIN.
           DISPLAY "Entrez un nombre entier positif:" SPACE
           ACCEPT START-NUMBER
           MOVE START-NUMBER TO CURRENT-NUMBER
           DISPLAY "Début de la chaîne avec:" SPACE CURRENT-NUMBER

           PERFORM UNTIL CURRENT-NUMBER = 1
               ADD 1 TO STEP-COUNTER
               IF FUNCTION MOD(CURRENT-NUMBER, 2) = 0
                   COMPUTE NEXT-NUMBER = CURRENT-NUMBER / 2
                   DISPLAY CURRENT-NUMBER " / 2 =     " NEXT-NUMBER
                   MOVE NEXT-NUMBER TO CURRENT-NUMBER
               ELSE
                   COMPUTE NEXT-NUMBER = CURRENT-NUMBER * 3 + 1
                   DISPLAY CURRENT-NUMBER " * 3 + 1 = " NEXT-NUMBER
                   MOVE NEXT-NUMBER TO CURRENT-NUMBER
               END-IF
           END-PERFORM

           DISPLAY "Nous avons atteint le chiffre 1 en" SPACE
           STEP-COUNTER " étapes"
           STOP RUN.
