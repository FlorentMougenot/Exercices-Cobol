       IDENTIFICATION DIVISION.
       PROGRAM-ID. exodept.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 DEPARTEMENTS.
          05 DEPT OCCURS 100 TIMES INDEXED BY IDX.
             10 DEPT-NUM       PIC X(3).
             10 DEPT-NAME      PIC X(24).
             10 DEPT-REGION    PIC X(25).

       01 DEPT-NUMBER         PIC X(3).
       01 SEARCH-FOUND        PIC X(3) VALUE 'NO'.

       PROCEDURE DIVISION.
      * Initialisation de la table avec des valeurs exemple
           PERFORM INITIALIZATION.

      * Recherche simple par SEARCH
           DISPLAY 'Entrez un numéro de département pour la recherche :'.
           ACCEPT DEPT-NUMBER.
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 100 
                   OR SEARCH-FOUND = 'YES'
               IF DEPT(IDX):DEPT-NUM IS EQUAL TO DEPT-NUMBER
                   MOVE 'YES' TO SEARCH-FOUND
                   DISPLAY "Département: " DEPT(IDX):DEPT-NAME
                   DISPLAY "Région: " DEPT(IDX):DEPT-REGION
               END-IF
           END-PERFORM.
           IF SEARCH-FOUND = 'NO'
               DISPLAY "Département non trouvé."
           END-IF.

      * Préparation pour SEARCH ALL
           MOVE 'NO' TO SEARCH-FOUND.
           DISPLAY 'Entrez un numéro de département :'.
           ACCEPT DEPT-NUMBER.

      * Recherche dichotomique par SEARCH ALL
           SET IDX TO 1.
           SEARCH ALL DEPT
               AT END
                   DISPLAY "Département non trouvé."
               WHEN DEPT-NUM(IDX) = DEPT-NUMBER
                   DISPLAY "Département: " DEPT-NAME(IDX)
                   DISPLAY "Région: " DEPT-REGION(IDX).

           STOP RUN.

       INITIALIZATION.
      * Cet exemple montre une initialisation pour quelques départements
           MOVE '001' TO DEPT(1):DEPT-NUM.
           MOVE 'Ain' TO DEPT(1):DEPT-NAME.
           MOVE 'Auvergne-Rhône-Alpes' TO DEPT(1):DEPT-REGION.
           MOVE '002' TO DEPT(2):DEPT-NUM.
           MOVE 'Aisne' TO DEPT(2):DEPT-NAME.
           MOVE 'Hauts-de-France' TO DEPT(2):DEPT-REGION.
           MOVE '003' TO DEPT(3):DEPT-NUM.
           MOVE 'Allier' TO DEPT(3):DEPT-NAME.
           MOVE 'Auvergne-Rhône-Alpes' TO DEPT(3):DEPT-REGION.
           MOVE '004' TO DEPT(4):DEPT-NUM.
           MOVE 'Alpes-de-Haute-Provence' TO DEPT(4):DEPT-NAME.
           MOVE 'Provence-Alpes-Côte d’Azur' TO DEPT(4):DEPT-REGION.
           MOVE '005' TO DEPT(5):DEPT-NUM.
           MOVE 'Hautes-Alpes' TO DEPT(5):DEPT-NAME.
           MOVE 'Provence-Alpes-Côte d’Azur' TO DEPT(5):DEPT-REGION.
       END PROGRAM DepartmentSearch.
