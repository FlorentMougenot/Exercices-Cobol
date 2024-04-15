       IDENTIFICATION DIVISION.
       PROGRAM-ID. assudeux.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT FICHIER-ASSUR-PART1 ASSIGN TO 'assurances-part1.dat'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

           SELECT FICHIER-ASSUR-PART2 ASSIGN TO 'assurances-part2.dat'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

           SELECT FICHIER-RAPPORT ASSIGN TO 'rapport-assurances.dat'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.


       DATA DIVISION.
       FILE SECTION.
       FD  FICHIER-ASSUR-PART1.
       01  ASSUR-REC.
           05  ASSUR-ID            PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-NOM           PIC X(14).
           05  FILLER              PIC X(1).
           05  ASSUR-DESC          PIC X(14).
           5  FILLER              PIC X(1).
           05  ASSUR-TYPE          PIC X(41).
           05  FILLER              PIC X(1).
           05  ASSUR-STATUT        PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-DATE-DEB      PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-DATE-FIN      PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-MONTANT       PIC X(9).
           05  FILLER              PIC X(1).
           05  ASSUR-DEVISE        PIC X(3).

       FD  FICHIER-ASSUR-PART2.
       01  ASSUR-REC-2.
           05  ASSUR-ID2           PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-NOM2          PIC X(14).
           05  FILLER              PIC X(1).
           05  ASSUR-DESC2         PIC X(14).
           05  FILLER              PIC X(1).
           05  ASSUR-TYPE2         PIC X(41).
           05  FILLER              PIC X(1).
           05  ASSUR-STATUT2       PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-DATE-DEB2     PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-DATE-FIN2     PIC X(8).
           05  FILLER              PIC X(1).
           05  ASSUR-MONTANT2      PIC X(9).
           05  FILLER              PIC X(1).
           05  ASSUR-DEVISE2       PIC X(3).

       FD  FICHIER-RAPPORT.
       01  RAPPORT-REC.
           05  WS-RAPPORT-LENGTH  PIC 9(3).
           05  WS-RAPPORT-DATA    PIC X(147).

       WORKING-STORAGE SECTION.
       
       01  WS-FILE-STATUS        PIC XX.
       01  WS-CURRENT-TIME       PIC X(20).
       01  WS-REC-COUNT          PIC 9(4) VALUE ZERO.
       01  WS-TOTAL-ACTIF        PIC 9(4) VALUE ZERO.
       01  WS-TOTAL-INACTIF      PIC 9(4) VALUE ZERO.
       01  WS-TOTAL-RECORDS      PIC 9(6) VALUE ZERO.
       01  WS-FOOTER-INFO        PIC X(147).
       01  WS-BLANK-LINE         PIC X(147) VALUE SPACES.

       PROCEDURE DIVISION.

           OPEN INPUT FICHIER-ASSUR-PART1 FICHIER-ASSUR-PART2
                OUTPUT FICHIER-RAPPORT.
                
           MOVE "Rapport" TO WS-RAPPORT-DATA
           MOVE LENGTH OF WS-RAPPORT-DATA TO WS-RAPPORT-LENGTH
           WRITE RAPPORT-REC FROM WS-RAPPORT-DATA
           WRITE RAPPORT-REC FROM WS-BLANK-LINE
           WRITE RAPPORT-REC FROM WS-BLANK-LINE.

           MOVE "Statut" TO WS-RAPPORT-DATA
           MOVE LENGTH OF WS-RAPPORT-DATA TO WS-RAPPORT-LENGTH
           WRITE RAPPORT-REC FROM WS-RAPPORT-DATA
           WRITE RAPPORT-REC FROM WS-BLANK-LINE
           WRITE RAPPORT-REC FROM WS-BLANK-LINE.

           MOVE ZERO TO WS-FILE-STATUS

           PERFORM PROCESS-FILE-1
           CLOSE FICHIER-ASSUR-PART1

           MOVE ZERO TO WS-FILE-STATUS

           PERFORM PROCESS-FILE-2
           CLOSE FICHIER-ASSUR-PART2

           STRING "Enregistrements: " WS-TOTAL-RECORDS 
                 DELIMITED BY SIZE
                " Total Actif: " WS-TOTAL-ACTIF 
                 DELIMITED BY SIZE
                " Total Inactif: " WS-TOTAL-INACTIF 
                 DELIMITED BY SIZE
                 INTO WS-FOOTER-INFO
           MOVE WS-FOOTER-INFO TO WS-RAPPORT-DATA
           MOVE LENGTH OF WS-RAPPORT-DATA TO WS-RAPPORT-LENGTH
           WRITE RAPPORT-REC FROM WS-RAPPORT-DATA.

           CLOSE FICHIER-RAPPORT.

           DISPLAY "Données enregistrées dans le rapport."

           STOP RUN.

       PROCESS-FILE-1.

           PERFORM UNTIL WS-FILE-STATUS = '10'
               
               READ FICHIER-ASSUR-PART1 INTO ASSUR-REC AT END

                   MOVE '10' TO WS-FILE-STATUS
                   
               NOT AT END
                   EVALUATE ASSUR-STATUT
                       WHEN 'Actif'
                           ADD 1 TO WS-TOTAL-ACTIF
                       WHEN OTHER
                           ADD 1 TO WS-TOTAL-INACTIF
                   END-EVALUATE
                   ADD 1 TO WS-TOTAL-RECORDS
                   MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-TIME

                   STRING "ID:" SPACE ASSUR-ID SPACE
                          "Assurance:" SPACE ASSUR-NOM SPACE
                          "Statut:"SPACE ASSUR-STATUT DELIMITED BY SIZE
                          INTO WS-RAPPORT-DATA
                   MOVE LENGTH OF WS-RAPPORT-DATA TO WS-RAPPORT-LENGTH
                   
                   WRITE RAPPORT-REC FROM WS-RAPPORT-DATA
                   WRITE RAPPORT-REC FROM WS-BLANK-LINE
               END-READ

           END-PERFORM.

       PROCESS-FILE-2.

           PERFORM UNTIL WS-FILE-STATUS = '10'
               
               READ FICHIER-ASSUR-PART2 INTO ASSUR-REC-2 AT END
                   MOVE '10' TO WS-FILE-STATUS                   
               NOT AT END
                   EVALUATE ASSUR-STATUT2
                       WHEN 'Actif'
                           ADD 1 TO WS-TOTAL-ACTIF
                       WHEN OTHER
                           ADD 1 TO WS-TOTAL-INACTIF
                   END-EVALUATE
                   ADD 1 TO WS-TOTAL-RECORDS
                   MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-TIME
                   STRING "ID:"SPACE ASSUR-ID2 SPACE
                          "Assurance:"SPACE ASSUR-NOM2 SPACE
                          "Statut:"SPACE ASSUR-STATUT2 DELIMITED BY SIZE
                          INTO WS-RAPPORT-DATA
                   MOVE LENGTH OF WS-RAPPORT-DATA TO WS-RAPPORT-LENGTH
                   WRITE RAPPORT-REC FROM WS-RAPPORT-DATA
                   WRITE RAPPORT-REC FROM WS-BLANK-LINE
               END-READ
           END-PERFORM.
