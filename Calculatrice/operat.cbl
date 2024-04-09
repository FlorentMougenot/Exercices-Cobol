       IDENTIFICATION DIVISION.
       PROGRAM-ID. operat.

       DATA DIVISION.
      *Initialisation des variables
       WORKING-STORAGE SECTION.
       01 NUM1        PIC 9(5).
       01 NUM2        PIC 9(5).
       01 RESULT      PIC 9(10)V99.
       01 OPERATOR    PIC X.

      * Entrée des données par l'utilisateur
       PROCEDURE DIVISION.
           DISPLAY "Entrez un premier entier :" SPACE WITH NO ADVANCING
               ACCEPT NUM1
           DISPLAY "Opérateur (+, -, *, /) :" SPACE WITH NO ADVANCING
               ACCEPT OPERATOR
           DISPLAY "Entrez un second entier : " SPACE WITH NO ADVANCING
               ACCEPT NUM2

      * Appel de la fonction de calcul
           PERFORM CALCULATION
      * Affichage du résultat de calcul
           DISPLAY "Le résultat est :" SPACE RESULT

           STOP RUN.

       CALCULATION SECTION.
      * Qui sait le + doute le +, proverbe du XVIIe siècle
           IF OPERATOR = '+'
      * Cas particulier pour faire énormément plaisir à Florian
               IF NUM1 = 1 AND NUM2 = 1
                    MOVE 11 TO RESULT
           ELSE
               ADD NUM1 TO NUM2 GIVING RESULT
      * Qui peut le plus, peut le moins, proverbe français
           ELSE IF OPERATOR = '-'
               SUBTRACT NUM2 FROM NUM1 GIVING RESULT
      * Je crois, à mon étoile, elle est, le point de départ... LinkUp
           ELSE IF OPERATOR = '*'
               MULTIPLY NUM1 BY NUM2 GIVING RESULT
      * Je connais un meilleur slasher que la série Halloween
           ELSE IF OPERATOR = '/'
               DIVIDE NUM1 BY NUM2 GIVING RESULT
      * Exception si on a affaire à un utilisateur qui ne sait pas 
      * utiliser ses neurones atrophiés correctement et utiliser un des
      * quatre opérateurs proposés entre parenthèses
           ELSE
           DISPLAY "Ce caractère ne fait pas partie de ceux proposés"
           END-IF.
