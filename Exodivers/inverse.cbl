       IDENTIFICATION DIVISION.
       PROGRAM-ID. inverse.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUT-STRING               PIC A(100).
       01 REVERSED-STRING            PIC A(100).
       01 STRING-LENGTH              PIC 9(03) VALUE ZERO.
       01 I                          PIC 9(03) VALUE ZERO.

       PROCEDURE DIVISION.
           DISPLAY "Entrez un mot/une phrase à inverser:" SPACE
           ACCEPT INPUT-STRING

           COMPUTE STRING-LENGTH = 
           FUNCTION LENGTH(FUNCTION TRIM(INPUT-STRING))

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > STRING-LENGTH
               MOVE INPUT-STRING(STRING-LENGTH - I + 1:1) 
               TO REVERSED-STRING(I:1)
           END-PERFORM

           DISPLAY "A l'envers:"SPACE REVERSED-STRING(1:STRING-LENGTH)

           STOP RUN.
