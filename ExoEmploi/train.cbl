       IDENTIFICATION DIVISION.
       PROGRAM-ID. train.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRAIN-FILE ASSIGN TO 'train.dat'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO 'train2.dat'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD TRAIN-FILE
           RECORD IS VARYING IN SIZE FROM 27 TO 37 CHARACTERS
               DEPENDING ON TRAIN-RECORD-LENGTH.
       COPY 'rapport-train.cpy'.
       
       FD OUTPUT-FILE
           RECORD CONTAINS 80 CHARACTERS.
       01 OUTPUT-RECORD PIC X(139).

       WORKING-STORAGE SECTION.
       01  TRAIN-RECORD-LENGTH         PIC 9(2) COMP.
       01  WS-NUMBER-OF-STOPS-LENGTH   PIC 9(2).
       01  WS-END-OF-FILE              PIC X VALUE 'N'.
           88 EOF               VALUE 'Y'.
           88 NOT-EOF           VALUE 'N'.
       01  WS-HALT-COUNTER             PIC 9(2) VALUE ZERO.
       01  WS-HALT-INDEX               PIC 9(2).
       01  WS-RECORD-TYPE              PIC X(20).
       01  WS-ARRIVAL-HOUR            PIC 99.
       01  WS-ARRIVAL-MINUTES         PIC 99.

       PROCEDURE DIVISION.
           OPEN INPUT TRAIN-FILE
           OPEN OUTPUT OUTPUT-FILE
           PERFORM UNTIL EOF
               READ TRAIN-FILE INTO TRAIN-PLANNING
               AT END
                  MOVE 'Y' TO WS-END-OF-FILE
               NOT AT END
                  MOVE 0 TO WS-HALT-COUNTER
                  PERFORM VARYING WS-HALT-INDEX FROM 1 BY 1 UNTIL 
                       WS-HALT-INDEX > 10
                  IF TRAIN-HALT-FLAG (WS-HALT-INDEX) = 'H'
                       ADD 1 TO WS-HALT-COUNTER
                  END-IF
                  END-PERFORM

                  COMPUTE WS-ARRIVAL-HOUR = TRAIN-TIME-HH + 
                      TRAIN-NBRE-HEURES
                  IF WS-ARRIVAL-HOUR > 47
                      SUBTRACT 48 FROM WS-ARRIVAL-HOUR
                  END-IF       
                  IF WS-ARRIVAL-HOUR > 23
                      SUBTRACT 24 FROM WS-ARRIVAL-HOUR
                  END-IF
                  MOVE TRAIN-TIME-MM TO WS-ARRIVAL-MINUTES

                  EVALUATE TRUE
                      WHEN TGV
                      MOVE "Train grande vitesse" TO WS-RECORD-TYPE
                      WHEN CORAIL
                      MOVE "Voiture Corail" TO WS-RECORD-TYPE
                      WHEN TER
                      MOVE "Train regional" TO WS-RECORD-TYPE
                      END-EVALUATE

                      STRING "Type de train:" SPACE RECORD-TYPE 
                           SPACE WS-RECORD-TYPE
                           DELIMITED BY SIZE
                           SPACE SPACE SPACE
                           "Gare de depart:" SPACE STATION-DEPART 
                           DELIMITED BY SIZE
                           SPACE
                           "Depart:" SPACE TRAIN-TIME-HH 
                           DELIMITED BY SIZE
                           ":" TRAIN-TIME-MM  "h"
                           DELIMITED BY SIZE
                           SPACE SPACE SPACE
                           "Durée:" SPACE TRAIN-NBRE-HEURES
                           DELIMITED BY SIZE "min"
                           SPACE SPACE SPACE
                           "Arrets:" SPACE WS-HALT-COUNTER
                           DELIMITED BY SIZE
                           SPACE SPACE SPACE
                           "Arrivée:" SPACE WS-ARRIVAL-HOUR ":" 
                           WS-ARRIVAL-MINUTES "h"
                           DELIMITED BY SIZE
                           INTO OUTPUT-RECORD
                       WRITE OUTPUT-RECORD
                END-READ
           END-PERFORM
           CLOSE TRAIN-FILE
           CLOSE OUTPUT-FILE.
           STOP RUN.
