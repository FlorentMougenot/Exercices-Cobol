       IDENTIFICATION DIVISION.
       PROGRAM-ID. assutest.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *LIEN AVEC LE TABLEAU DE DONNES EN LIGNE PAR LIGNE
           SELECT ASSURANCES-FILE ASSIGN TO 'assurances.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
      *LIEN AVEC LE FICHIER DE SORTIE EN LIGNE PAR LIGNE
           SELECT RAPPORT-FILE ASSIGN TO 'rapport-assurances.dat'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
        
       FD ASSURANCES-FILE.
       01 ASSURANCE-RECORD.
           05 NUMERO-ASSURANCE        PIC X(8).
           05 FILLER                  PIC X(1) VALUE "*".
           05 NOM-ASSURANCE           PIC X(14).
           05 FILLER                  PIC X(1) VALUE "*".
           05 DESCRIPTION             PIC X(56).
           05 FILLER                  PIC X(1) VALUE "*".
           05 STATUT                  PIC X(8).
           05 FILLER                  PIC X(1) VALUE "*".
           05 DATE-DEBUT              PIC X(8).
           05 FILLER                  PIC X(1) VALUE "*".
           05 DATE-FIN                PIC X(8).
           05 FILLER                  PIC X(1) VALUE "*".
           05 MONTANT                 PIC X(9).
           05 FILLER                  PIC X(1) VALUE "*".
      * OUVRE DES EMPLACEMENTS DE CARACTERES (CARACTERES SPECIAUX)
           05 MONNAIE                 PIC X(5).

       FD RAPPORT-FILE.
       01 RAPPORT-RECORD-OUT.
           05 NUMERO-ASSURANCE-OUT      PIC X(8).
           05 FILLER                      PIC X(1) VALUE "*".
           05 NOM-ASSURANCE-OUT         PIC X(14).
           05 FILLER                      PIC X(1) VALUE "*".
           05 DESCRIPTION-OUT           PIC X(56).
           05 FILLER                      PIC X(1) VALUE "*".
           05 STATUT-OUT                PIC X(8).
           05 FILLER                      PIC X(1) VALUE "*".
           05 DATE-DEBUT-OUT            PIC X(8).
           05 FILLER                      PIC X(1) VALUE "*".
           05 DATE-FIN-OUT              PIC X(8).
           05 FILLER                      PIC X(1) VALUE "*".
           05 MONTANT-OUT               PIC X(9).
           05 FILLER                      PIC X(1) VALUE "*".
           05 MONNAIE-OUT               PIC X(5).

       WORKING-STORAGE SECTION.
      * Variable de compteur 
       01 WS-COUNTER               PIC 99 VALUE 1.

       PROCEDURE DIVISION.
           OPEN INPUT ASSURANCES-FILE.
           OPEN OUTPUT RAPPORT-FILE.
               DISPLAY "Enregistrements 3 et 7 :"
           PERFORM UNTIL WS-COUNTER = 8
               READ ASSURANCES-FILE
           AT END DISPLAY "Fin du fichier" END-READ
               IF WS-COUNTER = 3 OR WS-COUNTER = 7
                   DISPLAY NUMERO-ASSURANCE " "
                           NOM-ASSURANCE " " 
                           DESCRIPTION " " 
                           STATUT " " 
                           DATE-DEBUT " " 
                           DATE-FIN " " 
                           MONTANT " " 
                           MONNAIE
                   DISPLAY ASSURANCE-RECORD
                   WRITE RAPPORT-RECORD-OUT FROM ASSURANCE-RECORD
               END-IF
           ADD 1 TO WS-COUNTER
           END-PERFORM

           CLOSE ASSURANCES-FILE
           CLOSE RAPPORT-FILE

           STOP RUN.
