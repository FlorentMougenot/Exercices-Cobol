       IDENTIFICATION DIVISION.
       PROGRAM-ID. datetime.
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      
       01 WS-DATE-US-VERS            PIC X(10).
      
       01 WS-DATE-US.
           05 WS-MONTH-US              PIC 9(02).
           05 WS-DAY-US                PIC 9(02).
           05 WS-YEAR-US               PIC 9(04).
       01 WS-DATE-FR.
           05 WS-DAY-FR                PIC 9(02).
           05 WS-MONTH-FR              PIC 9(02).
           05 WS-YEAR-FR               PIC 9(04).
      
       01 SYS-DATE8.
           03 A4.
              05 SS  PIC 9(2).
              05 AA  PIC 9(2).
           03 MM     PIC 9(2).
           03 JJ     PIC 9(2).
      
       01 WS-COMPILE-DATE              PIC X(10)   VALUE '10-04-2024'.
       01 WS-COMPILE-TIME              PIC X(08)   VALUE '09:00:00'.
      
       PROCEDURE DIVISION.
      
           DISPLAY "Entrez une date au format"
           DISPLAY "MM-JJ-AAAA:" SPACE WITH NO ADVANCING.
               ACCEPT WS-DATE-US-VERS.
      
           UNSTRING WS-DATE-US-VERS DELIMITED BY "-"
               INTO WS-MONTH-US, WS-DAY-US, WS-YEAR-US
           MOVE WS-DAY-US TO WS-DAY-FR
           MOVE WS-MONTH-US TO WS-MONTH-FR
           MOVE WS-YEAR-US TO WS-YEAR-FR
               DISPLAY "Date convertie au format français :" SPACE
                   WS-DAY-FR "/" WS-MONTH-FR "/" WS-YEAR-FR.
      
           ACCEPT SYS-DATE8 FROM DATE YYYYMMDD.
               DISPLAY "Date actuelle (format français): "
                   JJ "/" MM "/" AA.
      
           DISPLAY "Compilation :" SPACE
               WHEN-COMPILED
      
           STOP RUN.
