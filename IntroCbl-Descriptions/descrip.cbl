       IDENTIFICATION DIVISION.
       PROGRAM-ID. descrip.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 LINE01.
        05 EMPLOYEE-ID PIC 9(8) VALUE 59050287.
        05 FIRST-NAME PIC X(16) VALUE "Solange".
        05 LAST-NAME PIC X(16) VALUE "Oliveur".
        05 JOB PIC X(24) VALUE "Mecanicien".
        05 ZIPCODE PIC 9(5) VALUE 59008.
        05 EMAIL PIC X(35) VALUE "Solange.Oliveur@pro.com".
        05 SALARY PIC 9(8) VALUE 00120000.

       01 LINE02.
        05 EMPLOYEE-ID PIC 9(8) VALUE 69050243.
        05 FIRST-NAME PIC X(16) VALUE "Matt".
        05 LAST-NAME PIC X(16) VALUE "Ador".
        05 JOB PIC X(24) VALUE "Gerant".
        05 ZIPCODE PIC 9(5) VALUE 59008.
        05 EMAIL PIC X(35) VALUE "Matt.Ador@pro.com".
        05 SALARY PIC 9(8) VALUE 00505000.

       01 LINE03.
        05 EMPLOYEE-ID PIC 9(8) VALUE 10442572.
        05 FIRST-NAME PIC X(16) VALUE "Sophie".
        05 LAST-NAME PIC X(16) VALUE "Stiqué".
        05 JOB PIC X(24) VALUE "Mascotte".
        05 ZIPCODE PIC 9(5) VALUE 59009.
        05 EMAIL PIC X(35) VALUE "Sophie.Stiqué@pro.com".
        05 SALARY PIC 9(8) VALUE 00080000.

       01 LINE04.
        05 EMPLOYEE-ID PIC 9(8) VALUE 38042524.
        05 FIRST-NAME PIC X(16) VALUE "Emma".
        05 LAST-NAME PIC X(16) VALUE "Tome".
        05 JOB PIC X(24) VALUE "Animateur".
        05 ZIPCODE PIC 9(5) VALUE 59009.
        05 EMAIL PIC X(35) VALUE "Emma.Tome@pro.com".
        05 SALARY PIC 9(8) VALUE 00080000.

       PROCEDURE DIVISION.
           DISPLAY LINE01.
           DISPLAY LINE02.
           DISPLAY LINE03.
           DISPLAY LINE04.
           STOP RUN.
