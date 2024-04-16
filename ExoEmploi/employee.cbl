       IDENTIFICATION DIVISION.
       PROGRAM-ID. employee.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT F-EMPLOYE ASSIGN TO "fichierclient.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-EMPLOYE-STATUS.

           SELECT F-DEPT ASSIGN TO "fr-liste-dept.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-DEPT-STATUS.

           SELECT F-CLISOR ASSIGN TO "rapportclient.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-OUTPUT-STATUS.

       DATA DIVISION.
       FILE SECTION.
           COPY 'FCLIENT.cpy' REPLACING ==:CLIENT:== BY ==EMPLOYE==.
           COPY 'FDEPT.cpy'.
           COPY 'FCLISORTIE.cpy'.

       WORKING-STORAGE SECTION.
       01 FIC-SORTIE.
           05 OUT-ID            PIC X(10).
           05 FILLER            PIC X      VALUE "|".
           05 OUT-NOM           PIC X(20).
           05 FILLER            PIC X      VALUE "|".
           05 OUT-PRENOM        PIC X(20).
           05 FILLER            PIC X      VALUE "|".
           05 OUT-POSTE         PIC X(20).
           05 FILLER            PIC X      VALUE "|".
           05 OUT-SALAIRE       PIC 9(7) VALUE ZERO.
           05 FILLER            PIC X      VALUE "|".
           05 OUT-AGENCE        PIC X(03).
           05 FILLER            PIC X      VALUE "|".
           05 OUT-DEPART        PIC X(23).
           05 FILLER            PIC X      VALUE "|".
           05 OUT-REGION        PIC X(26).

       01  WS-EMPLOYE-STATUS   PIC XX.
       01  WS-DEPT-STATUS      PIC XX.
       01  WS-OUTPUT-STATUS    PIC XX.
       01  WS-TOTAL-SALARY     PIC 9(7) VALUE ZERO.
       01  WS-EOF              PIC X VALUE 'N'.
       01  DEPT-FOUND          PIC X VALUE 'N'.
       01  TOTAL-SALARY-LINE   PIC X(80).

      * table pour le tri alphabétique 
       01  EMPLOYEE-TABLE.
           05 EMPLOYEE-RECORD OCCURS 100 TIMES.
               10 EMPLOYEE-NAME     PIC X(20).
               10 EMPLOYEE-DATA   PIC X(52).

           05 EMPLOYEE-COUNT        PIC 99 VALUE ZERO.

           COPY 'FRENTETE.cpy'.

       PROCEDURE DIVISION.
           OPEN INPUT F-EMPLOYE, F-DEPT
           OPEN OUTPUT F-CLISOR.
           PERFORM PROCESS-RECORDS UNTIL WS-EOF = 'Y'.
           CLOSE F-EMPLOYE, F-DEPT, F-CLISOR.

      * tri alphabétique des noms
           SORT EMPLOYEE-TABLE ASCENDING KEY EMPLOYEE-NAME

           OPEN EXTEND F-CLISOR.

      * Tri
           PERFORM VARYING EMPLOYEE-COUNT FROM 1 BY 1 
           UNTIL EMPLOYEE-COUNT > 100
               MOVE EMPLOYEE-NAME(EMPLOYEE-COUNT) TO OUT-NOM
               MOVE EMPLOYEE-DATA(EMPLOYEE-COUNT) TO TOTAL-SALARY-LINE
               DISPLAY TOTAL-SALARY-LINE
           END-PERFORM

           STRING "Somme des salaires :" SPACE, WS-TOTAL-SALARY,
                  "€ " DELIMITED BY SIZE
                   INTO TOTAL-SALARY-LINE.
           DISPLAY TOTAL-SALARY-LINE.
           CLOSE F-CLISOR.
           DISPLAY "Rapport envoyé".

       OPEN-FILES.
           OPEN INPUT F-EMPLOYE, F-DEPT
           OPEN EXTEND F-CLISOR.
           READ F-CLISOR INTO FIC-SORTIE.

      * CLOSE-FILES.
      *     CLOSE F-EMPLOYE, F-DEPT, F-CLISOR.

       PROCESS-RECORDS.
           READ F-EMPLOYE AT END MOVE 'Y' TO WS-EOF
           NOT AT END
               PERFORM PROCESS-EMPLOYEE.
      *    CLOSE F-EMPLOYE.

       PROCESS-EMPLOYEE.
           MOVE REMPLOYE-ID TO OUT-ID
           MOVE REMPLOYE-NOM TO EMPLOYEE-RECORD(EMPLOYEE-COUNT)
           MOVE REMPLOYE-NOM TO OUT-NOM
           MOVE REMPLOYE-PRENOM TO OUT-PRENOM
           MOVE REMPLOYE-POSTE TO OUT-POSTE
           MOVE REMPLOYE-SALAIRE TO OUT-SALAIRE
           MOVE REMPLOYE-AGENCE TO OUT-AGENCE
           COMPUTE WS-TOTAL-SALARY = WS-TOTAL-SALARY + 
                                     FUNCTION NUMVAL(OUT-SALAIRE)
           PERFORM LOOKUP-DEPT
      * Enum
           ADD 1 TO EMPLOYEE-COUNT

           WRITE R-CLISOR FROM FIC-SORTIE.

       LOOKUP-DEPT.
           CLOSE F-DEPT
           OPEN INPUT F-DEPT 
           MOVE 'N' TO DEPT-FOUND
           PERFORM UNTIL DEPT-FOUND = 'Y'
               READ F-DEPT AT END
                   DISPLAY "Erreur de lecture"
               NOT AT END
                   IF REMPLOYE-AGENCE = RDEPT-ID
                       MOVE RDEPT-DEP TO OUT-DEPART
                       MOVE RDEPT-REGION TO OUT-REGION
                       MOVE 'Y' TO DEPT-FOUND
                   END-IF
           END-PERFORM
               IF DEPT-FOUND = 'N'
           DISPLAY "Département non trouvé" SPACE, REMPLOYE-AGENCE.

           END PROGRAM employee.
