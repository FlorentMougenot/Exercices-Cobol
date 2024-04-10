       IDENTIFICATION DIVISION.
       PROGRAM-ID. calculat.

       DATA DIVISION.
      * Saisie des variables
       WORKING-STORAGE SECTION.
       01 WS-NUM1                  PIC S9(5).
       01 WS-NUM2                  PIC S9(5).
       01 WS-RESULT                PIC S9(10).
       01 WS-QUEST                 PIC X(300).
       01 WS-OPERATOR              PIC X.
       01 WS-OPERATION-TYPE        PIC X.
       01 WS-PREVIOUS-RESULT       PIC S9(10).
       01 WS-RES-TEMP              PIC Z(10).
       01 WS-RES                   PIC X(10) VALUE "VIDE".
      * Variable non utilisé qui etait présente pour la partie
      *affichage des calculs et résultats
       01 WS-OPERATION-STRING      PIC X(30).
       01 WS-CONTINUE-FLAG         PIC X VALUE 'Y'.

       PROCEDURE DIVISION.
      * Balise de boucle jusqu'à étape de sortie
           PERFORM UNTIL WS-CONTINUE-FLAG = 'N'
           DISPLAY "--------------------------------------------------"
           DISPLAY " "
           DISPLAY "Choisissez votre commande par son numéro"
           DISPLAY "La calculatrice garde la valeur précédente"
           DISPLAY "La valeur précédente est" SPACE WS-RES
           DISPLAY "1 - Faire une puissance (pas Hercule, Stallone...)"
           DISPLAY "2 - Opérations à deux nombres de saisie"
           DISPLAY "3 - Posez une question au génie de la calculatrice"
           DISPLAY "4 - Réinitialiser la calculatrice"
           DISPLAY "Tapez toute autre touche pour sortir"
           DISPLAY "Votre choix :" SPACE WITH NO ADVANCING
           ACCEPT WS-OPERATION-TYPE

      * Un petit IF ELSE parceque tu kiffes grave, toi même tu sais...
           IF      WS-OPERATION-TYPE = '1'
               PERFORM SINGLE-NUMBER-OPERATION
           ELSE IF WS-OPERATION-TYPE = '2'
               PERFORM TWO-NUMBERS-OPERATION
           ELSE IF WS-OPERATION-TYPE = '3'
               PERFORM QUESTION
           ELSE IF WS-OPERATION-TYPE = '4'
               MOVE ZERO TO WS-PREVIOUS-RESULT
               MOVE "VIDE" TO WS-RES
               DISPLAY "Mémoire remise à zéro"
           ELSE
               DISPLAY "Saisie non conforme"
           END-IF

      * Etape de sortie de la calculatrice
           DISPLAY "Voulez vous rester sur la calculatrice (Y/N)? "
           ACCEPT WS-CONTINUE-FLAG
           END-PERFORM

           STOP RUN.


      * Opérations avec un seul nombre
       SINGLE-NUMBER-OPERATION SECTION.
           IF WS-PREVIOUS-RESULT = ZERO
           DISPLAY "Entrez un nombre entier:" SPACE WITH NO ADVANCING
               ACCEPT WS-NUM1
           ELSE
               MOVE WS-PREVIOUS-RESULT TO WS-NUM1
           END-IF

           DISPLAY "Entrez l'exposant:"
           SPACE WITH NO ADVANCING
               ACCEPT WS-NUM2

           COMPUTE WS-RESULT = WS-NUM1 ** WS-NUM2.

           MOVE WS-RESULT TO WS-RES-TEMP.
           MOVE FUNCTION TRIM(WS-RES-TEMP) TO WS-RES.
           DISPLAY "Le résultat est :"SPACE WS-RES.
           MOVE WS-RESULT TO WS-PREVIOUS-RESULT.


      *Opérations avec 2 nombres
       TWO-NUMBERS-OPERATION SECTION.
           IF WS-PREVIOUS-RESULT = ZERO
           DISPLAY "Entrez un premier entier :" SPACE WITH NO ADVANCING
               ACCEPT WS-NUM1
           ELSE
               MOVE WS-PREVIOUS-RESULT TO WS-NUM1
           END-IF
           DISPLAY "Entrez le symbole de l'opération (+, -, *, /):"
           SPACE WITH NO ADVANCING             
               ACCEPT WS-OPERATOR
           DISPLAY "Entrez un second entier :" SPACE WITH NO ADVANCING
               ACCEPT WS-NUM2

           EVALUATE WS-OPERATOR
      * Qui sait le +, doute le +, proverbe du XVIIe siècle
               WHEN '+' 
      * Cas particulier pour faire énormément plaisir à Florian
                  IF WS-NUM1 = 1 AND WS-NUM2 = 1
                  MOVE 11 TO WS-RESULT
                  ELSE
                  ADD WS-NUM1 TO WS-NUM2 GIVING WS-RESULT
                  END-IF
      * Qui peut le plus, peut le moins, proverbe français
               WHEN '-'
                  COMPUTE WS-RESULT = WS-NUM1 - WS-NUM2
            
      *           SUBTRACT WS-NUM2 FROM WS-NUM1 GIVING WS-RESULT
      * Je crois, à mon étoile, elle est, le point de départ... LinkUp
               WHEN '*'
                  MULTIPLY WS-NUM1 BY WS-NUM2 GIVING WS-RESULT
      * Je connais un meilleur slasher que la série Halloween
               WHEN '/'
                  DIVIDE WS-NUM1 BY WS-NUM2 GIVING WS-RESULT
      * Exception si on a affaire à un utilisateur qui ne sait pas 
      * utiliser ses neurones atrophiés correctement et utiliser un des
      * opérateurs proposés entre parenthèses
               WHEN OTHER
                  DISPLAY "Choisissez un des caractères proposés !"
           END-EVALUATE

           MOVE WS-RESULT TO WS-RES-TEMP
           MOVE FUNCTION TRIM(WS-RES-TEMP) TO WS-RES
           DISPLAY "Operation: " WS-OPERATION-STRING.
           DISPLAY "Le résultat est :"SPACE WS-RES.
           MOVE WS-RESULT TO WS-PREVIOUS-RESULT.

      * Running gag que Florian nous a déjà fait à 3 reprises
      * Il s'agit donc d'un hommage
       QUESTION SECTION.
           DISPLAY "Quelle est votre question ?" SPACE WITH NO ADVANCING
               ACCEPT WS-QUEST
           DISPLAY "Florian dit : La réponse est 42".
