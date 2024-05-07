       IDENTIFICATION DIVISION.
       PROGRAM-ID. salary.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENT-FILE ASSIGN TO "FICHIERCLIENT.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  CLIENT-FILE.
       01  CLIENT-RECORD                     PIC X(80).

       WORKING-STORAGE SECTION.
       01  SALARY-AMOUNT                     PIC 9(08).
       01  MAX-SALARY                        PIC 9(08) VALUE ZERO.
       01  MIN-SALARY                        PIC 9(08) VALUE 99999999.
       01  FILE-STATUS                       PIC XX VALUE ZERO.

       PROCEDURE DIVISION.
           OPEN INPUT CLIENT-FILE
           PERFORM UNTIL FILE-STATUS = "10"
               READ CLIENT-FILE INTO CLIENT-RECORD
                   AT END
                       MOVE "10" TO FILE-STATUS
                   NOT AT END
                       PERFORM PROCESS-RECORD
               END-READ
           END-PERFORM
           CLOSE CLIENT-FILE

           DISPLAY "Salaire maximum trouvé:" SPACE, MAX-SALARY
           DISPLAY "Salaire minimum trouvé:" SPACE, MIN-SALARY
           STOP RUN.

       PROCESS-RECORD SECTION.
           MOVE CLIENT-RECORD(72:6) TO SALARY-AMOUNT
           DISPLAY SALARY-AMOUNT
           IF SALARY-AMOUNT > MAX-SALARY
               MOVE SALARY-AMOUNT TO MAX-SALARY
           END-IF
           IF SALARY-AMOUNT < MIN-SALARY
               MOVE SALARY-AMOUNT TO MIN-SALARY
           END-IF.
