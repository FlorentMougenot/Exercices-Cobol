       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-status.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-LINE-RAP           PIC X(250)           VALUE SPACES.

       PROCEDURE DIVISION.
       9000-TEST-STATUS-START.
           IF NOT F-INPUT-STATUS-OK AND NOT F-INPUT-STATUS-EOF
               MOVE ALL  '/' TO WS-LINE-RAP
               DISPLAY WS-LINE-RAP
               DISPLAY 'RETURN CODE ERROR' SPACE F-INPUT-STATUS
               MOVE ALL  '/' TO WS-LINE-RAP
               DISPLAY WS-LINE-RAP
               STOP RUN
           END-IF.

           IF NOT F-OUTPUT-STATUS-OK
               MOVE ALL  '/' TO WS-LINE-RAP
               DISPLAY WS-LINE-RAP
               DISPLAY 'RETURN CODE ERROR' SPACE F-OUTPUT-STATUS
               MOVE ALL  '/' TO WS-LINE-RAP
               DISPLAY WS-LINE-RAP
               STOP RUN
           END-IF.
       9000-TEST-STATUS-END.
           GOBACK.
