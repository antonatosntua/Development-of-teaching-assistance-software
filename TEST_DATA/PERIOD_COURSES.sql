﻿SET DEFINE OFF;
Insert into EDTOOL.PERIOD_COURSES
   (ID, COURSE_STATUS, START_DATE, END_DATE, GEN_COURSE_ID)
 Values
   (3, 1, TO_DATE('1/1/2022', 'DD/MM/YYYY'), TO_DATE('31/12/2022', 'DD/MM/YYYY'), 1);
Insert into EDTOOL.PERIOD_COURSES
   (ID, COURSE_STATUS, START_DATE, END_DATE, GEN_COURSE_ID)
 Values
   (4, 1, TO_DATE('1/1/2022', 'DD/MM/YYYY'), TO_DATE('31/12/2022', 'DD/MM/YYYY'), 2);
Insert into EDTOOL.PERIOD_COURSES
   (ID, COURSE_STATUS, START_DATE, END_DATE, GEN_COURSE_ID)
 Values
   (5, 1, TO_DATE('1/1/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 1);
Insert into EDTOOL.PERIOD_COURSES
   (ID, COURSE_STATUS, START_DATE, END_DATE, GEN_COURSE_ID)
 Values
   (6, 1, TO_DATE('1/1/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 2);
Insert into EDTOOL.PERIOD_COURSES
   (ID, COURSE_STATUS, START_DATE, END_DATE, GEN_COURSE_ID)
 Values
   (1, 1, TO_DATE('1/1/2021', 'DD/MM/YYYY'), TO_DATE('31/12/2021', 'DD/MM/YYYY'), 1);
Insert into EDTOOL.PERIOD_COURSES
   (ID, COURSE_STATUS, START_DATE, END_DATE, GEN_COURSE_ID)
 Values
   (2, 1, TO_DATE('1/1/2021', 'DD/MM/YYYY'), TO_DATE('31/12/2021', 'DD/MM/YYYY'), 2);
COMMIT;
