SET DEFINE OFF;
Insert into EDTOOL.PINMENU
   (PIN3, TAB_LEKT)
 Values
   (99, 'OTHERS');
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT)
 Values
   ('AllLessons_m.jsp', 6, 'Προβολη Μαθημάτων');
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT, SEIRA_EMFANISIS)
 Values
   ('Users_k.jsp', 1, 'Διαχείριση Χρηστών', 1);
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT, SEIRA_EMFANISIS)
 Values
   ('Courses_k.jsp', 2, 'Διαχείριση Κύκλου Μαθημάτων', 2);
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT, SEIRA_EMFANISIS)
 Values
   ('AllLessons_k.jsp', 4, 'Διαχείριση Μαθημάτων', 4);
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT, SEIRA_EMFANISIS)
 Values
   ('Chapters_k.jsp', 3, 'Διαχείριση Κεφαλαίων Μαθημάτων', 3);
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT, SEIRA_EMFANISIS)
 Values
   ('AllLessons_k_m.jsp?query=   and user_type = 1  and user_status = 1  and trunc(sysdate) between trunc(FR_LESSON_DATE) and trunc(TO_LESSON_DATE)', 9, 'Μαθήματα Σήμερα', 9);
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT, SEIRA_EMFANISIS)
 Values
   ('AllLessons_m_k.jsp', 10, 'Μαθήματα Μαθητή', 10);
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT, SEIRA_EMFANISIS)
 Values
   ('AllLessons_k_m.jsp?query=  and user_type = 2  and user_status = 1 and sysdate between Fr_LESSON_DATE_FROM and TO_LESSON_DATE', 11, 'Συμμετέχοντες Μαθητές Στο Μάθημα', 11);
Insert into EDTOOL.PINMENU
   (FORM, PIN3, TAB_LEKT)
 Values
   ('home.jsp', 12, 'Μαθήματα Καθηγητή');
COMMIT;
