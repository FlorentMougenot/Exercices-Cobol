       IDENTIFICATION DIVISION.
       PROGRAM-ID. base.
       AUTHOR. nom.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT F-INPUT
               ASSIGN TO 'input.dat'
               ACCESS MODE IS SEQUENTIAL
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS F-INPUT-STATUS.

           SELECT F-OUTPUT
               ASSIGN TO 'output.dat'
               ACCESS MODE IS SEQUENTIAL
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS F-OUTPUT-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD F-INPUT.

       FD F-OUTPUT.
       WORKING-STORAGE SECTION.
       
       PROCEDURE DIVISION.
       
           STOP RUN.
