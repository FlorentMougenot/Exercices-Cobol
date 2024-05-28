       IDENTIFICATION DIVISION.
       PROGRAM-ID. isogram.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUT-WORD             PIC X(50).
       01 I                      PIC 9(3) VALUE 1.
       01 J                      PIC 9(3) VALUE 1.
       01 IS-ISOGRAM             PIC X VALUE 'Y'.
       01 CHAR-COUNT             PIC 9(3) VALUE 0.
       01 CHAR-ARRAY.
         05 CHARAC           PIC X(1) OCCURS 50 TIMES.
       PROCEDURE DIVISION.
       
           DISPLAY "Déterminez si une expression est un isogramme.".
           DISPLAY " ".
           DISPLAY "Saisir le mot à traiter : ".
           ACCEPT INPUT-WORD.
               MOVE INPUT-WORD TO CHAR-ARRAY.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF INPUT-WORD 
           OR CHAR-COUNT = LENGTH OF INPUT-WORD
           IF CHAR-ARRAY(I:I) IS NOT EQUAL TO SPACE 
             AND CHAR-ARRAY(I:I) IS NOT EQUAL TO '-'
             SET J TO I 
             ADD 1 TO J
            PERFORM VARYING J FROM 1 BY 1 UNTIL J > LENGTH OF INPUT-WORD
                IF CHAR-ARRAY(I:I) = CHAR-ARRAY(J:J)
                    MOVE 'N' TO IS-ISOGRAM
                    EXIT PERFORM
                END-IF
             END-PERFORM
             ADD 1 TO CHAR-COUNT
           END-IF
           END-PERFORM.

           IF IS-ISOGRAM EQUAL TO 'Y'
           DISPLAY "Le mot " INPUT-WORD " est un isogramme."
           ELSE
           DISPLAY "Le mot " INPUT-WORD " n’est pas un isogramme."
           END-IF.
           STOP RUN.
