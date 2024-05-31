       IDENTIFICATION DIVISION.
       PROGRAM-ID. synthese.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'datassur.dat'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO 'report.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE.
       01  INPUT-RECORD.
           05  INPUT-ID              PIC 9(8).
           05  FILLER                PIC X(1).
           05  INPUT-CATEGORY       PIC X(13).
           05  FILLER                PIC X(1).
           05  INPUT-TYPE            PIC X(15).
           05  FILLER                PIC X(1).
           05  INPUT-DESCRIPTION     PIC X(40).
           05  FILLER                PIC X(1).
           05  INPUT-STATUS          PIC X(8).
           05  FILLER                PIC X(1).
           05  INPUT-START-DATE      PIC X(8).
           05  FILLER                PIC X(1).
           05  INPUT-END-DATE        PIC X(8).
           05  FILLER                PIC X(1).
           05  INPUT-AMOUNT          PIC 9(10).
           05  FILLER                PIC X(1).
           05  INPUT-CURRENCY        PIC X(1).

       FD  OUTPUT-FILE.
       01  OUTPUT-RECORD             PIC X(132).

       WORKING-STORAGE SECTION.
       01  WS-DATE                    PIC X(10) VALUE SPACES.
       01  WS-UNIQUE-COUNT            PIC 9(5) VALUE 0.
       01  WS-CATEGORY-ACTIF-COUNT    PIC 9(5) VALUE 0.
       01  WS-CATEGORY-SUSPENDU-COUNT PIC 9(5) VALUE 0.
       01  WS-CATEGORY-RESILIE-COUNT  PIC 9(5) VALUE 0.
       01  WS-TOTAL-AMOUNT            PIC 9(10)V99 VALUE 0.
       01  EOF                        PIC X VALUE 'N'.

       01  WS-TITLE            PIC X(132) VALUE "Rapport de synthèse".
       01  WS-NAME             PIC X(132) VALUE "Nom: PetiteFleur".

       PROCEDURE DIVISION.
       0000-MAIN SECTION.
           PERFORM 1000-INITIALIZE.
           PERFORM 2000-READ-INPUT-FILE UNTIL EOF = 'Y'.
           PERFORM 3000-GENERATE-REPORT.
           PERFORM 4000-FINALIZE.
           STOP RUN.

       1000-INITIALIZE.
           OPEN INPUT INPUT-FILE.
           OPEN OUTPUT OUTPUT-FILE.
           ACCEPT WS-DATE FROM DATE.
           DISPLAY "Rapport en cours de transmission".

       2000-READ-INPUT-FILE.
           READ INPUT-FILE INTO INPUT-RECORD
               AT END MOVE 'Y' TO EOF
           NOT AT END
               PERFORM 2100-PROCESS-RECORD.

       2100-PROCESS-RECORD.
           IF INPUT-STATUS = "Actif"
               ADD 1 TO WS-CATEGORY-ACTIF-COUNT
           ELSE IF INPUT-STATUS = "Suspendu"
               ADD 1 TO WS-CATEGORY-SUSPENDU-COUNT
           ELSE IF INPUT-STATUS = "Resilie"
               ADD 1 TO WS-CATEGORY-RESILIE-COUNT
           END-IF
           ADD FUNCTION NUMVAL(input-amount) TO WS-TOTAL-AMOUNT.

       3000-GENERATE-REPORT.
           MOVE WS-TITLE TO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.
           MOVE WS-NAME TO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.
           MOVE "Date: " TO OUTPUT-RECORD
           STRING WS-DATE DELIMITED BY SIZE INTO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.
           MOVE SPACES TO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.

           MOVE "Rapport:" TO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.
           MOVE "Nombre de comptes actifs: " TO OUTPUT-RECORD
           STRING WS-CATEGORY-ACTIF-COUNT 
           DELIMITED BY SIZE INTO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.
           MOVE SPACES TO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.

           MOVE "Nombre de comptes suspendus: " TO OUTPUT-RECORD
           STRING WS-CATEGORY-SUSPENDU-COUNT 
           DELIMITED BY SIZE INTO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.
           MOVE SPACES TO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.

           MOVE "Nombre de comptes résiliés: " TO OUTPUT-RECORD
           STRING WS-CATEGORY-RESILIE-COUNT 
           DELIMITED BY SIZE INTO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.
           MOVE SPACES TO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.

           MOVE "Montant total: " TO OUTPUT-RECORD
           STRING WS-TOTAL-AMOUNT DELIMITED BY SIZE INTO OUTPUT-RECORD
           WRITE OUTPUT-RECORD.

       4000-FINALIZE.
           CLOSE INPUT-FILE.
           CLOSE OUTPUT-FILE.
           DISPLAY "Rapport généré avec succès".
           STOP RUN.
