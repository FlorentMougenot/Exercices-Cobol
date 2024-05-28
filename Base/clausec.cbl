       IDENTIFICATION DIVISION.
       PROGRAM-ID. clausec.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT RECSORTIE ASSIGN TO "sortie.cpy"
                  ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD RECSORTIE.
       01 RECSORTIE-REC PIC X(100).

       WORKING-STORAGE SECTION.
       01 VAR PIC 99 VALUE 10. 

       PROCEDURE DIVISION.
       BEGIN.
           OPEN OUTPUT RECSORTIE.

           MOVE "       01 GROUPE1." TO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.


           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Identifia
      -    "ntCT'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(05) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Muna'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(03) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Identifia
      -    "ntSE'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(04) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR,") VALUE 'MunaSE'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(04) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Identifia
      -    "ntRG'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(03) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR,") VALUE 'MunaRG'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(04) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(",VAR,") VALUE 'Libellé'."
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(15) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR,") VALUE 'MotClé'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(14) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Lissable'
      -    "." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(01) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'TVA'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(02) VALUE SPACES."
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'CMU'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(03) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Etat'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(02) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR,") VALUE 'TypeRG'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(04) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Soustype'
      -    "." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(06) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(",VAR,") VALUE 'DateMAJ'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(05) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR,") VALUE 'DébutEffet
      -    "'." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(02) VALUE SPACES."
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'FinEffet'
      -    "." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(04) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(", VAR, ") VALUE 'Priorité'
      -    "." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           STRING "          03 FILLER PIC X(01) VALUE SPACES." 
           INTO RECSORTIE-REC.
           WRITE RECSORTIE-REC.
           INITIALIZE RECSORTIE-REC.

           CLOSE RECSORTIE.

           STOP RUN.
  