       IDENTIFICATION DIVISION.
       PROGRAM-ID. calc-avg.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STUDENT-AVG PIC 9(3)V99 VALUE 0.
       01 WS-COURSE-AVG  PIC 9(3)V99 VALUE 0.
       01 WS-COURSE-DIV  PIC 99      VALUE 0.
       01 WS-STUDENT-DIV PIC 99      VALUE 0.

       PROCEDURE DIVISION.
       6000-CALC-AVG-START.
           PERFORM VARYING WS-IND-ST FROM 1 BY 1
              UNTIL WS-IND-ST > WS-NB-STUDENTS
                  SET WS-ID1 TO WS-STUDENT-ID(WS-IND-ST)
                  PERFORM VARYING WS-IND-CL FROM 1 BY 1
                     UNTIL WS-IND-CL > WS-NB-RECORDS
                        OR WS-CLASS-ID1(WS-IND-CL) NOT EQUAL WS-ID1
                             PERFORM 5080-PREP-C-AVG-START
                                THRU 5085-PREP-C-AVG-END
                     END-PERFORM
                  COMPUTE WS-STUDENT-AVG(WS-ID1) ROUNDED =
                            WS-STUDENT-AVG(WS-ID1) / WS-STUDENT-DIV
           END-PERFORM.

           PERFORM VARYING WS-IND-CO FROM 1 BY 1
              UNTIL WS-IND-CO > WS-NB-COURSES
                 COMPUTE WS-COURSE-AVG(WS-IND-CO) ROUNDED =
                            WS-COURSE-AVG(WS-IND-CO) /
                            WS-COURSE-DIV(WS-IND-CO)
           END-PERFORM.
       6000-CALC-AVG-END.
           GOBACK.
