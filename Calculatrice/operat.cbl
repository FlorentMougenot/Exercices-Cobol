       IDENTIFICATION DIVISION.
       PROGRAM-ID. operat.

       DATA DIVISION.
      *Initialisation des variables
       WORKING-STORAGE SECTION.
       01 NUM1        PIC 9(5).
       01 NUM2        PIC 9(5).
       01 RESULT      PIC 9(10)V99.
       01 OPERATOR    PIC X.

       PROCEDURE DIVISION.
           DISPLAY "Entrez un premier entier :" SPACE WITH NO ADVANCING
           ACCEPT NUM1
           DISPLAY "Opérateur (+, -, *, /) :" SPACE WITH NO ADVANCING
           ACCEPT OPERATOR
           DISPLAY "Entrez un second entier : " SPACE WITH NO ADVANCING
           ACCEPT NUM2

           PERFORM CALCULATION
    
           DISPLAY "Result: " RESULT

           STOP RUN.

       CALCULATION SECTION.
           IF OPERATOR = '+'
               IF NUM1 = 1 AND NUM2 = 1
                    MOVE 11 TO RESULT
           ELSE
               ADD NUM1 TO NUM2 GIVING RESULT
           ELSE IF OPERATOR = '-'
               SUBTRACT NUM2 FROM NUM1 GIVING RESULT
           ELSE IF OPERATOR = '*'
               MULTIPLY NUM1 BY NUM2 GIVING RESULT
           ELSE IF OPERATOR = '/'
               DIVIDE NUM1 BY NUM2 GIVING RESULT
           ELSE
           DISPLAY "Ce caractère ne fait pas partie de ceux proposés"
           END-IF.
