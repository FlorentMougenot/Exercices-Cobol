       IDENTIFICATION DIVISION.
       PROGRAM-ID. assusaf.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
          SELECT ASSURANCES ASSIGN TO 'assurances.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
 
       DATA DIVISION.
       FILE SECTION.
       FD ASSURANCES.


       01 WS-ASSURANCES .
               05 WS-ID1     PIC X(8).
               05 WS-NOM     PIC X(14).
               05 FILLER     PIC X(4) VALUE SPACES.
               05 FILLER     PIC X(1) VALUE ''.
               05 WS-IRP     PIC X(3).
               05 FILLER     PIC X(1) VALUE SPACES.
               05 WS-AUTO    PIC X(4).
               05 FILLER     PIC X(1) VALUE SPACES.
               05 WS-SANTE   PIC X(5).
               05 FILLER     PIC X(1) VALUE ''.
               05 WS-NOM-ASS PIC X(25).
               05 FILLER     PIC X(21) VALUE SPACES.
               05 FILLER     PIC X(1) VALUE ''.
               05 ACTIF      PIC X(8).
               05 FILLER     PIC X(1) VALUE ''.
               05 WS-ID1     PIC X(8).
               05 FILLER     PIC X(1) VALUE ''.
               05 WS-ID1     PIC X(8).
               05 FILLER     PIC X(1) VALUE ''.
               05 WS-PRIX    PIC X(8).
               05 FILLER     PIC X(1) VALUE '*'.
               05 FILLER     PIC X(1) VALUE SPACES.

        PROCEDURE DIVISION.

           OPEN INPUT ASSURANCES.
             READ ASSURANCES.
              DISPLAY WS-ASSURANCES.

           CLOSE ASSURANCES.

           STOP RUN.