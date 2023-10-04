SET DEFINE OFF;
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (38, 99, 'plot', 'plot.html');
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (39, 12, 'Ιστορικό Μαθημάτων', 'AllLessons_k_k.jsp');
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (21, 6, 'Απαντήσεις Μαθητών', 'LessonsAnswers_k.jsp');
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (23, 2, 'Συμετέχοντες σε Κύκλο Μαθημάτων', 'UserCourses_k.jsp');
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (24, 12, 'Μαθήματα Σήμερα (Καθηγητή) ', 'AllLessons_k_m.jsp?query=   and user_status = 1  and trunc(sysdate) between trunc(FR_LESSON_DATE) and trunc(TO_LESSON_DATE)');
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (25, 12, 'Τρέχων Μάθημα(Καθηγητή) ', 'AllLessons_c_k_m.jsp?query=    and user_status = 1 and  exists (select 0 from period_lessons f where 1=1 and  a.lesson_id = f.lesson_id and sysdate-2 between FR_LESSON_DATE and TO_LESSON_DATE)');
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (28, 10, 'Τρέχων Μάθημα(Μαθητή) ', 'AllLessons_m_m.jsp?query=    and user_status = 1  and sysdate between FR_LESSON_DATE and TO_LESSON_DATE');
Insert into EDTOOL.PINMENU_DETAIL
   (ID, ID_KATHG, DESCR, JSP)
 Values
   (29, 10, 'Μαθήματα Σήμερα(Μαθητή)', 'AllLessons_m_m.jsp?query=   and user_status = 1  and trunc(sysdate) between trunc(FR_LESSON_DATE) and trunc(TO_LESSON_DATE)');
COMMIT;
