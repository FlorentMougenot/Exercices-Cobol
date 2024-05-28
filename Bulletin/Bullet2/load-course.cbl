       IDENTIFICATION DIVISION.
       PROGRAM-ID. load-course.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-COURSES.
           03 WS-NB-COURSES          PIC 99      VALUE 0.
           03 WS-COURSE-TAB  OCCURS 1 TO 99
                             DEPENDING WS-NB-COURSES
                             INDEXED BY IDX-COURSE.
              05 WS-COURSE-ID       PIC 99.
              05 WS-COURSE-NAME     PIC X(21).
              05 WS-COURSE-COEF     PIC 9V9.
              05 WS-COURSE-AVG      PIC 9(3)V99  VALUE 0.
              05 WS-COURSE-DIV      PIC 99       VALUE 0.

       PROCEDURE DIVISION.
       5020-LOAD-COURSE-START.
           SET IDX-COURSE TO 1.
           SEARCH WS-COURSE-TAB
               AT END
                   SET WS-NB-COURSES UP BY 1
                   MOVE WS-NB-COURSES TO WS-COURSE-ID(WS-NB-COURSES)
                   MOVE R-LABEL TO WS-COURSE-NAME(WS-NB-COURSES)
                   MOVE R-COEF TO WS-COURSE-COEF(WS-NB-COURSES)
               WHEN WS-COURSE-NAME(IDX-COURSE) = R-LABEL
                   MOVE WS-COURSE-ID(IDX-COURSE) TO WS-ID2
           END-SEARCH.
       5020-LOAD-COURSE-END.
           GOBACK.
