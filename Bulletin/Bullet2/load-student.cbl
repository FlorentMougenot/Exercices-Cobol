       IDENTIFICATION DIVISION.
       PROGRAM-ID. load-student.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-STUDENTS.
           03  WS-NB-STUDENTS PIC 99 VALUE 0 .
           03  WS-STUDENT-TAB  OCCURS 1 TO 99
                               DEPENDING WS-NB-STUDENTS
                               INDEXED BY IDX-STUDENT.
              05 WS-STUDENT-ID       PIC 99.
              05 WS-STUDENT-NAME     PIC X(13).
              05 WS-STUDENT-AGE      PIC 99.
              05 WS-STUDENT-AVG      PIC 999V99.

       PROCEDURE DIVISION.
       5000-LOAD-STUDENT-START.
           SET WS-NB-STUDENTS UP BY 1.
           STRING WS-NB-STUDENTS R-NAME R-AGE
           DELIMITED BY SIZE
           INTO WS-STUDENT-TAB(WS-NB-STUDENTS).
           MOVE WS-NB-STUDENTS TO WS-ID1.
       5000-LOAD-STUDENT-END.
           GOBACK.
