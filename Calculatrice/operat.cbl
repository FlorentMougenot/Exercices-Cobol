       IDENTIFICATION DIVISION.
       PROGRAM-ID. operat.

       DATA DIVISION.
      *Initialisation des variables
       WORKING-STORAGE SECTION.
       01 NUM1        PIC 9(5)V999.
       01 NUM2        PIC 9(5)V999.
       01 RESULT      PIC 9(10)V999.

      * Entrée des données par l'utilisateur
       PROCEDURE DIVISION.
           DISPLAY "Entrez un premier entier :" SPACE WITH NO ADVANCING.
               ACCEPT NUM1.
           DISPLAY "Entrez un second entier : " SPACE WITH NO ADVANCING.
               ACCEPT NUM2.

      * Calcul et rendu de la somme
               ADD NUM1 TO NUM2 GIVING RESULT.
               DISPLAY "La somme est égale à" SPACE RESULT.
      * Calcul et rendu de la soustraction
               SUBTRACT NUM2 FROM NUM1 GIVING RESULT.
               DISPLAY "La soustraction est égale à" SPACE RESULT.
      * Calcul et rendu de la multiplication
               MULTIPLY NUM1 BY NUM2 GIVING RESULT.
               DISPLAY "La multiplication est égale à" SPACE RESULT.
      * Calcul et rendu de la division
               DIVIDE NUM1 BY NUM2 GIVING RESULT.
               DISPLAY "La division est égale à" SPACE RESULT.

