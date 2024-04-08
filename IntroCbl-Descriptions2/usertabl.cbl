       IDENTIFICATION DIVISION.
       PROGRAM-ID. usertabl.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 USERXX.
        05 USER-ID         PIC X(2)9(3).
        05 USER-CITY       PIC X(8).
        05 USER-STREET     PIC 9(3)X(16).
        05 USER-GSM-NBR    PIC 9(14).
        05 USER-LAST-NAME  PIC X(9).
        05 USER-FIRST-NAME PIC X(7).
