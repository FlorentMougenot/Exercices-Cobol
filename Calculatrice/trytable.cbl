       IDENTIFICATION DIVISION.
       PROGRAM-ID. trytable.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 DATABASE.   
           03 FILLER PIC X(33) VALUE "0001 BULBIZARRE   PLT/PSN   0045".
           03 FILLER PIC X(33) VALUE "0002 HERBIZARRE   PLT/PSN   0060".
           03 FILLER PIC X(33) VALUE "0003 FLORIZARRE   PLT/PSN   0080".
           03 FILLER PIC X(33) VALUE "0004 SALAMECHE    FEU       0065".
           03 FILLER PIC X(33) VALUE "0005 REPTINCEL    FEU       0080".
           03 FILLER PIC X(33) VALUE "0006 DRACAUFEU    FEU/VOL   0100".
           03 FILLER PIC X(33) VALUE "0007 CARAPUCE     EAU       0043".
           03 FILLER PIC X(33) VALUE "0008 CARABAFFE    EAU       0053".
           03 FILLER PIC X(33) VALUE "0009 TORTANK      EAU       0078".
           03 FILLER PIC X(33) VALUE "0010 CHENIPAN     INSECT    0045".

       01 POKEBALL REDEFINES DATABASE.
           03 POKE-TABLE OCCURS 10 TIMES.
              05 POKEDEX      PIC 9(5).
              05 POKENAME     PIC X(13).
              05 POKETYPE     PIC X(11).
              05 POKESPEED    PIC 9(4).

       PROCEDURE DIVISION.

      * MOVE DATABASE TO POKEBALL.
           DISPLAY "Deuxième entrée du tableau :" SPACE POKE-TABLE(2).
           DISPLAY "Cinquième entrée du tableau :" SPACE POKE-TABLE(5).
           DISPLAY "Dixième entrée du tableau :" SPACE POKE-TABLE(10).

           STOP RUN.
