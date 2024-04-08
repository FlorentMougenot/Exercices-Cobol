       IDENTIFICATION DIVISION.
       PROGRAM-ID. pettable.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PETXX.
        05 PET-ID.
         07 PET-ID-KEY           PIC X(3).
         07 PET-ID-NUM           PIC 9(5).
        05 PET-GENDER            PIC X(1).
        05 PET-NAME              PIC X(8).
        05 PET-LOOF              PIC X(3).
        05 PET-AGE               PIC 9(3).
        05 PET-MASTER.
         07 PET-MASTER-LASTNAME  PIC X(9).
         07 PET-MASTER-FIRSTNAME PIC X(6).
         07 PET-MASTER-ID.
          10 PET-MASTER-ID-A     PIC A(2).
          10 PET-MASTER-ID-B     PIC 9(3).