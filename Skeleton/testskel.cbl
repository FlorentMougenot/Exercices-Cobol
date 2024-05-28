       IDENTIFICATION DIVISION.
       PROGRAM-ID. testskel.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CHOICE       PIC 9.
       01  WS-EXIT-FLAG    PIC X VALUE 'N'.

       SCREEN SECTION.

       01  START-SCREEN.
           05 MANAGEMENT-MENU PIC X(24) VALUE "GENERATOR SYSTEM"
           line 2 col 35 FOREGROUND-COLOR 9.
           05 READ-FILE PIC X(60) VALUE 
           "1. Read a sequential file"
           line 5 col 35 FOREGROUND-COLOR 9.
           05 WRITE-FILE PIC X(60) VALUE 
           "2. Write a sequential file"
           line 6 col 35 FOREGROUND-COLOR 9.
           05 SORT-FILE PIC X(60) VALUE "3. Sort a file"
           line 7 col 35 FOREGROUND-COLOR 9.
           05 MERGE-FILES PIC X(60) VALUE 
           "4. Merge multiple files" line 8 col 35  
           FOREGROUND-COLOR 9. 
           05 ACCESS-DB PIC X(60) VALUE 
           "5. Access a designated database" line 9 col 35  
           FOREGROUND-COLOR 9.
           05 COUNT-DB PIC X(60) VALUE 
           "6. Generate a SELECT COUNT(*) query" line 10 col 35  
           FOREGROUND-COLOR 9.
           05 CURSOR-DB PIC X(60) VALUE 
           "7. Generate a cursor" line 11 col 35  
           FOREGROUND-COLOR 9.
           05 UPDATE-DB PIC X(60) VALUE 
           "8. Generate an UPDATE query" line 12 col 35  
           FOREGROUND-COLOR 9.
           05 SUBROUTINE PIC X(60) VALUE 
           "9. Create a subroutine" line 13 col 35  
           FOREGROUND-COLOR 9.
           05 CALL-ROUTINE PIC X(60) VALUE 
           "10. Integrate a typical subroutine call" line 14 col 34  
           FOREGROUND-COLOR 9.
           05 COPYBOOK-TEMPLATE PIC X(60) VALUE 
           "11. Prepare a Copybook template" line 15 col 34  
           FOREGROUND-COLOR 9.
           05 COPYBOOK-INTEGRATE PIC X(60) VALUE 
           "12. Integrate a Copybook" line 16 col 34  
           FOREGROUND-COLOR 9.
           05 HELLO-COBOL PIC X(60) VALUE 
           "13. Add a HelloCobol" line 17 col 34  
           FOREGROUND-COLOR 9.
           05 PARA-INTEG PIC X(60) VALUE 
           "14. Integrate typical paragraphs in the procedure"
           line 18 col 34 FOREGROUND-COLOR 9.

       01  TEST-BLANK.
           05 BLANK SCREEN.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           PERFORM UNTIL WS-EXIT-FLAG = 'Y'
               DISPLAY START-SCREEN
               ACCEPT WS-CHOICE line 20 col 35

               EVALUATE WS-CHOICE
                   WHEN 1
                       PERFORM 1000-READ-SEQUENTIAL-FILE
                   WHEN 2
                       PERFORM 1100-WRITE-SEQUENTIAL-FILE
                   WHEN 3
                       PERFORM 1200-SORT-FILE
                   WHEN 4
                       PERFORM 1300-MERGE-FILES
                   WHEN 5
                       PERFORM 2000-ACCESS-DATABASE
                   WHEN 6
                       PERFORM 2100-GENERATE-SELECT-COUNT
                   WHEN 7
                       PERFORM 2200-GENERATE-CURSOR
                   WHEN 8
                       PERFORM 2300-GENERATE-UPDATE
                   WHEN 9
                       PERFORM 3000-CREATE-SUBROUTINE
                   WHEN 10
                       PERFORM 3100-INTEGRATE-SUBROUTINE-CALL
                   WHEN 11
                       PERFORM 4000-PREPARE-COPYBOOK-TEMPLATE
                   WHEN 12
                       PERFORM 4100-INTEGRATE-COPYBOOK
                   WHEN 13
                       PERFORM 5000-ADD-HELLO-COBOL
                   WHEN 14
                       PERFORM 5100-INTEGRATE-PARAGRAPHS
                   WHEN OTHER
                       DISPLAY 'Invalid choice, please try again.'
               END-EVALUATE
               DISPLAY TEST-BLANK
               DISPLAY 'Do you want to exit (Y/N)? ' line 20 col 35
               ACCEPT WS-EXIT-FLAG line 20 col 62
               MOVE FUNCTION UPPER-CASE(WS-EXIT-FLAG) TO WS-EXIT-FLAG
           END-PERFORM.
           STOP RUN.


         1000-READ-SEQUENTIAL-FILE.
           DISPLAY TEST-BLANK.
           DISPLAY 'Reading a sequential file...'.
      * Add code to read a sequential file here.

       1100-WRITE-SEQUENTIAL-FILE.
           DISPLAY TEST-BLANK.
           DISPLAY 'Writing to a sequential file...'.
      * Add code to write to a sequential file here.

       1200-SORT-FILE.
           DISPLAY TEST-BLANK.
           DISPLAY 'Sorting a file...'.
      * Add code to sort a file here.

       1300-MERGE-FILES.
           DISPLAY TEST-BLANK.
           DISPLAY 'Merging multiple files...'.
      * Add code to merge files here.

       2000-ACCESS-DATABASE.
           DISPLAY TEST-BLANK.
           DISPLAY 'Accessing a designated database...'.
      * Add code to access a database here.

       2100-GENERATE-SELECT-COUNT.
           DISPLAY TEST-BLANK.
           DISPLAY 'Generating a SELECT COUNT(*) query...'.
      * Add code to generate a SELECT COUNT(*) query here.

       2200-GENERATE-CURSOR.
           DISPLAY TEST-BLANK.
           DISPLAY 'Generating a cursor...'.
      * Add code to generate a cursor here.

       2300-GENERATE-UPDATE.
           DISPLAY TEST-BLANK.
           DISPLAY 'Generating an UPDATE query...'.
      * Add code to generate an UPDATE query here.

       3000-CREATE-SUBROUTINE.
           DISPLAY TEST-BLANK.
           DISPLAY 'Creating a subroutine...'.
      * Add code to create a subroutine here.

       3100-INTEGRATE-SUBROUTINE-CALL.
           DISPLAY TEST-BLANK.
           DISPLAY 'Integrating a typical subroutine call...'.
      * Add code to integrate a subroutine call here.

       4000-PREPARE-COPYBOOK-TEMPLATE.
           DISPLAY TEST-BLANK.
           DISPLAY 'Preparing a Copybook template...'.
      * Add code to prepare a Copybook template here.

       4100-INTEGRATE-COPYBOOK.
           DISPLAY TEST-BLANK.
           DISPLAY 'Integrating a Copybook...'.
      * Add code to integrate a Copybook here.

       5000-ADD-HELLO-COBOL.
           DISPLAY TEST-BLANK.
           DISPLAY 'Adding HelloCobol...'.
      * Add code to add HelloCobol here.

       5100-INTEGRATE-PARAGRAPHS.
           DISPLAY TEST-BLANK.
           DISPLAY 'Integrating typical paragraphs in the procedure...'.
      * Add code to integrate paragraphs in the procedure here.
     
       
        