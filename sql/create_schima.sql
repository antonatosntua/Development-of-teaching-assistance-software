--
-- Drop and Create Script
--   Database Version            : 11.2.0.2.0
--   Database Compatible Level   : 11.2.0.0.0
--   Script Compatible Level     : 11.2.0.0.0
--   Toad Version                : 14.0.75.662
--   DB Connect String           : XE
--   Schema                      : EDTOOL
--   Script Created by           : EDTOOL
--   Script Created at           : 4/10/2023 7:15:19 μμ
--   Notes                       : 
--

-- Object Counts: 
--   Functions: 12      Lines of Code: 821 
--   Indexes: 33        Columns: 36         
--   Packages: 9        Lines of Code: 37 
--   Package Bodies: 9  Lines of Code: 170 
--   Procedures: 8      Lines of Code: 393 
--   Sequences: 1 
--   Tables: 20         Columns: 149        Constraints: 74     
--   Triggers: 1 
--   Views: 21          Columns: 342        


-- "Set define off" turns off substitution variables.
Set define off; 

DROP SEQUENCE EDTOOL.SQ_FOR_ALL_IDS;

--
-- SQ_FOR_ALL_IDS  (Sequence) 
--
CREATE SEQUENCE EDTOOL.SQ_FOR_ALL_IDS
  START WITH 6027
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;


DROP TABLE EDTOOL.ANSWERS CASCADE CONSTRAINTS PURGE;

--
-- ANSWERS  (Table) 
--
--   Row Count: 6
CREATE TABLE EDTOOL.ANSWERS
(
  ID            NUMBER,
  DESCR_ANSWER  VARCHAR2(30 BYTE)               NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- EDT_ANSWERS_PK  (Index) 
--
--  Dependencies: 
--   ANSWERS (Table)
--
CREATE UNIQUE INDEX EDTOOL.EDT_ANSWERS_PK ON EDTOOL.ANSWERS
(ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.ANSWERS ADD (
  CONSTRAINT ANSWERS_PK
  PRIMARY KEY
  (ID)
  USING INDEX EDTOOL.EDT_ANSWERS_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.GENTERS CASCADE CONSTRAINTS PURGE;

--
-- GENTERS  (Table) 
--
--   Row Count: 2
CREATE TABLE EDTOOL.GENTERS
(
  ID            NUMBER,
  DESCR_GENTER  VARCHAR2(30 BYTE)               NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- EDT_GENTERS_PK  (Index) 
--
--  Dependencies: 
--   GENTERS (Table)
--
CREATE UNIQUE INDEX EDTOOL.EDT_GENTERS_PK ON EDTOOL.GENTERS
(ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.GENTERS ADD (
  CONSTRAINT GENTERS_PK
  PRIMARY KEY
  (ID)
  USING INDEX EDTOOL.EDT_GENTERS_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.GEN_COURSES CASCADE CONSTRAINTS PURGE;

--
-- GEN_COURSES  (Table) 
--
--   Row Count: 2
CREATE TABLE EDTOOL.GEN_COURSES
(
  COURSE_ID    NUMBER                           NOT NULL,
  COURSE_DESR  VARCHAR2(50 BYTE)                NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- GEN_COURSES_PK  (Index) 
--
--  Dependencies: 
--   GEN_COURSES (Table)
--
CREATE UNIQUE INDEX EDTOOL.GEN_COURSES_PK ON EDTOOL.GEN_COURSES
(COURSE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.GEN_COURSES ADD (
  CONSTRAINT GEN_COURSES_PK
  PRIMARY KEY
  (COURSE_ID)
  USING INDEX EDTOOL.GEN_COURSES_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.PERIOD_ANSWERS CASCADE CONSTRAINTS PURGE;

--
-- PERIOD_ANSWERS  (Table) 
--
--   Row Count: 6
CREATE TABLE EDTOOL.PERIOD_ANSWERS
(
  PERIOD_ASWER_ID   NUMBER                      NOT NULL,
  START_PER_ANSWER  DATE                        NOT NULL,
  END_PER_ANSWER    DATE,
  LESSON_ID         NUMBER                      NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- PERIOD_ANSWERS_PK  (Index) 
--
--  Dependencies: 
--   PERIOD_ANSWERS (Table)
--
CREATE UNIQUE INDEX EDTOOL.PERIOD_ANSWERS_PK ON EDTOOL.PERIOD_ANSWERS
(PERIOD_ASWER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.PERIOD_ANSWERS ADD (
  CONSTRAINT PERIOD_ANSWERS_PK
  PRIMARY KEY
  (PERIOD_ASWER_ID)
  USING INDEX EDTOOL.PERIOD_ANSWERS_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.PERIOD_COURSES CASCADE CONSTRAINTS PURGE;

--
-- PERIOD_COURSES  (Table) 
--
--   Row Count: 6
CREATE TABLE EDTOOL.PERIOD_COURSES
(
  ID             NUMBER,
  COURSE_STATUS  NUMBER                         NOT NULL,
  START_DATE     DATE                           NOT NULL,
  END_DATE       DATE                           NOT NULL,
  GEN_COURSE_ID  NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- COURSES_PK  (Index) 
--
--  Dependencies: 
--   PERIOD_COURSES (Table)
--
CREATE UNIQUE INDEX EDTOOL.COURSES_PK ON EDTOOL.PERIOD_COURSES
(ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.PERIOD_COURSES ADD (
  CONSTRAINT COURSES_PK
  PRIMARY KEY
  (ID)
  USING INDEX EDTOOL.COURSES_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.PINMENU CASCADE CONSTRAINTS PURGE;

--
-- PINMENU  (Table) 
--
--   Row Count: 10
CREATE TABLE EDTOOL.PINMENU
(
  FORM             VARCHAR2(300 CHAR),
  PIN              VARCHAR2(30 CHAR),
  LEKT             VARCHAR2(60 CHAR),
  PIN3             NUMBER,
  TAB_LEKT         VARCHAR2(50 CHAR),
  VIEW_TAB         VARCHAR2(1 CHAR),
  SEIRA_EMFANISIS  NUMBER(2),
  JSP_SYSX         VARCHAR2(50 CHAR)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- PINMENU_PK  (Index) 
--
--  Dependencies: 
--   PINMENU (Table)
--
CREATE UNIQUE INDEX EDTOOL.PINMENU_PK ON EDTOOL.PINMENU
(PIN3)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.PINMENU ADD (
  CONSTRAINT PINMENU_PK
  PRIMARY KEY
  (PIN3)
  USING INDEX EDTOOL.PINMENU_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.PINMENU_DETAIL CASCADE CONSTRAINTS PURGE;

--
-- PINMENU_DETAIL  (Table) 
--
--  Dependencies: 
--   PINMENU (Table)
--
--   Row Count: 8
CREATE TABLE EDTOOL.PINMENU_DETAIL
(
  ID        NUMBER,
  ID_KATHG  NUMBER,
  DESCR     VARCHAR2(50 CHAR),
  JSP       VARCHAR2(255 CHAR)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- PINMENU_DETAIL_PK  (Index) 
--
--  Dependencies: 
--   PINMENU_DETAIL (Table)
--
CREATE UNIQUE INDEX EDTOOL.PINMENU_DETAIL_PK ON EDTOOL.PINMENU_DETAIL
(ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.PINMENU_DETAIL ADD (
  CONSTRAINT PINMENU_DETAIL_PK
  PRIMARY KEY
  (ID)
  USING INDEX EDTOOL.PINMENU_DETAIL_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.PIN_KATHG CASCADE CONSTRAINTS PURGE;

--
-- PIN_KATHG  (Table) 
--
--   Row Count: 7
CREATE TABLE EDTOOL.PIN_KATHG
(
  ID   NUMBER,
  KAT  NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON COLUMN EDTOOL.PIN_KATHG.ID IS 'αρίθμηση (FK ID_KATHG στον πίνακα PINMENU_DETAIL)';

COMMENT ON COLUMN EDTOOL.PIN_KATHG.KAT IS 'κατηγορίες (ρόλος στην εφαρμογή)';


--
-- PIN_KATHG_PK  (Index) 
--
--  Dependencies: 
--   PIN_KATHG (Table)
--
CREATE UNIQUE INDEX EDTOOL.PIN_KATHG_PK ON EDTOOL.PIN_KATHG
(ID, KAT)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.PIN_KATHG ADD (
  CONSTRAINT PIN_KATHG_PK
  PRIMARY KEY
  (ID, KAT)
  USING INDEX EDTOOL.PIN_KATHG_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.QUEST_SL_TEMP_EXPLAIN1 CASCADE CONSTRAINTS PURGE;

--
-- QUEST_SL_TEMP_EXPLAIN1  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE EDTOOL.QUEST_SL_TEMP_EXPLAIN1
(
  STATEMENT_ID       VARCHAR2(30 BYTE),
  PLAN_ID            NUMBER,
  TIMESTAMP          DATE,
  REMARKS            VARCHAR2(4000 BYTE),
  OPERATION          VARCHAR2(30 BYTE),
  OPTIONS            VARCHAR2(255 BYTE),
  OBJECT_NODE        VARCHAR2(128 BYTE),
  OBJECT_OWNER       VARCHAR2(30 BYTE),
  OBJECT_NAME        VARCHAR2(30 BYTE),
  OBJECT_ALIAS       VARCHAR2(65 BYTE),
  OBJECT_INSTANCE    INTEGER,
  OBJECT_TYPE        VARCHAR2(30 BYTE),
  OPTIMIZER          VARCHAR2(255 BYTE),
  SEARCH_COLUMNS     NUMBER,
  ID                 INTEGER,
  PARENT_ID          INTEGER,
  DEPTH              INTEGER,
  POSITION           INTEGER,
  COST               INTEGER,
  CARDINALITY        INTEGER,
  BYTES              INTEGER,
  OTHER_TAG          VARCHAR2(255 BYTE),
  PARTITION_START    VARCHAR2(255 BYTE),
  PARTITION_STOP     VARCHAR2(255 BYTE),
  PARTITION_ID       INTEGER,
  OTHER              LONG,
  OTHER_XML          CLOB,
  DISTRIBUTION       VARCHAR2(30 BYTE),
  CPU_COST           INTEGER,
  IO_COST            INTEGER,
  TEMP_SPACE         INTEGER,
  ACCESS_PREDICATES  VARCHAR2(4000 BYTE),
  FILTER_PREDICATES  VARCHAR2(4000 BYTE),
  PROJECTION         VARCHAR2(4000 BYTE),
  TIME               NUMBER(20,2),
  QBLOCK_NAME        VARCHAR2(30 BYTE)
)
ON COMMIT PRESERVE ROWS;


DROP TABLE EDTOOL.ROLES CASCADE CONSTRAINTS PURGE;

--
-- ROLES  (Table) 
--
--   Row Count: 3
CREATE TABLE EDTOOL.ROLES
(
  TYPE_ID    NUMBER(3),
  DESC_TYPE  VARCHAR2(50 BYTE)                  NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- ROLES_PK  (Index) 
--
--  Dependencies: 
--   ROLES (Table)
--
CREATE UNIQUE INDEX EDTOOL.ROLES_PK ON EDTOOL.ROLES
(TYPE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.ROLES ADD (
  CONSTRAINT ROLES_PK
  PRIMARY KEY
  (TYPE_ID)
  USING INDEX EDTOOL.ROLES_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.STATUSES CASCADE CONSTRAINTS PURGE;

--
-- STATUSES  (Table) 
--
--   Row Count: 2
CREATE TABLE EDTOOL.STATUSES
(
  ID           NUMBER,
  DESC_STATUS  VARCHAR2(30 BYTE)                NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- STATUSES_PK  (Index) 
--
--  Dependencies: 
--   STATUSES (Table)
--
CREATE UNIQUE INDEX EDTOOL.STATUSES_PK ON EDTOOL.STATUSES
(ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.STATUSES ADD (
  CONSTRAINT STATUSES_PK
  PRIMARY KEY
  (ID)
  USING INDEX EDTOOL.STATUSES_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.TOAD_PLAN_TABLE CASCADE CONSTRAINTS PURGE;

--
-- TOAD_PLAN_TABLE  (Table) 
--
--   Row Count: 0
CREATE TABLE EDTOOL.TOAD_PLAN_TABLE
(
  STATEMENT_ID       VARCHAR2(30 BYTE),
  PLAN_ID            NUMBER,
  TIMESTAMP          DATE,
  REMARKS            VARCHAR2(4000 BYTE),
  OPERATION          VARCHAR2(30 BYTE),
  OPTIONS            VARCHAR2(255 BYTE),
  OBJECT_NODE        VARCHAR2(128 BYTE),
  OBJECT_OWNER       VARCHAR2(30 BYTE),
  OBJECT_NAME        VARCHAR2(30 BYTE),
  OBJECT_ALIAS       VARCHAR2(65 BYTE),
  OBJECT_INSTANCE    INTEGER,
  OBJECT_TYPE        VARCHAR2(30 BYTE),
  OPTIMIZER          VARCHAR2(255 BYTE),
  SEARCH_COLUMNS     NUMBER,
  ID                 INTEGER,
  PARENT_ID          INTEGER,
  DEPTH              INTEGER,
  POSITION           INTEGER,
  COST               INTEGER,
  CARDINALITY        INTEGER,
  BYTES              INTEGER,
  OTHER_TAG          VARCHAR2(255 BYTE),
  PARTITION_START    VARCHAR2(255 BYTE),
  PARTITION_STOP     VARCHAR2(255 BYTE),
  PARTITION_ID       INTEGER,
  OTHER              LONG,
  DISTRIBUTION       VARCHAR2(30 BYTE),
  CPU_COST           INTEGER,
  IO_COST            INTEGER,
  TEMP_SPACE         INTEGER,
  ACCESS_PREDICATES  VARCHAR2(4000 BYTE),
  FILTER_PREDICATES  VARCHAR2(4000 BYTE),
  PROJECTION         VARCHAR2(4000 BYTE),
  TIME               INTEGER,
  QBLOCK_NAME        VARCHAR2(30 BYTE),
  OTHER_XML          CLOB
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


DROP TABLE EDTOOL.USERS CASCADE CONSTRAINTS PURGE;

--
-- USERS  (Table) 
--
--  Dependencies: 
--   ROLES (Table)
--   STATUSES (Table)
--   GENTERS (Table)
--
--   Row Count: 63
CREATE TABLE EDTOOL.USERS
(
  USER_ID         NUMBER(10),
  FIRST_NAME      VARCHAR2(50 BYTE)             NOT NULL,
  LAST_NAME       VARCHAR2(50 BYTE)             NOT NULL,
  EMAIL           VARCHAR2(30 BYTE),
  PHONE_NUMBER    VARCHAR2(20 BYTE),
  BIRTH_DATE      DATE,
  GENDER_ID       NUMBER                        NOT NULL,
  STREET_ADDRESS  VARCHAR2(100 BYTE),
  CITY            VARCHAR2(30 BYTE),
  STATE           VARCHAR2(2 BYTE),
  ZIP_CODE        VARCHAR2(10 BYTE),
  USER_NAME       VARCHAR2(50 BYTE)             NOT NULL,
  USER_PASSWORD   VARCHAR2(50 BYTE)             NOT NULL,
  USER_ROLE       NUMBER(2)                     NOT NULL,
  USER_STATUS     NUMBER(2)                     NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- USERS_PK  (Index) 
--
--  Dependencies: 
--   USERS (Table)
--
CREATE UNIQUE INDEX EDTOOL.USERS_PK ON EDTOOL.USERS
(USER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.USERS ADD (
  CONSTRAINT USERS_PK
  PRIMARY KEY
  (USER_ID)
  USING INDEX EDTOOL.USERS_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.USERS_COURSES CASCADE CONSTRAINTS PURGE;

--
-- USERS_COURSES  (Table) 
--
--   Row Count: 64
CREATE TABLE EDTOOL.USERS_COURSES
(
  USER_ID    NUMBER,
  COURSE_ID  NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- USERS_COURSES_PK  (Index) 
--
--  Dependencies: 
--   USERS_COURSES (Table)
--
CREATE UNIQUE INDEX EDTOOL.USERS_COURSES_PK ON EDTOOL.USERS_COURSES
(USER_ID, COURSE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.USERS_COURSES ADD (
  CONSTRAINT USERS_COURSES_PK
  PRIMARY KEY
  (USER_ID, COURSE_ID)
  USING INDEX EDTOOL.USERS_COURSES_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.USERS_IN_A_LESSON CASCADE CONSTRAINTS PURGE;

--
-- USERS_IN_A_LESSON  (Table) 
--
--   Row Count: 0
CREATE TABLE EDTOOL.USERS_IN_A_LESSON
(
  USER_ID    NUMBER,
  LESSON_ID  NUMBER,
  DATE_IN    DATE,
  DATE_OUT   DATE,
  ID         NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- USERS_IN_A_LESSON_PK  (Index) 
--
--  Dependencies: 
--   USERS_IN_A_LESSON (Table)
--
CREATE UNIQUE INDEX EDTOOL.USERS_IN_A_LESSON_PK ON EDTOOL.USERS_IN_A_LESSON
(ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- COURSE_ID_USER_COURSES_IDX  (Index) 
--
--  Dependencies: 
--   USERS_COURSES (Table)
--
CREATE INDEX EDTOOL.COURSE_ID_USER_COURSES_IDX ON EDTOOL.USERS_COURSES
(COURSE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- COUSER_STATUS_I  (Index) 
--
--  Dependencies: 
--   PERIOD_COURSES (Table)
--
CREATE INDEX EDTOOL.COUSER_STATUS_I ON EDTOOL.PERIOD_COURSES
(COURSE_STATUS)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- GENTER_IDX  (Index) 
--
--  Dependencies: 
--   USERS (Table)
--
CREATE INDEX EDTOOL.GENTER_IDX ON EDTOOL.USERS
(GENDER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- PERIOD_COURSE_GEN_COURSE_IDX  (Index) 
--
--  Dependencies: 
--   PERIOD_COURSES (Table)
--
CREATE INDEX EDTOOL.PERIOD_COURSE_GEN_COURSE_IDX ON EDTOOL.PERIOD_COURSES
(GEN_COURSE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- ROLE_I  (Index) 
--
--  Dependencies: 
--   USERS (Table)
--
CREATE INDEX EDTOOL.ROLE_I ON EDTOOL.USERS
(USER_ROLE)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- USER_USER_STATUS_IDX  (Index) 
--
--  Dependencies: 
--   USERS (Table)
--
CREATE INDEX EDTOOL.USER_USER_STATUS_IDX ON EDTOOL.USERS
(USER_STATUS)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

DROP PACKAGE EDTOOL.PG_ALLLESSONS;

--
-- PG_ALLLESSONS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_AllLessons  AS
function gUser_IdL(f_User_Id NUMBER) return varchar2;
function gUser_RoleL(f_User_Role NUMBER) return varchar2;
function gUser_StatusL(f_User_Status NUMBER) return varchar2;
function gGenter_IdL(f_Genter_Id NUMBER) return varchar2;
function gCourses_IdL(f_Courses_Id NUMBER) return varchar2;
function gChapter_IdL(f_Chapter_Id NUMBER) return varchar2;
function gLesson_IdL(f_Lesson_Id NUMBER) return varchar2;
function gAnswer_IdL(f_Answer_Id NUMBER) return varchar2;
END;
/


DROP PACKAGE EDTOOL.PG_ANSWERS;

--
-- PG_ANSWERS  (Package) 
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_Answers  AS
END;
/


DROP PACKAGE EDTOOL.PG_CHAPTERS;

--
-- PG_CHAPTERS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_Chapters  AS
function gCourse_IdL(f_Course_Id NUMBER) return varchar2;
END;
/


DROP PACKAGE EDTOOL.PG_COURSES;

--
-- PG_COURSES  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_Courses  AS
function gCourse_StatusL(f_Course_Status NUMBER) return varchar2;
END;
/


DROP PACKAGE EDTOOL.PG_DAYS;

--
-- PG_DAYS  (Package) 
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_Days  AS
END;
/


DROP PACKAGE EDTOOL.PG_LESSONS;

--
-- PG_LESSONS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_Lessons  AS
function gChapter_IdL(f_Chapter_Id NUMBER) return varchar2;
END;
/


DROP PACKAGE EDTOOL.PG_LESSONSANSWERS;

--
-- PG_LESSONSANSWERS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_LessonsAnswers  AS
function gLesson_IdL(f_Lesson_Id NUMBER) return varchar2;
function gUser_IdL(f_User_Id NUMBER) return varchar2;
function gAnswer_IdL(f_Answer_Id NUMBER) return varchar2;
END;
/


DROP PACKAGE EDTOOL.PG_USERCOURSES;

--
-- PG_USERCOURSES  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_UserCourses  AS
function gUser_IdL(f_User_Id NUMBER) return varchar2;
function gCourse_IdL(f_Course_Id NUMBER) return varchar2;
END;
/


DROP PACKAGE EDTOOL.PG_USERS;

--
-- PG_USERS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE EDTOOL.PG_Users  AS
function gGender_IdL(f_Gender_Id NUMBER) return varchar2;
function gUser_RoleL(f_User_Role NUMBER) return varchar2;
function gUser_StatusL(f_User_Status NUMBER) return varchar2;
END;
/


DROP PACKAGE BODY EDTOOL.PG_ANSWERS;

--
-- PG_ANSWERS  (Package Body) 
--
--  Dependencies: 
--   PG_ANSWERS (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_Answers  AS
END;
/


DROP PACKAGE BODY EDTOOL.PG_COURSES;

--
-- PG_COURSES  (Package Body) 
--
--  Dependencies: 
--   PG_COURSES (Package)
--   STATUSES (Table)
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_Courses  AS
 function gCourse_StatusL(f_Course_Status NUMBER) return varchar2 is 
 cursor c1 is SELECT DESC_STATUS  LEKT_D FROM EDTOOL.STATUSES WHERE 1 = 1 and ID = f_Course_Status;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
END;
/


DROP PACKAGE BODY EDTOOL.PG_DAYS;

--
-- PG_DAYS  (Package Body) 
--
--  Dependencies: 
--   PG_DAYS (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_Days  AS
END;
/


DROP PACKAGE BODY EDTOOL.PG_USERS;

--
-- PG_USERS  (Package Body) 
--
--  Dependencies: 
--   PG_USERS (Package)
--   GENTERS (Table)
--   ROLES (Table)
--   STATUSES (Table)
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_Users  AS
 function gGender_IdL(f_Gender_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESCR_GENTER  LEKT_D FROM EDTOOL.GENTERS WHERE 1 = 1 and ID = f_Gender_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gUser_RoleL(f_User_Role NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESC_TYPE  LEKT_D FROM EDTOOL.ROLES WHERE 1 = 1 and TYPE_ID = f_User_Role;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gUser_StatusL(f_User_Status NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESC_STATUS  LEKT_D FROM EDTOOL.STATUSES WHERE 1 = 1 and ID = f_User_Status;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
END;
/


DROP FUNCTION EDTOOL.FP_SQ_FOR_ALL_IDS;

--
-- FP_SQ_FOR_ALL_IDS  (Function) 
--
--  Dependencies: 
--   SQ_FOR_ALL_IDS (Sequence)
--   DUAL (Synonym)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.fp_SQ_FOR_ALL_IDS return varchar2 is   DUMMY number; begin select  SQ_FOR_ALL_IDS.nextval  into dummy from dual;  return to_char(dummy); end;
/


DROP FUNCTION EDTOOL.F_FIND_PERIOD_ASWER_ID;

--
-- F_FIND_PERIOD_ASWER_ID  (Function) 
--
--  Dependencies: 
--   PERIOD_ANSWERS (Table)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.F_FIND_PERIOD_ASWER_ID (P_LESSON_ID NUMBER) RETURN NUMBER
IS 
CURSOR C1 IS SELECT B.PERIOD_ASWER_ID FROM PERIOD_ANSWERS  B
WHERE B.LESSON_ID = P_LESSON_ID AND END_PER_ANSWER IS NULL;

DUMMY NUMBER;
BEGIN
         FOR C1_REC IN C1 LOOP
         DUMMY := C1_REC.PERIOD_ASWER_ID;
         END LOOP;
         RETURN(DUMMY);
END;
/


DROP FUNCTION EDTOOL.F_FIND_START_END_ANSWERS;

--
-- F_FIND_START_END_ANSWERS  (Function) 
--
--  Dependencies: 
--   PERIOD_ANSWERS (Table)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.F_FIND_START_END_ANSWERS (P_LESSON_ID   NUMBER)
    RETURN VARCHAR2
IS
    TMPVAR              VARCHAR2(10);
    PSTART_PER_ANSWER   DATE;
    PEND_PER_ANSWER     DATE;

    CURSOR C1 IS
        SELECT *
          FROM PERIOD_ANSWERS B
         WHERE B.PERIOD_ASWER_ID IN (SELECT MAX (PERIOD_ASWER_ID)
                                       FROM PERIOD_ANSWERS A
                                      WHERE A.LESSON_ID = P_LESSON_ID);
BEGIN
    FOR C1_REC IN C1
    LOOP
        PSTART_PER_ANSWER := C1_REC.START_PER_ANSWER;
        PEND_PER_ANSWER := C1_REC.END_PER_ANSWER;
    END LOOP;

    
        IF PSTART_PER_ANSWER IS NULL
        THEN
            TMPVAR := '1';
        ELSE
            TMPVAR := '0';
        END IF;
   
        IF PEND_PER_ANSWER IS NULL
        THEN
            TMPVAR := TMPVAR|| '1';
        ELSE
            TMPVAR := TMPVAR||'0';
        END IF;
   
    RETURN TMPVAR;
END F_FIND_START_END_ANSWERS;
/


DROP FUNCTION EDTOOL.GET_ANSWER;

--
-- GET_ANSWER  (Function) 
--
--  Dependencies: 
--   ANSWERS (Table)
--   DUAL (Synonym)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE function EDTOOL.get_answer(p_ANSWER_ID number) return varchar2
is 
dummy varchar2(50);
cursor c1 is 
select * from (
select * from answers 
union
select 99, 'ΔΕΝ ΑΠΑΝΤΗΣΑΝ' from dual) where ID = p_ANSWER_ID;
begin 
for c1_rec in c1 loop
  dummy := c1_rec.DESCR_ANSWER;
end loop;

return(dummy);
end;
/


DROP FUNCTION EDTOOL.MAKE_USERS;

--
-- MAKE_USERS  (Function) 
--
--  Dependencies: 
--   ALL_TABLES (Synonym)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.make_users return varchar2 is

cursor c1 is
SELECT 
'INSERT INTO users (USER_ID,' ||
' FIRST_NAME,' ||
' LAST_NAME,' ||
' GENDER_ID,'||
' USER_NAME,'|| 
' USER_PASSWORD,'||
' USER_ROLE,'||
' USER_STATUS)'||
' VALUES ('||ROWNUM*100||','||
 ''''|| 'FIRST_NAME_MA'|| ROWNUM||'''' ||','||
''''||  'LAST_NAME' || ROWNUM ||'''' ||' ,'||
'1,'||
 ''''|| 'm'||ROWNUM||''''||','||
 '1,'||
 '1,'||
 '1'||


 ' );' ||' insert into users_courses ( USER_ID, COURSE_ID) values ('||ROWNUM*100||',1) ;' txt
 
 from all_tables WHERE ROWNUM < 16;
 
 begin
 
 null;
 end;
/


DROP FUNCTION EDTOOL.RANDOM_STRING;

--
-- RANDOM_STRING  (Function) 
--
--  Dependencies: 
--   DBMS_RANDOM (Synonym)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.random_string return varchar2 is

        pwd varchar2(8);

   begin

        loop

            pwd:=dbms_random.string('a',2)||dbms_random.string('p',6);
            
            exit when regexp_instr(pwd,'[a-z]')>0  -- at least one lower case letter
                  
                  and regexp_instr(pwd,'[A-Z]')>0  -- at least one upper case letter
                 
                 and regexp_instr(pwd,'[0-9]')>0  -- at least one number

                 and ( instr(pwd,'$')>0 or instr(pwd,'#')>0) -- at least one spcecial char in a list

                 and instr(pwd,'O')=0 -- not O (o)

                 and instr(pwd,'L')=0 -- not L (l)

                 and instr(pwd,'I')=0 -- not I (i)
   
                 and instr(pwd,'I')=0 -- not I (i)

                 and instr(pwd,0)=0  -- not 0 (zero)
                  and instr(pwd,8)=0  -- not 8 ()
                 
                 
                 -----   exceptions from oracle  for password             @  ,  .` \ ~ * / % ' " ^ & ! = + ? : 
      
              and instr(pwd,'@')=0 -- not I (@)

               and instr(pwd,',')=0 -- not I (,)

               and instr(pwd,'.')=0 -- not I (.)

               and instr(pwd,'`')=0 -- not I (`)

               and instr(pwd,'\')=0 -- not I (\)

               and instr(pwd,'~')=0 -- not I (~)

               and instr(pwd,'*')=0 -- not I (*)

               and instr(pwd,'/')=0 -- not I (/)

               and instr(pwd,'%')=0 -- not I (%)

               and instr(pwd,'''')=0 -- not I (')

               and instr(pwd,'"')=0 -- not I (")

               and instr(pwd,'^')=0 -- not I (^)

               and instr(pwd,'&')=0 -- not I (&)

               and instr(pwd,'!')=0 -- not I (!)

               and instr(pwd,'+')=0 -- not I (+)
               
                and instr(pwd,'?')=0 -- not I (?)
               
               and instr(pwd,'-')=0 -- not I (-)
              --OTHER
               and instr(pwd,' ')=0 -- not I ( )
               and instr(pwd,':')=0  -- not I (:)
                and instr(pwd,';')=0  -- not I (:)
               and instr(pwd,'_')=0 -- not I (_)
                and instr(pwd,'>')=0-- not I (>)
                 and instr(pwd,'=')=0 -- not I (=)
                 
                  and instr(pwd,'[')=0-- not I ([)
                 and instr(pwd,']')=0 -- not I (])
                  and instr(pwd,'{')=0-- not I ({)
                 and instr(pwd,'}')=0 -- not I (})
                  and instr(pwd,'(')=0-- not I (()
                 and instr(pwd,')')=0 -- not I ())
                 
                and instr(pwd,'<')=0 ;-- not I (<)
               
               
              
   
   
   
   
      end loop;
      
       return pwd;

   end;
/


DROP VIEW EDTOOL.COURSES;

--
-- COURSES  (View) 
--
--  Dependencies: 
--   GEN_COURSES (Table)
--   PERIOD_COURSES (Table)
--   PG_COURSES (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.COURSES
(ID, COURSE_DESCR, COURSE_STATUS, COURSE_STATUSD, START_DATE, 
 END_DATE, GEN_COURSE_ID)
AS 
SELECT Id,
          (SELECT COURSE_DESR COURSE_DESCR
             FROM GEN_COURSES
            WHERE COURSE_ID = GEN_COURSE_ID)
             COURSE_DESCR,
          Course_Status,
          PG_Courses.gCourse_StatusL (Course_Status) Course_StatusD,
          START_DATE, END_DATE,
          GEN_COURSE_ID
          
     FROM PERIOD_COURSES;


DROP VIEW EDTOOL.VW_ANSWERS;

--
-- VW_ANSWERS  (View) 
--
--  Dependencies: 
--   ANSWERS (Table)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_ANSWERS
(ID, DESCR_ANSWER)
AS 
SELECT ID, DESCR_ANSWER
      FROM ANSWERS B;


DROP VIEW EDTOOL.VW_COURSES;

--
-- VW_COURSES  (View) 
--
--  Dependencies: 
--   COURSES (View)
--   PG_COURSES (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_COURSES
(ID, COURSE_DESCR, COURSE_STATUS, COURSE_STATUSD)
AS 
select Id,Course_Descr,Course_Status,PG_Courses.gCourse_StatusL(Course_Status) Course_StatusD FROM COURSES;


DROP VIEW EDTOOL.VW_DAYS;

--
-- VW_DAYS  (View) 
--
--  Dependencies: 
--   "BIN$73i5l+HHS+Kbl1zuzz18qw==$0" (Table)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_DAYS
(ID, DESCRIPTION_NAME)
AS 
select Id,Description_Name FROM DAYS;


DROP VIEW EDTOOL.VW_USERS;

--
-- VW_USERS  (View) 
--
--  Dependencies: 
--   PG_USERS (Package)
--   USERS (Table)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_USERS
(USER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, 
 BIRTH_DATE, BIRTH_DATED, GENDER_ID, GENDER_IDD, STREET_ADDRESS, 
 CITY, STATE, ZIP_CODE, USER_NAME, USER_PASSWORD, 
 USER_ROLE, USER_ROLED, USER_STATUS, USER_STATUSD)
AS 
select User_Id,First_Name,Last_Name,Email,Phone_Number,Birth_Date, TO_CHAR(Birth_Date,'DD/MM/YYYY') Birth_DateD,Gender_Id,PG_Users.gGender_IdL(Gender_Id) Gender_IdD,Street_Address,City,State,Zip_Code,User_Name,User_Password,User_Role,PG_Users.gUser_RoleL(User_Role) User_RoleD,User_Status,PG_Users.gUser_StatusL(User_Status) User_StatusD FROM USERS;


DROP VIEW EDTOOL.VW_USERS_COURSES;

--
-- VW_USERS_COURSES  (View) 
--
--  Dependencies: 
--   PG_USERCOURSES (Package)
--   USERS_COURSES (Table)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_USERS_COURSES
(USER_ID, USER_IDD, COURSE_ID, COURSE_IDD)
AS 
select User_Id,PG_UserCourses.gUser_IdL(User_Id) User_IdD,Course_Id,PG_UserCourses.gCourse_IdL(Course_Id) Course_IdD FROM USERS_COURSES;


DROP TABLE EDTOOL.GEN_CHAPTERS CASCADE CONSTRAINTS PURGE;

--
-- GEN_CHAPTERS  (Table) 
--
--  Dependencies: 
--   GEN_COURSES (Table)
--
--   Row Count: 6
CREATE TABLE EDTOOL.GEN_CHAPTERS
(
  CHAPTER_ID     NUMBER                         NOT NULL,
  CHAPTER_DESCR  VARCHAR2(50 BYTE)              NOT NULL,
  COURSE_ID      NUMBER                         NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- GEN_CHAPTERS_PK  (Index) 
--
--  Dependencies: 
--   GEN_CHAPTERS (Table)
--
CREATE UNIQUE INDEX EDTOOL.GEN_CHAPTERS_PK ON EDTOOL.GEN_CHAPTERS
(CHAPTER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.GEN_CHAPTERS ADD (
  CONSTRAINT GEN_CHAPTERS_PK
  PRIMARY KEY
  (CHAPTER_ID)
  USING INDEX EDTOOL.GEN_CHAPTERS_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.GEN_LESSONS CASCADE CONSTRAINTS PURGE;

--
-- GEN_LESSONS  (Table) 
--
--  Dependencies: 
--   GEN_CHAPTERS (Table)
--
--   Row Count: 6
CREATE TABLE EDTOOL.GEN_LESSONS
(
  LESSON_ID     NUMBER                          NOT NULL,
  LESSON_DESCR  VARCHAR2(50 BYTE)               NOT NULL,
  CHAPTER_ID    NUMBER                          NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- GEN_LESSONS_PK  (Index) 
--
--  Dependencies: 
--   GEN_LESSONS (Table)
--
CREATE UNIQUE INDEX EDTOOL.GEN_LESSONS_PK ON EDTOOL.GEN_LESSONS
(LESSON_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.GEN_LESSONS ADD (
  CONSTRAINT GEN_LESSONS_PK
  PRIMARY KEY
  (LESSON_ID)
  USING INDEX EDTOOL.GEN_LESSONS_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.PERIOD_CHAPTERS CASCADE CONSTRAINTS PURGE;

--
-- PERIOD_CHAPTERS  (Table) 
--
--  Dependencies: 
--   PERIOD_COURSES (Table)
--
--   Row Count: 18
CREATE TABLE EDTOOL.PERIOD_CHAPTERS
(
  CHAPTER_ID      NUMBER,
  COURSE_ID       NUMBER                        NOT NULL,
  GEN_CHAPTER_ID  NUMBER
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- CHAPTERS_PK  (Index) 
--
--  Dependencies: 
--   PERIOD_CHAPTERS (Table)
--
CREATE UNIQUE INDEX EDTOOL.CHAPTERS_PK ON EDTOOL.PERIOD_CHAPTERS
(CHAPTER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.PERIOD_CHAPTERS ADD (
  CONSTRAINT CHAPTERS_PK
  PRIMARY KEY
  (CHAPTER_ID)
  USING INDEX EDTOOL.CHAPTERS_PK
  ENABLE VALIDATE);



DROP TABLE EDTOOL.PERIOD_LESSONS CASCADE CONSTRAINTS PURGE;

--
-- PERIOD_LESSONS  (Table) 
--
--  Dependencies: 
--   PERIOD_CHAPTERS (Table)
--   GEN_LESSONS (Table)
--
--   Row Count: 15
CREATE TABLE EDTOOL.PERIOD_LESSONS
(
  LESSON_ID       NUMBER,
  CHAPTER_ID      NUMBER                        NOT NULL,
  FR_LESSON_DATE  DATE                          NOT NULL,
  TO_LESSON_DATE  DATE                          NOT NULL,
  GEN_LESSON_ID   NUMBER,
  START_LESSON    DATE,
  END_LESSON      DATE
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- LESSONS_PK  (Index) 
--
--  Dependencies: 
--   PERIOD_LESSONS (Table)
--
CREATE UNIQUE INDEX EDTOOL.LESSONS_PK ON EDTOOL.PERIOD_LESSONS
(LESSON_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.PERIOD_LESSONS ADD (
  CONSTRAINT LESSONS_PK
  PRIMARY KEY
  (LESSON_ID)
  USING INDEX EDTOOL.LESSONS_PK
  ENABLE VALIDATE);



--
-- FR_TO_IDX  (Index) 
--
--  Dependencies: 
--   PERIOD_LESSONS (Table)
--
CREATE INDEX EDTOOL.FR_TO_IDX ON EDTOOL.PERIOD_LESSONS
(FR_LESSON_DATE, TO_LESSON_DATE)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- GEN_CHAP_COURS_ID_IDX  (Index) 
--
--  Dependencies: 
--   GEN_CHAPTERS (Table)
--
CREATE INDEX EDTOOL.GEN_CHAP_COURS_ID_IDX ON EDTOOL.GEN_CHAPTERS
(COURSE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- GEN_LESSON_ID_IDX  (Index) 
--
--  Dependencies: 
--   PERIOD_LESSONS (Table)
--
CREATE INDEX EDTOOL.GEN_LESSON_ID_IDX ON EDTOOL.PERIOD_LESSONS
(GEN_LESSON_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- GEN_LESS_CHAPTER_ID_IDX  (Index) 
--
--  Dependencies: 
--   GEN_LESSONS (Table)
--
CREATE INDEX EDTOOL.GEN_LESS_CHAPTER_ID_IDX ON EDTOOL.GEN_LESSONS
(CHAPTER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- PERIOD_CHAPTER_COURSE_ID_IDX  (Index) 
--
--  Dependencies: 
--   PERIOD_CHAPTERS (Table)
--
CREATE INDEX EDTOOL.PERIOD_CHAPTER_COURSE_ID_IDX ON EDTOOL.PERIOD_CHAPTERS
(COURSE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- PERIOD_LESSON_CHAPER_ID_IDX  (Index) 
--
--  Dependencies: 
--   PERIOD_LESSONS (Table)
--
CREATE INDEX EDTOOL.PERIOD_LESSON_CHAPER_ID_IDX ON EDTOOL.PERIOD_LESSONS
(CHAPTER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- START_LESSON_IDX  (Index) 
--
--  Dependencies: 
--   PERIOD_LESSONS (Table)
--
CREATE INDEX EDTOOL.START_LESSON_IDX ON EDTOOL.PERIOD_LESSONS
(START_LESSON)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

DROP PACKAGE BODY EDTOOL.PG_CHAPTERS;

--
-- PG_CHAPTERS  (Package Body) 
--
--  Dependencies: 
--   PG_CHAPTERS (Package)
--   COURSES (View)
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_Chapters  AS
 function gCourse_IdL(f_Course_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  COURSE_DESCR  LEKT_D FROM EDTOOL.COURSES WHERE 1 = 1 and ID = f_Course_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
END;
/


DROP PACKAGE BODY EDTOOL.PG_USERCOURSES;

--
-- PG_USERCOURSES  (Package Body) 
--
--  Dependencies: 
--   PG_USERCOURSES (Package)
--   COURSES (View)
--   VW_USERS (View)
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_UserCourses  AS
 function gUser_IdL(f_User_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  FIRST_NAME||' '||LAST_NAME||'( '|| USER_NAME||')'   LEKT_D FROM VW_USERS WHERE 1=1 and USER_ID = f_User_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gCourse_IdL(f_Course_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  COURSE_DESCR  LEKT_D FROM EDTOOL.COURSES WHERE 1 = 1 and ID = f_Course_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
END;
/


DROP FUNCTION EDTOOL.F_FIND_COUSE_ID;

--
-- F_FIND_COUSE_ID  (Function) 
--
--  Dependencies: 
--   PERIOD_CHAPTERS (Table)
--   PERIOD_LESSONS (Table)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.F_FIND_COUSE_ID (P_LESSON_ID NUMBER) RETURN NUMBER
IS 
CURSOR C1 IS SELECT A.COURSE_ID FROM PERIOD_CHAPTERS A,PERIOD_LESSONS  B
WHERE A.CHAPTER_ID = B.CHAPTER_ID AND B.LESSON_ID = P_LESSON_ID;

DUMMY NUMBER;
BEGIN
         FOR C1_REC IN C1 LOOP
         DUMMY := C1_REC.COURSE_ID;
         END LOOP;
         RETURN(DUMMY);
END;
/


DROP VIEW EDTOOL.CHAPTERS;

--
-- CHAPTERS  (View) 
--
--  Dependencies: 
--   GEN_CHAPTERS (Table)
--   PERIOD_CHAPTERS (Table)
--   PG_CHAPTERS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.CHAPTERS
(CHAPTER_ID, CHAPTER_DESCR, COURSE_ID, COURSE_IDD, GEN_CHAPTER_ID)
AS 
SELECT Chapter_Id,
          (SELECT    CHAPTER_DESCR    FROM GEN_CHAPTERS A  WHERE  CHAPTER_ID =  GEN_CHAPTER_ID ) Chapter_Descr,
          Course_Id,
          PG_Chapters.gCourse_IdL (Course_Id) Course_IdD,
          GEN_CHAPTER_ID
     FROM PERIOD_CHAPTERS;


DROP VIEW EDTOOL.LESSONS;

--
-- LESSONS  (View) 
--
--  Dependencies: 
--   GEN_LESSONS (Table)
--   PERIOD_LESSONS (Table)
--   PG_LESSONS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.LESSONS
(LESSON_ID, LESSON_DESCR, CHAPTER_ID, CHAPTER_IDD, FR_LESSON_DATE, 
 FR_LESSON_DATED, TO_LESSON_DATE, TO_LESSON_DATED, GEN_LESSON_ID, START_LESSON, 
 START_LESSOND, END_LESSON, END_LESSOND, START_TIMED, END_TIMED)
AS 
SELECT Lesson_Id,
          (SELECT LESSON_DESCR
             FROM GEN_LESSONS
            WHERE LESSON_ID = GEN_LESSON_ID)
             Lesson_Descr,
          Chapter_Id,
          PG_Lessons.gChapter_IdL (Chapter_Id) Chapter_IdD,
          Fr_Lesson_Date,
          TO_CHAR (Fr_Lesson_Date, 'DD/MM/YYYY HH24:MI') Fr_Lesson_DateD,
          To_Lesson_Date,
          TO_CHAR (To_Lesson_Date, 'DD/MM/YYYY HH24:MI') To_Lesson_DateD,
          GEN_LESSON_ID,
          START_LESSON,
         TO_CHAR (START_LESSON, 'DD/MM/YYYY HH24:MI') START_LESSOND,
          END_LESSON,
          
          TO_CHAR (END_LESSON, 'DD/MM/YYYY HH24:MI') END_LESSOND,
          
           TO_CHAR (START_LESSON, 'HH24.MI') START_timeD,
         TO_CHAR (END_LESSON, 'HH24.MI') END_timeD
     FROM PERIOD_LESSONS;


DROP VIEW EDTOOL.VW_CHAPTERS;

--
-- VW_CHAPTERS  (View) 
--
--  Dependencies: 
--   CHAPTERS (View)
--   PG_CHAPTERS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_CHAPTERS
(CHAPTER_ID, CHAPTER_DESCR, COURSE_ID, COURSE_IDD)
AS 
select Chapter_Id,Chapter_Descr,Course_Id,PG_Chapters.gCourse_IdL(Course_Id) Course_IdD FROM CHAPTERS;


DROP VIEW EDTOOL.VW_LESSONS;

--
-- VW_LESSONS  (View) 
--
--  Dependencies: 
--   LESSONS (View)
--   PG_LESSONS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_LESSONS
(LESSON_ID, LESSON_DESCR, CHAPTER_ID, CHAPTER_IDD, FR_LESSON_DATE, 
 FR_LESSON_DATED, TO_LESSON_DATE, TO_LESSON_DATED)
AS 
select Lesson_Id,Lesson_Descr,Chapter_Id,PG_Lessons.gChapter_IdL(Chapter_Id) Chapter_IdD,Fr_Lesson_Date, TO_CHAR(Fr_Lesson_Date,'DD/MM/YYYY HH24:MI') Fr_Lesson_DateD,To_Lesson_Date, TO_CHAR(To_Lesson_Date,'DD/MM/YYYY HH24:MI') To_Lesson_DateD FROM LESSONS;


DROP VIEW EDTOOL.VW_LESSONS_STAT;

--
-- VW_LESSONS_STAT  (View) 
--
--  Dependencies: 
--   GEN_CHAPTERS (Table)
--   GEN_COURSES (Table)
--   GEN_LESSONS (Table)
--   PERIOD_CHAPTERS (Table)
--   PERIOD_COURSES (Table)
--   PERIOD_LESSONS (Table)
--   USERS (Table)
--   USERS_COURSES (Table)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_LESSONS_STAT
(GEN_COURSE_ID, COURSE_DESR, GEN_CHAPTER_ID, CHAPTER_DESCR, GEN_LESSON_ID, 
 LESSON_DESCR, COURSE_ID, CHAPTER_ID, LESSON_ID, USER_ID, 
 USER_ROLE, FR_LESSON_DATE, TO_LESSON_DATE, START_LESSON, END_LESSON, 
 USER_STATUS, START_STATUS, END_STATUS)
AS 
SELECT pc.GEN_COURSE_ID,
           GC.COURSE_DESR,
           pch.GEN_CHAPTER_ID,
           GCH.CHAPTER_DESCR,
           pl.GEN_LESSON_ID,
           GL.LESSON_DESCR,
           uc.COURSE_ID,
           pch.CHAPTER_ID,
           pl.LESSON_ID,
           uc.USER_ID,
           u.USER_ROLE,
           pl.FR_LESSON_DATE,
           pl.TO_LESSON_DATE,
           pl.START_LESSON,
           pl.END_LESSON,
           u.USER_STATUS,
           DECODE (START_LESSON, NULL, 1, 0)     START_STATUS,
           DECODE (END_LESSON, NULL, 1, 0)       END_STATUS
      FROM users            u,
           users_courses    uc,
           GEN_COURSES      GC,
           GEN_CHAPTERS     GCH,
           GEN_LESSONS      GL,
           PERIOD_COURSES   pc,
           period_chapters  pch,
           period_lessons   pl
     WHERE     u.USER_ID = uc.user_id
           AND pc.ID = uc.COURSE_ID
           AND GC.COURSE_ID = GCH.COURSE_ID
           AND GCH.CHAPTER_ID = GL.CHAPTER_ID
           AND GL.LESSON_ID = pl.GEN_LESSON_ID
           AND pc.ID = uc.COURSE_ID
           AND pc.ID = pch.COURSE_ID
           AND pl.CHAPTER_ID = pch.CHAPTER_ID;


DROP TABLE EDTOOL.LESSONS_ANSWERS CASCADE CONSTRAINTS PURGE;

--
-- LESSONS_ANSWERS  (Table) 
--
--  Dependencies: 
--   PERIOD_LESSONS (Table)
--   USERS (Table)
--   ANSWERS (Table)
--   PERIOD_ANSWERS (Table)
--
--   Row Count: 119
CREATE TABLE EDTOOL.LESSONS_ANSWERS
(
  ID_LES_ANS       NUMBER,
  LESSON_ID        NUMBER                       NOT NULL,
  USER_ID          NUMBER                       NOT NULL,
  ANSWER_ID        NUMBER                       NOT NULL,
  ANSWER_DATE      DATE,
  PERIOD_ASWER_ID  NUMBER                       NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- LESSONS_ANSWERS_PK  (Index) 
--
--  Dependencies: 
--   LESSONS_ANSWERS (Table)
--
CREATE UNIQUE INDEX EDTOOL.LESSONS_ANSWERS_PK ON EDTOOL.LESSONS_ANSWERS
(ID_LES_ANS)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CHECK ("ANSWER_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CHECK ("ANSWER_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CHECK ("ANSWER_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CHECK ("ANSWER_DATE" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CONSTRAINT LESSONS_ANSWERS_PK
  PRIMARY KEY
  (ID_LES_ANS)
  USING INDEX EDTOOL.LESSONS_ANSWERS_PK
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CONSTRAINT LESSONS_ANSWERS_U01
  UNIQUE (LESSON_ID, USER_ID)
  DISABLE NOVALIDATE);



--
-- LES_ANS_LESSON_ID_IDX  (Index) 
--
--  Dependencies: 
--   LESSONS_ANSWERS (Table)
--
CREATE INDEX EDTOOL.LES_ANS_LESSON_ID_IDX ON EDTOOL.LESSONS_ANSWERS
(LESSON_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- USER_ID_LESSON_ANSWERS_IDX  (Index) 
--
--  Dependencies: 
--   LESSONS_ANSWERS (Table)
--
CREATE INDEX EDTOOL.USER_ID_LESSON_ANSWERS_IDX ON EDTOOL.LESSONS_ANSWERS
(USER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

DROP PACKAGE BODY EDTOOL.PG_LESSONS;

--
-- PG_LESSONS  (Package Body) 
--
--  Dependencies: 
--   PG_LESSONS (Package)
--   VW_CHAPTERS (View)
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_Lessons  AS
 function gChapter_IdL(f_Chapter_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  CHAPTER_DESCR||' ('||COURSE_IDD||')'  LEKT_D FROM EDTOOL.VW_CHAPTERS WHERE 1 = 1 and CHAPTER_ID = f_Chapter_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
END;
/


DROP FUNCTION EDTOOL.CRT_TR_STAT_AA;

--
-- CRT_TR_STAT_AA  (Function) 
--
--  Dependencies: 
--   ANSWERS (Table)
--   LESSONS_ANSWERS (Table)
--   PERIOD_ANSWERS (Table)
--   PERIOD_LESSONS (Table)
--   USERS (Table)
--   VW_ANSWERS (View)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.CRT_TR_STAT_AA (P_LESSON_ID   NUMBER,
                                                  TP            NUMBER)
    RETURN VARCHAR2
IS
    DUMMY   VARCHAR2 (32767);
    TM      VARCHAR2 (10);
    CN      NUMBER := 8;

    CURSOR C1 IS
          SELECT ID, '<th>' || UPPER (DESCR_ANSWER) || '</th>' TH
            FROM VW_ANSWERS
        ORDER BY ID;

    CURSOR C2 (P_LESSON_ID NUMBER, P_ANSWER_ID NUMBER)
    IS
          SELECT COUNT (*) cnt, a.ANSWER_ID, c.DESCR_ANSWER
            FROM LESSONS_ANSWERS a,
                 users          b,
                 answers        c,
                 PERIOD_LESSONS d
           WHERE     a.LESSON_ID = P_LESSON_ID
                 AND a.LESSON_ID = d.LESSON_ID
                 AND a.ANSWER_ID = p_ANSWER_ID
                 AND a.USER_ID = b.USER_ID
                 AND a.ANSWER_ID = c.ID
                 AND b.USER_ROLE <> 1
                 AND PERIOD_ASWER_ID IN
                         (SELECT PERIOD_ASWER_ID
                            FROM PERIOD_ANSWERS A1, PERIOD_LESSONS B1
                           WHERE     A1.LESSON_ID = B1.LESSON_ID
                                 AND A1.LESSON_ID = P_LESSON_ID
                                 AND START_PER_ANSWER BETWEEN START_LESSON
                                                          AND NVL (
                                                                  END_LESSON,
                                                                  START_PER_ANSWER))
        GROUP BY ANSWER_ID, DESCR_ANSWER;



    CURSOR C4 IS
          SELECT ID, '''' || UPPER (DESCR_ANSWER) || '''' TH
            FROM VW_ANSWERS
        ORDER BY ID;
BEGIN
    IF TP = '1'                                                      -- HEADER
    THEN
        FOR C1_REC IN C1
        LOOP
            DUMMY := DUMMY || C1_REC.TH;
        END LOOP;
    ELSIF TP = '2'                                                    -- STATS
    THEN
        FOR C1_REC IN C1
        LOOP
            FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
            LOOP
                TM := TO_CHAR (C2_REC.CNT);
            END LOOP;

            DUMMY := DUMMY || '<TD>' || TM || '</TD>';
            TM := NULL;
        END LOOP;
    ELSIF TP = '3'                                                   -- HEADER
    THEN
        FOR C1_REC IN C1
        LOOP
            CN := CN + 1;
        END LOOP;

        DUMMY := TO_CHAR (CN);
    ELSIF TP = '4'                                                   -- PLOT X
    THEN
        FOR C4_REC IN C4
        LOOP
            DUMMY := DUMMY || ',' || C4_REC.TH;
        END LOOP;

        DUMMY := SUBSTR (DUMMY, 2, LENGTH (DUMMY));
        DUMMY := '[' || DUMMY || ']';
    ELSIF TP = '5'                                                  -- PLOT  Y
    THEN
        FOR C1_REC IN C1
        LOOP
            FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
            LOOP
                TM := TO_CHAR (C2_REC.CNT);
            END LOOP;

            DUMMY := DUMMY || ',' || NVL (TM, 0);
            TM := NULL;
        END LOOP;

        DUMMY := SUBSTR (DUMMY, 2, LENGTH (DUMMY));
        DUMMY := '[' || DUMMY || ']';
    END IF;

    RETURN (DUMMY);
END;
/


DROP FUNCTION EDTOOL.CRT_TR_STAT_AX;

--
-- CRT_TR_STAT_AX  (Function) 
--
--  Dependencies: 
--   ANSWERS (Table)
--   LESSONS_ANSWERS (Table)
--   PERIOD_LESSONS (Table)
--   USERS (Table)
--   VW_ANSWERS (View)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.CRT_TR_STAT_AX (P_LESSON_ID NUMBER, TP NUMBER)
   RETURN VARCHAR2
IS
   DUMMY   VARCHAR2 (32767);
   TM      VARCHAR2 (10);
   CN      NUMBER := 8;

   CURSOR C1
   IS
        SELECT ID, '<th>' || UPPER (DESCR_ANSWER) || '</th>' TH
          FROM VW_ANSWERS
      ORDER BY ID;

   CURSOR C2 (
      P_LESSON_ID    NUMBER,
      P_ANSWER_ID    NUMBER)
   IS
        SELECT COUNT (*) cnt, a.ANSWER_ID, c.DESCR_ANSWER
          FROM LESSONS_ANSWERS a, users b,answers c, PERIOD_LESSONS d
         WHERE     a.LESSON_ID = P_LESSON_ID
               and a.LESSON_ID = d.LESSON_ID
               AND a.ANSWER_ID = p_ANSWER_ID
               and a.USER_ID = b.USER_ID
               and a.ANSWER_ID = c.ID
               and b.USER_ROLE <>1
               AND ANSWER_DATE  not BETWEEN  START_LESSON AND NVL(END_LESSON,SYSDATE)
      GROUP BY ANSWER_ID, DESCR_ANSWER;

   CURSOR C4
   IS
        SELECT ID, '''' || UPPER (DESCR_ANSWER) || '''' TH
          FROM VW_ANSWERS
      ORDER BY ID;
      
      
      
      
BEGIN
   IF TP = '1'                                                       -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         DUMMY := DUMMY || C1_REC.TH;
      END LOOP;
   ELSIF TP = '2'                                                     -- STATS
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            TM := TO_CHAR (C2_REC.CNT);
         END LOOP;

         DUMMY := DUMMY || '<td>' || TM || '</td>';
         TM := NULL;
      END LOOP;
   ELSIF TP = '3'                                                    -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         CN := CN + 1;
      END LOOP;

      DUMMY := TO_CHAR (CN);
   ELSIF TP = '4'                                                    -- plot x
   THEN
      FOR C4_REC IN C4
      LOOP
         DUMMY := DUMMY || ',' || C4_REC.TH;
      END LOOP;

      DUMMY := SUBSTR (DUMMY, 2, LENGTH (DUMMY));
      DUMMY := '[' || DUMMY || ']';
   ELSIF TP = '5'                                                   -- plot  y
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            TM := TO_CHAR (C2_REC.CNT);
         END LOOP;

         DUMMY := DUMMY || ',' || NVL (TM, 0);
         TM := NULL;
      END LOOP;

      DUMMY := SUBSTR (DUMMY, 2, LENGTH (DUMMY));
      DUMMY := '[' || DUMMY || ']';
   
    
   
   END IF;

   RETURN (DUMMY);
END;
/


DROP FUNCTION EDTOOL.CRT_TR_STAT_LA;

--
-- CRT_TR_STAT_LA  (Function) 
--
--  Dependencies: 
--   ANSWERS (Table)
--   LESSONS_ANSWERS (Table)
--   PERIOD_ANSWERS (Table)
--   PERIOD_LESSONS (Table)
--   USERS (Table)
--   VW_ANSWERS (View)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.CRT_TR_STAT_LA (P_LESSON_ID NUMBER, TP NUMBER)
   RETURN VARCHAR2
IS
   DUMMY   VARCHAR2 (32767);
   tm      VARCHAR2 (10);
   cn      NUMBER := 8;

   CURSOR C1
   IS
        SELECT ID, '<th>' || UPPER (DESCR_ANSWER) || '</th>' TH
          FROM VW_ANSWERS
      ORDER BY ID;

   CURSOR C2 (
      P_LESSON_ID    NUMBER,
      p_answer_id    NUMBER)
   IS
        SELECT COUNT (*) cnt, a.ANSWER_ID, c.DESCR_ANSWER
          FROM LESSONS_ANSWERS a, users b,answers c
         WHERE     a.LESSON_ID = P_LESSON_ID
               AND a.ANSWER_ID = p_ANSWER_ID
               and a.USER_ID = b.USER_ID
               and a.ANSWER_ID = c.ID
               and b.USER_ROLE <>1
               and a.PERIOD_ASWER_ID in (
               SELECT max(PERIOD_ASWER_ID)
  FROM PERIOD_ANSWERS A1, PERIOD_LESSONS B1
 WHERE     A1.LESSON_ID = B1.LESSON_ID
       AND A1.LESSON_ID = P_LESSON_ID
       AND START_PER_ANSWER  BETWEEN START_LESSON AND NVL(END_LESSON,START_PER_ANSWER))
        GROUP BY ANSWER_ID, DESCR_ANSWER;

   CURSOR C4
   IS
        SELECT ID, '''' || UPPER (DESCR_ANSWER) || '''' TH
          FROM VW_ANSWERS
      ORDER BY ID;
      
      
      
      
BEGIN
   IF TP = '1'                                                       -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         DUMMY := DUMMY || C1_REC.TH;
      END LOOP;
   ELSIF TP = '2'                                                     -- STATS
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C2_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || '<td>' || tm || '</td>';
         tm := NULL;
      END LOOP;
   ELSIF TP = '3'                                                    -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         cn := cn + 1;
      END LOOP;

      dummy := TO_CHAR (cn);
   ELSIF TP = '4'                                                    -- plot x
   THEN
      FOR C4_REC IN C4
      LOOP
         DUMMY := DUMMY || ',' || C4_REC.TH;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   ELSIF TP = '5'                                                   -- plot  y
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C2_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || ',' || NVL (tm, 0);
         tm := NULL;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
    
   
   
   END IF;

   RETURN (DUMMY);
END;
/


DROP VIEW EDTOOL.ALL_LESSONS_STAT;

--
-- ALL_LESSONS_STAT  (View) 
--
--  Dependencies: 
--   GET_ANSWER (Function)
--   LESSONS_ANSWERS (Table)
--   PG_ALLLESSONS (Package)
--   USERS (Table)
--   USERS_COURSES (Table)
--   VW_LESSONS_STAT (View)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.ALL_LESSONS_STAT
(RN, COURSE_DESR, GEN_CHAPTER_ID, CHAPTER_DESCR, GEN_LESSON_ID, 
 LESSON_DESCR, USER_IDD, USER_ROLE, USER_STATUS, USER_ROLED, 
 GEN_COURSE_ID, COURSE_ID, CHAPTER_ID, LESSON_ID, USER_ID, 
 FR_LESSON_DATE, TO_LESSON_DATE, START_LESSON, END_LESSON, START_STATUS, 
 END_STATUS, TOT_USERS, ID_LES_ANS, ANSWER_ID, DESCR_ANSWER, 
 ANSWER_DATE, USER_STATUSD, COURSES_IDD, CHAPTER_IDD, LESSON_IDD, 
 FR_LESSON_DATED, TO_LESSON_DATED, ANSWER_IDD)
AS 
SELECT ROWNUM                                            rn,
           a.COURSE_DESR,
           a.GEN_CHAPTER_ID,
           a.CHAPTER_DESCR,
           a.GEN_LESSON_ID,
           a.LESSON_DESCR,
           PG_AllLessons.gUser_IdL (a.User_Id)               User_IdD,
           a.USER_ROLE,
           a.user_status,
           PG_AllLessons.gUser_RoleL (a.User_Role)           User_RoleD,
           a.GEN_COURSE_ID,
           a.COURSE_ID,
           a.CHAPTER_ID,
           a.LESSON_ID,
           a.USER_ID,
           a.FR_LESSON_DATE,
           a.TO_LESSON_DATE,
           NVL (a.START_LESSON, SYSDATE)                     START_LESSON,
           a.END_LESSON,
           a.START_STATUS,
           a.END_STATUS,
           (SELECT COUNT (*)
              FROM USERS_COURSES K, USERS L
             WHERE     L.USER_ID = K.USER_ID
                   AND L.USER_ROLE = 2
                   AND K.COURSE_ID = a.GEN_COURSE_ID)        TOT_USERS,
           ID_LES_ANS,
           NVL (ANSWER_ID, 99)                               ANSWER_ID,
           get_answer (NVL (ANSWER_ID, 99))                  DESCR_ANSWER,
           NVL (ANSWER_DATE, SYSDATE)                        ANSWER_DATE,
           PG_AllLessons.gUser_StatusL (a.User_Status)       User_StatusD,
           PG_AllLessons.gCourses_IdL (GEN_COURSE_ID)        Courses_IdD,
           PG_AllLessons.gChapter_IdL (GEN_CHAPTER_ID)       Chapter_IdD,
           PG_AllLessons.gLesson_IdL (GEN_LESSON_ID)         Lesson_IdD,
           TO_CHAR (Fr_Lesson_Date, 'DD/MM/YYYY HH24:MI')    Fr_Lesson_DateD,
           TO_CHAR (To_Lesson_Date, 'DD/MM/YYYY HH24:MI')    To_Lesson_DateD,
           PG_AllLessons.gAnswer_IdL (Answer_Id)             Answer_IdD
      FROM vw_lessons_stat a, lessons_answers la
     WHERE a.user_id = la.USER_ID AND a.LESSON_ID = la.LESSON_ID
--AND a.lesson_id = 13
;


DROP VIEW EDTOOL.VW_ALL_ANSWERS_FOR_STAT;

--
-- VW_ALL_ANSWERS_FOR_STAT  (View) 
--
--  Dependencies: 
--   GEN_CHAPTERS (Table)
--   GEN_COURSES (Table)
--   GEN_LESSONS (Table)
--   LESSONS_ANSWERS (Table)
--   PERIOD_CHAPTERS (Table)
--   PERIOD_COURSES (Table)
--   PERIOD_LESSONS (Table)
--   USERS (Table)
--   USERS_COURSES (Table)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_ALL_ANSWERS_FOR_STAT
(GEN_COURSE_ID, COURSE_DESR, GEN_CHAPTER_ID, CHAPTER_DESCR, GEN_LESSON_ID, 
 LESSON_DESCR, CURR_COURSE_ID, COURSE_START_DATE, COURSE_END_DATE, COURSE_STATUS, 
 CURR_CHAPTER_ID, CURR_LESSON_ID, TOT_USERS, USER_ROLE, FR_LESSON_DATE, 
 TO_LESSON_DATE, START_LESSON, END_LESSON, ID_LES_ANS, USER_ID, 
 ANSWER_ID, ANSWER_DATE, ANSWER_TIME)
AS 
SELECT c.COURSE_ID gen_COURSE_ID,
          c.COURSE_DESR,
          d.CHAPTER_ID gen_CHAPTER_ID,
          d.CHAPTER_DESCR,
          e.LESSON_ID gen_LESSON_ID,
          e.LESSON_DESCR,
          A2.ID curr_course_id,
          A2.START_DATE COURSE_START_DATE,
          A2.END_DATE COURSE_END_DATE,
          A2.COURSE_STATUS,
          a.CHAPTER_ID curr_CHAPTER_ID,
          a.LESSON_ID curr_LESSON_ID,
          (SELECT COUNT (*)
             FROM USERS_COURSES K, USERS L
            WHERE     L.USER_ID = K.USER_ID
                  AND L.USER_ROLE = 2
                  AND K.COURSE_ID = A2.ID)
             TOT_USERS,
          (SELECT L.USER_ROLE
             FROM USERS L
            WHERE L.USER_ID = b.USER_ID)
             USER_ROLE,
          a.FR_LESSON_DATE,
          a.TO_LESSON_DATE,
          a.START_LESSON,
          a.END_LESSON,
          b.ID_LES_ANS,
          b.USER_ID,
          b.ANSWER_ID,
          b.ANSWER_DATE,
          TO_CHAR(b.ANSWER_DATE,'HH24.MI')ANSWER_TIME
     FROM PERIOD_LESSONS a,
          LESSONS_ANSWERS b,
          GEN_COURSES c,
          GEN_CHAPTERS d,
          GEN_LESSONS e,
          PERIOD_CHAPTERS a1,
          PERIOD_COURSES a2
    WHERE     A.LESSON_ID = B.LESSON_ID
          AND A.CHAPTER_ID = A1.CHAPTER_ID
          AND A1.COURSE_ID = A2.ID
          AND E.LESSON_ID = A.GEN_LESSON_ID
          AND D.CHAPTER_ID = E.CHAPTER_ID
          AND C.COURSE_ID = D.COURSE_ID
--     AND B.ANSWER_DATE BETWEEN start_lesson AND end_lesson
;


DROP VIEW EDTOOL.VW_LESSONS_ANSWERS;

--
-- VW_LESSONS_ANSWERS  (View) 
--
--  Dependencies: 
--   LESSONS_ANSWERS (Table)
--   PG_LESSONSANSWERS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_LESSONS_ANSWERS
(ID_LES_ANS, LESSON_ID, LESSON_IDD, USER_ID, USER_IDD, 
 ANSWER_ID, ANSWER_IDD, ANSWER_DATE, ANSWER_DATED)
AS 
SELECT Id_Les_Ans,
          Lesson_Id,
          PG_LessonsAnswers.gLesson_IdL (Lesson_Id) Lesson_IdD,
          User_Id,
          PG_LessonsAnswers.gUser_IdL (User_Id) User_IdD,
          Answer_Id,
          PG_LessonsAnswers.gAnswer_IdL (Answer_Id) Answer_IdD,
          Answer_Date,
          TO_CHAR (Answer_Date, 'DD/MM/YYYY hh24:mi:ss') Answer_DateD
     FROM LESSONS_ANSWERS;


--
-- INS_INTO_LESSON_ANSWERS_99  (Trigger) 
--
--  Dependencies: 
--   PERIOD_ANSWERS (Table)
--   F_FIND_COUSE_ID (Function)
--   LESSONS_ANSWERS (Table)
--   SQ_FOR_ALL_IDS (Sequence)
--   USERS (Table)
--   USERS_COURSES (Table)
--   DBMS_STANDARD (Package)
--   STANDARD (Package)
--
CREATE OR REPLACE TRIGGER EDTOOL.INS_INTO_LESSON_ANSWERS_99
    BEFORE UPDATE OF END_PER_ANSWER
    ON EDTOOL.PERIOD_ANSWERS
    
    REFERENCING NEW AS New OLD AS Old
    FOR EACH ROW
BEGIN
    DECLARE
    BEGIN
        IF UPDATING AND :old.END_PER_ANSWER IS NULL and :new.END_PER_ANSWER is not null
        THEN
            NULL;

            INSERT INTO lessons_answers (ID_LES_ANS,
                                         LESSON_ID,
                                         USER_ID,
                                         ANSWER_ID,
                                         ANSWER_DATE,PERIOD_ASWER_ID)
                SELECT SQ_FOR_ALL_IDS.NEXTVAL,
                       :old.lesson_id,
                       A.user_id,
                       0,
                       :new.END_PER_ANSWER,:NEW.PERIOD_ASWER_ID
                  FROM users_courses a,USERS B
                 WHERE     A.COURSE_ID = F_FIND_COUSE_ID (:old.lesson_id)
                           AND a.USER_ID = B.USER_ID AND USER_ROLE = 2
                       AND NOT EXISTS
                               (SELECT 0
                                  FROM lessons_answers c
                                 WHERE     lesson_id = :old.lesson_id AND C.ANSWER_DATE BETWEEN :NEW.START_PER_ANSWER AND :NEW.END_PER_ANSWER
                                       AND a.user_id = c.user_id );
        END IF;
    EXCEPTION
        WHEN OTHERS
        THEN
            -- Consider logging the error and then re-raise
            RAISE;
    END;
END ins_into_lesson_answers_99;
/


DROP FUNCTION EDTOOL.CRT_TR_STAT_TIME;

--
-- CRT_TR_STAT_TIME  (Function) 
--
--  Dependencies: 
--   ALL_LESSONS_STAT (View)
--   ANSWERS (Table)
--   LESSONS_ANSWERS (Table)
--   PERIOD_LESSONS (Table)
--   USERS (Table)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.CRT_TR_STAT_time (P_LESSON_ID NUMBER, TP NUMBER)
   RETURN VARCHAR2
IS
   DUMMY   VARCHAR2 (32767);
   tm      VARCHAR2 (10);
   cn      NUMBER := 8;

   CURSOR C1
   IS
        SELECT ANSWER_ID ID, '<th>' || TO_CHAR(ANSWER_DATE,'HH24:MI:SS')|| '</th>' TH
          FROM ALL_LESSONS_STAT a, users b
          WHERE     a.LESSON_ID = P_LESSON_ID
          AND a.USER_ID = B.USER_ID
           and b.USER_ROLE <>1
          AND ANSWER_DATE  BETWEEN  START_LESSON AND NVL(END_LESSON,SYSDATE)
          
      ORDER BY ID;

   CURSOR C2 (
      P_LESSON_ID    NUMBER,
      p_answer_id    NUMBER)
   IS
       SELECT a.ANSWER_ID cnt, TO_CHAR(ANSWER_DATE,'rrrr-mm-dd HH24:MI:SS')  TTIME, a.ANSWER_ID, c.DESCR_ANSWER
          FROM LESSONS_ANSWERS a, users b,answers c, PERIOD_LESSONS d
         WHERE     a.LESSON_ID = P_LESSON_ID
               and a.LESSON_ID = d.LESSON_ID
               AND a.ANSWER_ID = p_ANSWER_ID
               and a.USER_ID = b.USER_ID
               and a.ANSWER_ID = c.ID
               and b.USER_ROLE <>1
               AND ANSWER_DATE  BETWEEN  START_LESSON AND NVL(END_LESSON,SYSDATE)
               ORDER BY a.ID_LES_ANS;
      

   CURSOR C4
   IS
        SELECT answer_id ID, '''' || TO_CHAR(ANSWER_DATE,'rrrr-mm-dd HH24:MI:SS') || '''' TH
          FROM LESSONS_ANSWERS a, users b,answers c, PERIOD_LESSONS d
         WHERE     a.LESSON_ID = P_LESSON_ID
               and a.LESSON_ID = d.LESSON_ID
           
               and a.USER_ID = b.USER_ID
               and a.ANSWER_ID = c.ID
               and b.USER_ROLE <>1
               AND ANSWER_DATE  BETWEEN  START_LESSON AND NVL(END_LESSON,SYSDATE);
      
           
      
BEGIN
   IF TP = '1'                                                       -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         DUMMY := DUMMY || C1_REC.TH;
      END LOOP;
   ELSIF TP = '2'                                                     -- STATS
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C2_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || '<td>' || tm || '</td>';
         tm := NULL;
      END LOOP;
   ELSIF TP = '3'                                                    -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         cn := cn + 1;
      END LOOP;

      dummy := TO_CHAR (cn);
   ELSIF TP = '4'                                                    -- plot x
   THEN
      FOR C4_REC IN C4
      LOOP
         DUMMY := DUMMY || ',' || C4_REC.TH;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   ELSIF TP = '5'                                                   -- plot  y
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C2_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || ',' || NVL (tm, 0);
         tm := NULL;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   
   
   END IF;

   RETURN (DUMMY);
END;
/


DROP VIEW EDTOOL.ALL_LESSONS;

--
-- ALL_LESSONS  (View) 
--
--  Dependencies: 
--   CHAPTERS (View)
--   COURSES (View)
--   GENTERS (Table)
--   GEN_LESSONS (Table)
--   LESSONS (View)
--   PG_CHAPTERS (Package)
--   PG_COURSES (Package)
--   PG_LESSONS (Package)
--   PG_LESSONSANSWERS (Package)
--   ROLES (Table)
--   STATUSES (Table)
--   USERS (Table)
--   USERS_COURSES (Table)
--   VW_LESSONS_ANSWERS (View)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.ALL_LESSONS
(RN, USER_ID, USER_ROLE, USER_STATUS, GENTER_ID, 
 COURSES_ID, CHAPTER_ID, LESSON_ID, GEN_COURSE_ID, GEN_CHAPTER_ID, 
 GEN_LESSON_ID, LESSON_DESCR, FR_LESSON_DATE, TO_LESSON_DATE, TOT_USERS, 
 ID_LES_ANS, ANSWER_ID, START_STATUS, END_STATUS, START_TIMED, 
 END_TIMED)
AS 
SELECT ROWNUM RN,
            USERS.USER_ID,
            USERS.USER_ROLE,
            USERS.USER_STATUS,
            GENTERS.ID GENTER_ID,
            COURSES.ID COURSES_ID,
            LESSONS.CHAPTER_ID,
            LESSONS.LESSON_ID,
            COURSES.GEN_COURSE_ID,
            (SELECT CHAPTER_ID
               FROM GEN_LESSONS
              WHERE LESSONS.GEN_LESSON_ID = LESSON_ID)
               GEN_CHAPTER_ID,
            LESSONS.GEN_LESSON_ID,
            LESSONS.LESSON_DESCR,
            LESSONS.FR_LESSON_DATE,
            LESSONS.TO_LESSON_DATE,
            (SELECT COUNT (*)
               FROM USERS_COURSES K, USERS L
              WHERE     L.USER_ID = K.USER_ID
                    AND L.USER_ROLE = 2
                    AND K.COURSE_ID = COURSES.ID)
               TOT_USERS,
            (SELECT ID_LES_ANS
               FROM VW_LESSONS_ANSWERS X
              WHERE     ANSWER_DATE IN
                           (SELECT MAX (ANSWER_DATE)
                              FROM VW_LESSONS_ANSWERS C
                             WHERE     C.LESSON_ID = LESSONS.LESSON_ID
                                   AND C.USER_ID = USERS.USER_ID)
                    AND X.LESSON_ID = LESSONS.LESSON_ID
                    AND X.USER_ID = USERS.USER_ID)
               ID_LES_ANS,
            (SELECT ANSWER_ID
               FROM VW_LESSONS_ANSWERS X
              WHERE     ANSWER_DATE IN
                           (SELECT MAX (ANSWER_DATE)
                              FROM VW_LESSONS_ANSWERS C
                             WHERE     C.LESSON_ID = LESSONS.LESSON_ID
                                   AND C.USER_ID = USERS.USER_ID)
                    AND X.LESSON_ID = LESSONS.LESSON_ID
                    AND X.USER_ID = USERS.USER_ID)
               ANSWER_ID,
                DECODE( START_LESSON,NULL,1,0)  START_STATUS,
                DECODE( END_LESSON,NULL,1,0)  END_STATUS,
                START_TIMED,
                END_TIMED
       FROM ROLES
            INNER JOIN USERS
               ON (ROLES.TYPE_ID = USERS.USER_ROLE)
            INNER JOIN STATUSES
               ON (STATUSES.ID = USERS.USER_STATUS)
            INNER JOIN COURSES
               ON (STATUSES.ID = COURSES.COURSE_STATUS)
            INNER JOIN USERS_COURSES
               ON (COURSES.ID = USERS_COURSES.COURSE_ID)
            INNER JOIN CHAPTERS
               ON (COURSES.ID = CHAPTERS.COURSE_ID)
            INNER JOIN LESSONS
               ON     (CHAPTERS.CHAPTER_ID = LESSONS.CHAPTER_ID)
                  AND (USERS.USER_ID = USERS_COURSES.USER_ID)
            INNER JOIN GENTERS
               ON (GENTERS.ID = USERS.GENDER_ID)
   ORDER BY FR_LESSON_DATE;


DROP VIEW EDTOOL.ALL_LESSONS_STATISTIC;

--
-- ALL_LESSONS_STATISTIC  (View) 
--
--  Dependencies: 
--   CRT_TR_STAT_AA (Function)
--   CRT_TR_STAT_AX (Function)
--   CRT_TR_STAT_LA (Function)
--   CRT_TR_STAT_TIME (Function)
--   GET_ANSWER (Function)
--   LESSONS_ANSWERS (Table)
--   PG_ALLLESSONS (Package)
--   USERS (Table)
--   USERS_COURSES (Table)
--   VW_LESSONS_STAT (View)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.ALL_LESSONS_STATISTIC
(RN, COURSE_DESR, GEN_CHAPTER_ID, CHAPTER_DESCR, GEN_LESSON_ID, 
 LESSON_DESCR, USER_IDD, USER_ROLE, USER_STATUS, USER_ROLED, 
 GEN_COURSE_ID, COURSE_ID, CHAPTER_ID, LESSON_ID, USER_ID, 
 FR_LESSON_DATE, TO_LESSON_DATE, START_LESSON, END_LESSON, START_STATUS, 
 END_STATUS, TOT_USERS, ID_LES_ANS, ANSWER_ID, DESCR_ANSWER, 
 ANSWER_DATE, USER_STATUSD, COURSES_IDD, CHAPTER_IDD, LESSON_IDD, 
 FR_LESSON_DATED, TO_LESSON_DATED, ANSWER_IDD, HD_STAT_AA, HD_STAT_DATA_AA, 
 COLSPAN_CN_AA, PLOT_X_AA, PLOT_Y_AA, HD_STAT_LA, HD_STAT_DATA_LA, 
 COLSPAN_CN_LA, PLOT_X_LA, PLOT_Y_LA, HD_STAT_AX, HD_STAT_DATA_AX, 
 COLSPAN_CN_AX, PLOT_X_AX, PLOT_Y_AX, HD_STAT_T, HD_STAT_DATA_T, 
 COLSPAN_CN_T, PLOT_X_T, PLOT_Y_T)
AS 
SELECT ROWNUM                                            rn,
           a.COURSE_DESR,
           a.GEN_CHAPTER_ID,
           a.CHAPTER_DESCR,
           a.GEN_LESSON_ID,
           a.LESSON_DESCR,
           PG_AllLessons.gUser_IdL (a.User_Id)               User_IdD,
           a.USER_ROLE,
           a.user_status,
           PG_AllLessons.gUser_RoleL (a.User_Role)           User_RoleD,
           a.GEN_COURSE_ID,
           a.COURSE_ID,
           a.CHAPTER_ID,
           a.LESSON_ID,
           a.USER_ID,
           a.FR_LESSON_DATE,
           a.TO_LESSON_DATE,
           a.START_LESSON,
           a.END_LESSON,
           a.START_STATUS,
           a.END_STATUS,
           (SELECT COUNT (*)
              FROM USERS_COURSES K, USERS L
             WHERE     L.USER_ID = K.USER_ID
                   AND L.USER_ROLE = 2
                   AND K.COURSE_ID = a.COURSE_ID)            TOT_USERS,
           ID_LES_ANS,
           NVL (ANSWER_ID, 0)                               ANSWER_ID,
           get_answer (NVL (ANSWER_ID, 0))                  DESCR_ANSWER,
           ANSWER_DATE,
           PG_AllLessons.gUser_StatusL (a.User_Status)       User_StatusD,
           PG_AllLessons.gCourses_IdL (GEN_COURSE_ID)        Courses_IdD,
           PG_AllLessons.gChapter_IdL (GEN_CHAPTER_ID)       Chapter_IdD,
           PG_AllLessons.gLesson_IdL (GEN_LESSON_ID)         Lesson_IdD,
           TO_CHAR (Fr_Lesson_Date, 'DD/MM/YYYY HH24:MI')    Fr_Lesson_DateD,
           TO_CHAR (To_Lesson_Date, 'DD/MM/YYYY HH24:MI')    To_Lesson_DateD,
           PG_AllLessons.gAnswer_IdL (la.Answer_Id)          Answer_IdD,
           CRT_TR_STAT_AA (a.LESSON_ID, 1)                   HD_STAT_AA,
           CRT_TR_STAT_AA (a.LESSON_ID, 2)                   HD_STAT_DATA_AA,
           CRT_TR_STAT_AA (a.LESSON_ID, 3)                   colspan_cn_AA,
           CRT_TR_STAT_AA (a.LESSON_ID, 4)                   plot_x_AA,
           CRT_TR_STAT_AA (a.LESSON_ID, 5)                   plot_y_AA,
           CRT_TR_STAT_LA (a.LESSON_ID, 1)                   HD_STAT_LA,
           CRT_TR_STAT_LA (a.LESSON_ID, 2)                   HD_STAT_DATA_LA,
           CRT_TR_STAT_LA (a.LESSON_ID, 3)                   colspan_cn_LA,
           CRT_TR_STAT_LA (a.LESSON_ID, 4)                   plot_x_LA,
           CRT_TR_STAT_LA (a.LESSON_ID, 5)                   plot_y_LA,
           CRT_TR_STAT_AX (a.LESSON_ID, 1)                   HD_STAT_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 2)                   HD_STAT_DATA_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 3)                   colspan_cn_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 4)                   plot_x_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 5)                   plot_y_AX,
           CRT_TR_STAT_TIME (a.LESSON_ID, 1) HD_STAT_T,
            CRT_TR_STAT_TIME (a.LESSON_ID, 2) HD_STAT_DATA_T,
            CRT_TR_STAT_TIME (a.LESSON_ID, 3) colspan_cn_T,
            CRT_TR_STAT_TIME (a.LESSON_ID, 4)  plot_x_T,
             CRT_TR_STAT_TIME (a.LESSON_ID, 5) plot_y_T
      FROM vw_lessons_stat a, lessons_answers la
     WHERE a.user_id = la.USER_ID(+) AND a.LESSON_ID = la.LESSON_ID(+)

--AND a.lesson_id = 13
;


DROP VIEW EDTOOL.ALL_LESSONS_STATISTIC_N;

--
-- ALL_LESSONS_STATISTIC_N  (View) 
--
--  Dependencies: 
--   CRT_TR_STAT_AA (Function)
--   CRT_TR_STAT_AX (Function)
--   CRT_TR_STAT_LA (Function)
--   CRT_TR_STAT_TIME (Function)
--   PG_ALLLESSONS (Package)
--   USERS (Table)
--   USERS_COURSES (Table)
--   VW_LESSONS_STAT (View)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.ALL_LESSONS_STATISTIC_N
(RN, COURSE_DESR, GEN_CHAPTER_ID, CHAPTER_DESCR, GEN_LESSON_ID, 
 LESSON_DESCR, USER_IDD, USER_ROLE, USER_STATUS, USER_ROLED, 
 GEN_COURSE_ID, COURSE_ID, CHAPTER_ID, LESSON_ID, USER_ID, 
 FR_LESSON_DATE, TO_LESSON_DATE, START_LESSON, END_LESSON, START_STATUS, 
 END_STATUS, TOT_USERS, USER_STATUSD, COURSES_IDD, CHAPTER_IDD, 
 LESSON_IDD, FR_LESSON_DATED, TO_LESSON_DATED, PLOT_X_AA, PLOT_Y_AA, 
 PLOT_X_LA, PLOT_Y_LA, HD_STAT_AX, HD_STAT_DATA_AX, COLSPAN_CN_AX, 
 PLOT_X_AX, PLOT_Y_AX, PLOT_X_T, PLOT_Y_T)
AS 
SELECT ROWNUM                                            rn,
           a.COURSE_DESR,
           a.GEN_CHAPTER_ID,
           a.CHAPTER_DESCR,
           a.GEN_LESSON_ID,
           a.LESSON_DESCR,
           PG_AllLessons.gUser_IdL (a.User_Id)               User_IdD,
           a.USER_ROLE,
           a.user_status,
           PG_AllLessons.gUser_RoleL (a.User_Role)           User_RoleD,
           a.GEN_COURSE_ID,
           a.COURSE_ID,
           a.CHAPTER_ID,
           a.LESSON_ID,
           a.USER_ID,
           a.FR_LESSON_DATE,
           a.TO_LESSON_DATE,
           a.START_LESSON,
           a.END_LESSON,
           a.START_STATUS,
           a.END_STATUS,
           (SELECT COUNT (*)
              FROM USERS_COURSES K, USERS L
             WHERE     L.USER_ID = K.USER_ID
                   AND L.USER_ROLE = 2
                   AND K.COURSE_ID = a.COURSE_ID)            TOT_USERS,
           PG_AllLessons.gUser_StatusL (a.User_Status)       User_StatusD,
           PG_AllLessons.gCourses_IdL (GEN_COURSE_ID)        Courses_IdD,
           PG_AllLessons.gChapter_IdL (GEN_CHAPTER_ID)       Chapter_IdD,
           PG_AllLessons.gLesson_IdL (GEN_LESSON_ID)         Lesson_IdD,
           TO_CHAR (Fr_Lesson_Date, 'DD/MM/YYYY HH24:MI')    Fr_Lesson_DateD,
           TO_CHAR (To_Lesson_Date, 'DD/MM/YYYY HH24:MI')    To_Lesson_DateD,
        -- --  CRT_TR_STAT_AA (a.LESSON_ID, 1)                   HD_STAT_AA,
        --   CRT_TR_STAT_AA (a.LESSON_ID, 2)                   HD_STAT_DATA_AA,
        --   CRT_TR_STAT_AA (a.LESSON_ID, 3)                   colspan_cn_AA,
           CRT_TR_STAT_AA (a.LESSON_ID, 4)                   plot_x_AA,
           CRT_TR_STAT_AA (a.LESSON_ID, 5)                   plot_y_AA,
        --   CRT_TR_STAT_LA (a.LESSON_ID, 1)                   HD_STAT_LA,
         --  CRT_TR_STAT_LA (a.LESSON_ID, 2)                   HD_STAT_DATA_LA,
         --  CRT_TR_STAT_LA (a.LESSON_ID, 3)                   colspan_cn_LA,
           CRT_TR_STAT_LA (a.LESSON_ID, 4)                   plot_x_LA,
           CRT_TR_STAT_LA (a.LESSON_ID, 5)                   plot_y_LA,
           CRT_TR_STAT_AX (a.LESSON_ID, 1)                   HD_STAT_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 2)                   HD_STAT_DATA_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 3)                   colspan_cn_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 4)                   plot_x_AX,
           CRT_TR_STAT_AX (a.LESSON_ID, 5)                   plot_y_AX,
        --   CRT_TR_STAT_TIME (a.LESSON_ID, 1)                 HD_STAT_T,
         --  CRT_TR_STAT_TIME (a.LESSON_ID, 2)                 HD_STAT_DATA_T,
         --  CRT_TR_STAT_TIME (a.LESSON_ID, 3)                 colspan_cn_T,
           CRT_TR_STAT_TIME (a.LESSON_ID, 4)                 plot_x_T,
           CRT_TR_STAT_TIME (a.LESSON_ID, 5)                 plot_y_T
      FROM vw_lessons_stat a

--AND a.lesson_id = 13
;


DROP VIEW EDTOOL.ANSWERS_STATISTICS;

--
-- ANSWERS_STATISTICS  (View) 
--
--  Dependencies: 
--   ALL_LESSONS (View)
--   ANSWERS (Table)
--   PG_CHAPTERS (Package)
--   PG_COURSES (Package)
--   PG_LESSONS (Package)
--   PG_LESSONSANSWERS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.ANSWERS_STATISTICS
(COURSES_ID, CHAPTER_ID, LESSON_ID, USER_ID, GEN_COURSE_ID, 
 GEN_CHAPTER_ID, GEN_LESSON_ID, ANSWER_ID, DESCR_ANSWER, TOT_USERS)
AS 
SELECT COURSES_ID,
            CHAPTER_ID,
            LESSON_ID,
            USER_ID,
            GEN_COURSE_ID,
             gen_CHAPTER_ID,
             gen_LESSON_ID,
            CASE WHEN ANSWER_ID IS NULL THEN 99 ELSE ANSWER_ID END ANSWER_ID,
            CASE
               WHEN DESCR_ANSWER IS NULL THEN 'ΔΕΝ ΑΠΑΝΤΗΣΑΝ'
               ELSE DESCR_ANSWER
            END
               DESCR_ANSWER,
            TOT_USERS
       FROM EDTOOL.ALL_LESSONS LEFT OUTER JOIN ANSWERS ON ANSWER_ID = ID
      WHERE USER_ROLE <> 1
   ORDER BY LESSON_ID;


DROP VIEW EDTOOL.ANSWERS_STATISTICS_N;

--
-- ANSWERS_STATISTICS_N  (View) 
--
--  Dependencies: 
--   ANSWERS (Table)
--   VW_ALL_ANSWERS_FOR_STAT (View)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.ANSWERS_STATISTICS_N
(COURSES_ID, CHAPTER_ID, LESSON_ID, USER_ID, GEN_COURSE_ID, 
 GEN_CHAPTER_ID, GEN_LESSON_ID, START_LESSON, END_LESSON, ANSWER_DATE, 
 ANSWER_ID, DESCR_ANSWER, TOT_USERS)
AS 
SELECT CURR_COURSE_ID COURSES_ID,
            curr_CHAPTER_ID CHAPTER_ID,
            curr_LESSON_ID LESSON_ID,
            USER_ID,
            GEN_COURSE_ID,
            gen_CHAPTER_ID,
            gen_LESSON_ID,
            START_LESSON,
            END_LESSON,
            ANSWER_DATE,
            CASE WHEN ANSWER_ID IS NULL THEN 99 ELSE ANSWER_ID END ANSWER_ID,
            CASE
               WHEN DESCR_ANSWER IS NULL THEN 'ΔΕΝ ΑΠΑΝΤΗΣΑΝ'
               ELSE DESCR_ANSWER
            END
               DESCR_ANSWER,
            TOT_USERS
       FROM    EDTOOL.VW_ALL_ANSWERS_FOR_STAT   
            LEFT OUTER JOIN
               ANSWERS
            ON ANSWER_ID = ID
      WHERE USER_ROLE <> 1
   ORDER BY LESSON_ID;


DROP VIEW EDTOOL.VW_ALL_LESSONS;

--
-- VW_ALL_LESSONS  (View) 
--
--  Dependencies: 
--   ALL_LESSONS (View)
--   PG_ALLLESSONS (Package)
--   PG_CHAPTERS (Package)
--   PG_COURSES (Package)
--   PG_LESSONS (Package)
--   PG_LESSONSANSWERS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_ALL_LESSONS
(RN, USER_ID, USER_IDD, USER_ROLE, USER_ROLED, 
 USER_STATUS, USER_STATUSD, GENTER_ID, GENTER_IDD, COURSES_ID, 
 COURSES_IDD, CHAPTER_ID, CHAPTER_IDD, LESSON_ID, LESSON_IDD, 
 LESSON_DESCR, FR_LESSON_DATE, FR_LESSON_DATED, TO_LESSON_DATE, TO_LESSON_DATED, 
 TOT_USERS, ID_LES_ANS, ANSWER_ID, ANSWER_IDD, START_STATUS, 
 END_STATUS)
AS 
SELECT Rn,
           User_Id,
           PG_AllLessons.gUser_IdL (User_Id)                 User_IdD,
           User_Role,
           PG_AllLessons.gUser_RoleL (User_Role)             User_RoleD,
           User_Status,
           PG_AllLessons.gUser_StatusL (User_Status)         User_StatusD,
           Genter_Id,
           PG_AllLessons.gGenter_IdL (Genter_Id)             Genter_IdD,
           Courses_Id,
           PG_AllLessons.gCourses_IdL (Courses_Id)           Courses_IdD,
           Chapter_Id,
           PG_AllLessons.gChapter_IdL (Chapter_Id)           Chapter_IdD,
           Lesson_Id,
           PG_AllLessons.gLesson_IdL (Lesson_Id)             Lesson_IdD,
           Lesson_Descr,
           Fr_Lesson_Date,
           TO_CHAR (Fr_Lesson_Date, 'DD/MM/YYYY HH24:MI')    Fr_Lesson_DateD,
           To_Lesson_Date,
           TO_CHAR (To_Lesson_Date, 'DD/MM/YYYY HH24:MI')    To_Lesson_DateD,
           Tot_Users,
           Id_Les_Ans,
           Answer_Id,
           PG_AllLessons.gAnswer_IdL (Answer_Id)             Answer_IdD,
           /*
           CRT_TR_STAT_AA (LESSON_ID, 1)                     HD_STAT_AA,
           CRT_TR_STAT_AA (LESSON_ID, 2)                     HD_STAT_DATA_AA,
           CRT_TR_STAT_AA (LESSON_ID, 3)                     colspan_cn_AA,
           CRT_TR_STAT_AA (LESSON_ID, 4)                     plot_x_AA,
           CRT_TR_STAT_AA (LESSON_ID, 5)                     plot_y_AA,
           CRT_TR_STAT_LA (LESSON_ID, 1)                     HD_STAT_LA,
           CRT_TR_STAT_LA (LESSON_ID, 2)                     HD_STAT_DATA_LA,
           CRT_TR_STAT_LA (LESSON_ID, 3)                     colspan_cn_LA,
           CRT_TR_STAT_LA (LESSON_ID, 4)                     plot_x_LA,
           CRT_TR_STAT_LA (LESSON_ID, 5)                     plot_y_LA,
           CRT_TR_STAT_AX (LESSON_ID, 1)                     HD_STAT_AX,
           CRT_TR_STAT_AX (LESSON_ID, 2)                     HD_STAT_DATA_AX,
           CRT_TR_STAT_AX (LESSON_ID, 3)                     colspan_cn_AX,
           CRT_TR_STAT_AX (LESSON_ID, 4)                     plot_x_AX,
           CRT_TR_STAT_AX (LESSON_ID, 5)                     plot_y_AX,
         --  CRT_TR_STAT_TIME (LESSON_ID, 1)                   HD_STAT_T,
         --  CRT_TR_STAT_TIME (LESSON_ID, 2)                   HD_STAT_DATA_T,
         --  CRT_TR_STAT_TIME (LESSON_ID, 3)                   colspan_cn_T,
         --  CRT_TR_STAT_TIME (LESSON_ID, 4)                   plot_x_T,
         --  CRT_TR_STAT_TIME (LESSON_ID, 5)                   plot_y_T,
         */
           START_STATUS,
           END_STATUS
      FROM ALL_LESSONS;


DROP PACKAGE BODY EDTOOL.PG_ALLLESSONS;

--
-- PG_ALLLESSONS  (Package Body) 
--
--  Dependencies: 
--   PG_ALLLESSONS (Package)
--   ANSWERS (Table)
--   COURSES (View)
--   GENTERS (Table)
--   ROLES (Table)
--   STATUSES (Table)
--   VW_ALL_LESSONS (View)
--   VW_CHAPTERS (View)
--   VW_USERS (View)
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_AllLessons  AS
 function gUser_IdL(f_User_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  '('||USER_NAME||') '|| FIRST_NAME||' '|| LAST_NAME   LEKT_D FROM EDTOOL.VW_USERS WHERE 1 = 1 and USER_ID = f_User_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gUser_RoleL(f_User_Role NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESC_TYPE  LEKT_D FROM ROLES WHERE 1=1 and TYPE_ID = f_User_Role;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gUser_StatusL(f_User_Status NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESC_STATUS  LEKT_D FROM STATUSES WHERE 1=1 and ID = f_User_Status;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gGenter_IdL(f_Genter_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESCR_GENTER  LEKT_D FROM GENTERS WHERE 1=1 and ID = f_Genter_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gCourses_IdL(f_Courses_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  COURSE_DESCR  LEKT_D FROM COURSES WHERE 1=1 and ID = f_Courses_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gChapter_IdL(f_Chapter_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  '( '||COURSE_IDD || ') '||CHAPTER_DESCR   LEKT_D FROM  VW_CHAPTERS WHERE 1=1 and CHAPTER_ID = f_Chapter_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gLesson_IdL(f_Lesson_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  LESSON_DESCR ||' - '||CHAPTER_IDD  ||' '||   '(Έναρξη :' ||FR_LESSON_DATED ||' Λήξη:'|| TO_LESSON_DATED||')'  LEKT_D FROM VW_ALL_LESSONS WHERE 1=1 and LESSON_ID = f_Lesson_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gAnswer_IdL(f_Answer_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESCR_ANSWER  LEKT_D FROM ANSWERS WHERE 1=1 and ID = f_Answer_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
END;
/


DROP PACKAGE BODY EDTOOL.PG_LESSONSANSWERS;

--
-- PG_LESSONSANSWERS  (Package Body) 
--
--  Dependencies: 
--   PG_LESSONSANSWERS (Package)
--   ANSWERS (Table)
--   VW_ALL_LESSONS (View)
--   VW_USERS (View)
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE BODY EDTOOL.PG_LessonsAnswers  AS
 function gLesson_IdL(f_Lesson_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  LESSON_DESCR ||' - '||CHAPTER_IDD  ||' '||   '(Έναρξη :' ||FR_LESSON_DATED ||' Λήξη:'|| TO_LESSON_DATED||')'  LEKT_D FROM VW_ALL_LESSONS WHERE 1=1 and LESSON_ID = f_Lesson_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gUser_IdL(f_User_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  '('||USER_NAME||') '|| FIRST_NAME||' '|| LAST_NAME   LEKT_D FROM VW_USERS WHERE 1 = 1 and USER_ID = f_User_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
 function gAnswer_IdL(f_Answer_Id NUMBER) return varchar2 is 
 cursor c1 is SELECT  DESCR_ANSWER  LEKT_D FROM ANSWERS WHERE 1 = 1 and ID = f_Answer_Id;
 DUMMY VARCHAR2(32000);
 begin 
 FOR c1_rec in c1 loop dummy := c1_rec.LEKT_d;
 end loop;
 return dummy; 
 end;
END;
/


DROP PROCEDURE EDTOOL.CRT_INS_INTO_LESSON_ANSWERS;

--
-- CRT_INS_INTO_LESSON_ANSWERS  (Procedure) 
--
--  Dependencies: 
--   LESSONS_ANSWERS (Table)
--   SQ_FOR_ALL_IDS (Sequence)
--   VW_ALL_LESSONS (View)
--   DBMS_OUTPUT (Synonym)
--   DBMS_RANDOM (Synonym)
--   DUAL (Synonym)
--   DBMS_RANDOM (Package)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.CRT_INS_INTO_LESSON_ANSWERS(months number)
IS

      vl   NUMBER;

      CURSOR c1
      IS
         SELECT *
           FROM VW_ALL_LESSONS a
          WHERE     user_status = 1
                AND user_role = 2
                AND add_months(SYSDATE,months)  BETWEEN FR_LESSON_DATE AND TO_LESSON_DATE;
   BEGIN
      FOR c1_rec IN c1
      LOOP
         SELECT ROUND (DBMS_RANDOM.VALUE (0, 5)) num INTO vl FROM DUAL;

         DBMS_OUTPUT.PUT_LINE (VL);

         IF vl <> 0
         THEN
            FOR I IN 1 .. DBMS_RANDOM.VALUE (1, 100)
            LOOP
               NULL;
            END LOOP;


            INSERT INTO lessons_answers (ID_LES_ANS,
                                         LESSON_ID,
                                         USER_ID,
                                         ANSWER_ID,
                                         ANSWER_DATE)
                 VALUES (SQ_FOR_ALL_IDS.NEXTVAL,
                         c1_rec.LESSON_ID,
                         c1_rec.user_id,
                         vl,
                         add_months(SYSDATE,months));
         END IF;


         COMMIT;
      END LOOP;
   END;
/


DROP PROCEDURE EDTOOL.CRT_INS_IN_CURR_LESSON;

--
-- CRT_INS_IN_CURR_LESSON  (Procedure) 
--
--  Dependencies: 
--   F_FIND_PERIOD_ASWER_ID (Function)
--   LESSONS_ANSWERS (Table)
--   SQ_FOR_ALL_IDS (Sequence)
--   VW_ALL_LESSONS (View)
--   DBMS_RANDOM (Synonym)
--   DUAL (Synonym)
--   DBMS_RANDOM (Package)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.CRT_INS_IN_curr_LESSON
IS

      vl   NUMBER;
      D_SYSDATE DATE;
      CURSOR c1
      IS
         SELECT *
           FROM VW_ALL_LESSONS a
          WHERE     user_status = 1
                AND user_role = 2
                AND SYSDATE BETWEEN FR_LESSON_DATE AND TO_LESSON_DATE;
   BEGIN
      FOR c1_rec IN c1
      LOOP
         SELECT ROUND (DBMS_RANDOM.VALUE (0, 5)) num INTO vl FROM DUAL;

         --DBMS_OUTPUT.PUT_LINE (VL);

         IF vl <> 0
         THEN
            D_SYSDATE := SYSDATE+0.1/1440;
            WHILE D_SYSDATE > SYSDATE
            LOOP
               NULL;
            END LOOP;


            INSERT INTO lessons_answers (ID_LES_ANS,
                                         LESSON_ID,
                                         USER_ID,
                                         ANSWER_ID,
                                         ANSWER_DATE,
                                         PERIOD_ASWER_ID)
                 VALUES (SQ_FOR_ALL_IDS.NEXTVAL,
                         c1_rec.LESSON_ID,
                         c1_rec.user_id,
                         vl,
                         SYSDATE,F_FIND_PERIOD_ASWER_ID (c1_rec.LESSON_ID));
         END IF;


         COMMIT;
      END LOOP;
   END;
/


DROP PROCEDURE EDTOOL.CRT_INS_IN_CURR_LESSON_2021;

--
-- CRT_INS_IN_CURR_LESSON_2021  (Procedure) 
--
--  Dependencies: 
--   F_FIND_PERIOD_ASWER_ID (Function)
--   LESSONS_ANSWERS (Table)
--   PERIOD_ANSWERS (Table)
--   SQ_FOR_ALL_IDS (Sequence)
--   VW_ALL_LESSONS (View)
--   DBMS_RANDOM (Synonym)
--   DUAL (Synonym)
--   DBMS_RANDOM (Package)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.CRT_INS_IN_curr_LESSON_2021
IS
    FRST          NUMBER := 1;
    vl            NUMBER;
    D_SYSDATE     DATE;
    P_LESSON_ID   NUMBER;
    P_ASWER_ID NUMBER;
    CURSOR c1 IS
        SELECT *
          FROM VW_ALL_LESSONS a
         WHERE     user_status = 1
               AND user_role = 2
               AND ADD_MONTHS (SYSDATE, -24) BETWEEN FR_LESSON_DATE
                                                 AND TO_LESSON_DATE;
BEGIN
    FOR c1_rec IN c1
    LOOP
        IF FRST = 1
        THEN
            INSERT INTO PERIOD_ANSWERS (PERIOD_ASWER_ID,
                                        START_PER_ANSWER,
                                        END_PER_ANSWER,
                                        LESSON_ID)
                 VALUES (SQ_FOR_ALL_IDS.NEXTVAL,
                         ADD_MONTHS (SYSDATE, -24),
                         NULL,
                         c1_rec.LESSON_ID);

            FRST := 0;
        END IF;

        COMMIT;

        SELECT ROUND (DBMS_RANDOM.VALUE (0, 5)) num INTO vl FROM DUAL;

        --DBMS_OUTPUT.PUT_LINE (VL);
         P_ASWER_ID := F_FIND_PERIOD_ASWER_ID (c1_rec.LESSON_ID);
        IF vl <> 0
        THEN
            D_SYSDATE := ADD_MONTHS (SYSDATE, -24) + 0.1 / 1440;
            
            WHILE D_SYSDATE > ADD_MONTHS (SYSDATE, -24)
            LOOP
                NULL;
            END LOOP;


            INSERT INTO lessons_answers (ID_LES_ANS,
                                         LESSON_ID,
                                         USER_ID,
                                         ANSWER_ID,
                                         ANSWER_DATE,
                                         PERIOD_ASWER_ID)
                 VALUES (SQ_FOR_ALL_IDS.NEXTVAL,
                         c1_rec.LESSON_ID,
                         c1_rec.user_id,
                         vl,
                         ADD_MONTHS (SYSDATE, -24),
                         P_ASWER_ID);
        END IF;


        COMMIT;
        P_LESSON_ID := c1_rec.LESSON_ID;
    END LOOP;

    IF FRST = 0
    THEN
        UPDATE PERIOD_ANSWERS A
           SET A.END_PER_ANSWER = ADD_MONTHS (SYSDATE, -24)
         WHERE A.PERIOD_ASWER_ID = P_ASWER_ID;
        FRST := 1;
    END IF;

    COMMIT;
END;
/


DROP PROCEDURE EDTOOL.CRT_INS_IN_CURR_LESSON_2022;

--
-- CRT_INS_IN_CURR_LESSON_2022  (Procedure) 
--
--  Dependencies: 
--   F_FIND_PERIOD_ASWER_ID (Function)
--   LESSONS_ANSWERS (Table)
--   PERIOD_ANSWERS (Table)
--   SQ_FOR_ALL_IDS (Sequence)
--   VW_ALL_LESSONS (View)
--   DBMS_RANDOM (Synonym)
--   DUAL (Synonym)
--   DBMS_RANDOM (Package)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.CRT_INS_IN_curr_LESSON_2022
IS
    FRST          NUMBER := 1;
    vl            NUMBER;
    D_SYSDATE     DATE;
    P_LESSON_ID   NUMBER;
    P_ASWER_ID    NUMBER;
    CURSOR c1 IS
        SELECT *
          FROM VW_ALL_LESSONS a
         WHERE     user_status = 1
               AND user_role = 2
               AND ADD_MONTHS (SYSDATE, -12) BETWEEN FR_LESSON_DATE
                                                 AND TO_LESSON_DATE;
BEGIN
    FOR c1_rec IN c1
    LOOP
        IF FRST = 1
        THEN
            INSERT INTO PERIOD_ANSWERS (PERIOD_ASWER_ID,
                                        START_PER_ANSWER,
                                        END_PER_ANSWER,
                                        LESSON_ID)
                 VALUES (SQ_FOR_ALL_IDS.NEXTVAL,
                         ADD_MONTHS (SYSDATE, -12),
                         NULL,
                         c1_rec.LESSON_ID);

            FRST := 0;
        END IF;

        COMMIT;

        SELECT ROUND (DBMS_RANDOM.VALUE (0, 5)) num INTO vl FROM DUAL;

        --DBMS_OUTPUT.PUT_LINE (VL);
        P_ASWER_ID := F_FIND_PERIOD_ASWER_ID (c1_rec.LESSON_ID);
        IF vl <> 0
        THEN
            D_SYSDATE := ADD_MONTHS (SYSDATE, -12) + 0.1 / 1440;

            WHILE D_SYSDATE > ADD_MONTHS (SYSDATE, -12)
            LOOP
                NULL;
            END LOOP;


            INSERT INTO lessons_answers (ID_LES_ANS,
                                         LESSON_ID,
                                         USER_ID,
                                         ANSWER_ID,
                                         ANSWER_DATE,
                                         PERIOD_ASWER_ID)
                 VALUES (SQ_FOR_ALL_IDS.NEXTVAL,
                         c1_rec.LESSON_ID,
                         c1_rec.user_id,
                         vl,
                         ADD_MONTHS (SYSDATE, -12),
                         P_ASWER_ID);
        END IF;


        COMMIT;
        P_LESSON_ID := c1_rec.LESSON_ID;
    END LOOP;

    IF FRST = 0
    THEN
        UPDATE PERIOD_ANSWERS A
           SET A.END_PER_ANSWER = ADD_MONTHS (SYSDATE, -12)
         WHERE A.PERIOD_ASWER_ID = P_ASWER_ID;
        FRST := 1;
    END IF;

    COMMIT;
END;
/


DROP PROCEDURE EDTOOL.CRT_INS_IN_CURR_LESSON_BATCH;

--
-- CRT_INS_IN_CURR_LESSON_BATCH  (Procedure) 
--
--  Dependencies: 
--   F_FIND_PERIOD_ASWER_ID (Function)
--   LESSONS_ANSWERS (Table)
--   SQ_FOR_ALL_IDS (Sequence)
--   VW_ALL_LESSONS (View)
--   DBMS_RANDOM (Synonym)
--   DUAL (Synonym)
--   DBMS_RANDOM (Package)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.CRT_INS_IN_curr_LESSON_batch(dt date)
IS

      vl   NUMBER;
      D_SYSDATE DATE;
      CURSOR c1
      IS
         SELECT *
           FROM VW_ALL_LESSONS a
          WHERE     user_status = 1
                AND user_role = 2
                AND SYSDATE BETWEEN FR_LESSON_DATE AND TO_LESSON_DATE;
   BEGIN
      FOR c1_rec IN c1
      LOOP
         SELECT ROUND (DBMS_RANDOM.VALUE (0, 5)) num INTO vl FROM DUAL;

         --DBMS_OUTPUT.PUT_LINE (VL);

         IF vl <> 0
         THEN
            D_SYSDATE := SYSDATE+0.1/1440;
            WHILE D_SYSDATE > SYSDATE
            LOOP
               NULL;
            END LOOP;


            INSERT INTO lessons_answers (ID_LES_ANS,
                                         LESSON_ID,
                                         USER_ID,
                                         ANSWER_ID,
                                         ANSWER_DATE,
                                         PERIOD_ASWER_ID)
                 VALUES (SQ_FOR_ALL_IDS.NEXTVAL,
                         c1_rec.LESSON_ID,
                         c1_rec.user_id,
                         vl,
                         SYSDATE,F_FIND_PERIOD_ASWER_ID (c1_rec.LESSON_ID));
         END IF;


         COMMIT;
      END LOOP;
   END;
/


DROP PROCEDURE EDTOOL.UPD_LASSONS_DATE;

--
-- UPD_LASSONS_DATE  (Procedure) 
--
--  Dependencies: 
--   CRT_INS_IN_CURR_LESSON_2021 (Procedure)
--   CRT_INS_IN_CURR_LESSON_2022 (Procedure)
--   LESSONS (View)
--   LESSONS_ANSWERS (Table)
--   PERIOD_ANSWERS (Table)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.UPD_LASSONS_DATE
IS
BEGIN
    DELETE lessons_answers;

    DELETE PERIOD_ANSWERS;

    UPDATE LESSONS
       SET START_LESSON = NULL, END_LESSON = NULL;
     UPDATE LESSONS
       SET FR_LESSON_DATE = ADD_MONTHS (SYSDATE, -24) + (ROWNUM - 1) / 24,
           TO_LESSON_DATE = ADD_MONTHS (SYSDATE, -24) + ((ROWNUM - 1) + 1) / 24,
           START_LESSON   = ADD_MONTHS (SYSDATE, -24) + (ROWNUM - 1) / 24
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2021';
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2021;
     EDTOOL.CRT_INS_IN_curr_LESSON_2021;
     COMMIT;
     UPDATE LESSONS
      SET END_LESSON   = ADD_MONTHS (SYSDATE, -24) 
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2021' AND LESSON_ID = 1;
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2021;
     COMMIT;
     --------------------------------
     UPDATE LESSONS
       SET FR_LESSON_DATE = ADD_MONTHS (SYSDATE, -12) + (ROWNUM - 1) / 24,
           TO_LESSON_DATE = ADD_MONTHS (SYSDATE, -12) + ((ROWNUM - 1) + 1) / 24,
           START_LESSON   = ADD_MONTHS (SYSDATE, -12) + (ROWNUM - 1) / 24
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2022';
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2022;
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2022;
     COMMIT;
     UPDATE LESSONS
       SET END_LESSON   = ADD_MONTHS (SYSDATE, -12) 
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2022' AND LESSON_ID = 7;
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2022;
     COMMIT;
     ------------------------------
    UPDATE LESSONS
       SET FR_LESSON_DATE = SYSDATE + (ROWNUM - 1) / 24,
           TO_LESSON_DATE = SYSDATE + ((ROWNUM - 1) + 1) / 24,
           START_LESSON   = SYSDATE + (ROWNUM - 1) / 24
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2023';
     
    COMMIT;
END;
/


DROP PROCEDURE EDTOOL.UPD_LASSONS_DATE_N;

--
-- UPD_LASSONS_DATE_N  (Procedure) 
--
--  Dependencies: 
--   CRT_INS_IN_CURR_LESSON_2021 (Procedure)
--   CRT_INS_IN_CURR_LESSON_2022 (Procedure)
--   LESSONS (View)
--   LESSONS_ANSWERS (Table)
--   PERIOD_ANSWERS (Table)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.UPD_LASSONS_DATE_n
IS
BEGIN
    DELETE lessons_answers;

    DELETE PERIOD_ANSWERS;

    UPDATE LESSONS
       SET START_LESSON = NULL, END_LESSON = NULL;
     UPDATE LESSONS
       SET FR_LESSON_DATE = ADD_MONTHS (SYSDATE, -24) + (ROWNUM - 1) / 24,
           TO_LESSON_DATE = ADD_MONTHS (SYSDATE, -24) + ((ROWNUM - 1) + 1) / 24,
           START_LESSON   = ADD_MONTHS (SYSDATE, -24) + (ROWNUM - 1) / 24
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2021';
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2021;
     EDTOOL.CRT_INS_IN_curr_LESSON_2021;
     COMMIT;
     UPDATE LESSONS
      SET END_LESSON   = ADD_MONTHS (SYSDATE, -24) 
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2021' AND LESSON_ID = 1;
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2021;
     COMMIT;
     --------------------------------
     UPDATE LESSONS
       SET FR_LESSON_DATE = ADD_MONTHS (SYSDATE, -12) + (ROWNUM - 1) / 24,
           TO_LESSON_DATE = ADD_MONTHS (SYSDATE, -12) + ((ROWNUM - 1) + 1) / 24,
           START_LESSON   = ADD_MONTHS (SYSDATE, -12) + (ROWNUM - 1) / 24
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2022';
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2022;
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2022;
     COMMIT;
     UPDATE LESSONS
       SET END_LESSON   = ADD_MONTHS (SYSDATE, -12) 
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2022' AND LESSON_ID = 7;
     COMMIT;
     EDTOOL.CRT_INS_IN_curr_LESSON_2022;
     COMMIT;
     ------------------------------
    UPDATE LESSONS
       SET FR_LESSON_DATE = SYSDATE + (ROWNUM - 1) / 24,
           TO_LESSON_DATE = SYSDATE + ((ROWNUM - 1) + 1) / 24,
           START_LESSON   = SYSDATE + (ROWNUM - 1) / 24
     WHERE TO_CHAR (FR_LESSON_DATE, 'rrrr') = '2023';
     
    COMMIT;
END;
/


DROP FUNCTION EDTOOL.CRT_TR_STAT;

--
-- CRT_TR_STAT  (Function) 
--
--  Dependencies: 
--   ANSWERS_STATISTICS_N (View)
--   VW_ANSWERS (View)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION EDTOOL.CRT_TR_STAT (P_LESSON_ID NUMBER, TP NUMBER)
   RETURN VARCHAR2
IS
   DUMMY   VARCHAR2 (32767);
   tm      VARCHAR2 (10);
   cn      NUMBER := 8;

   CURSOR C1
   IS
        SELECT ID, '<th>' || UPPER (DESCR_ANSWER) || '</th>' TH
          FROM VW_ANSWERS
      ORDER BY ID;

   CURSOR C2 (
      P_LESSON_ID    NUMBER,
      p_answer_id    NUMBER)
   IS
        SELECT COUNT (*) cnt, ANSWER_ID, a.DESCR_ANSWER
          FROM ANSWERS_STATISTICS_N a
         WHERE     a.LESSON_ID = P_LESSON_ID
               AND ANSWER_ID = p_ANSWER_ID
          AND ANSWER_DATE  BETWEEN  START_LESSON AND NVL(END_LESSON,SYSDATE)
      GROUP BY ANSWER_ID, DESCR_ANSWER;

 CURSOR CT (
      P_LESSON_ID    NUMBER,
      p_answer_id    NUMBER)
   IS
        SELECT TO_CHAR(ANSWER_DATE,'HH24.MI') cnt, ANSWER_ID, a.DESCR_ANSWER 
          FROM ANSWERS_STATISTICS_N a
         WHERE     a.LESSON_ID = P_LESSON_ID
               AND ANSWER_ID = p_ANSWER_ID
          AND ANSWER_DATE  BETWEEN  START_LESSON AND NVL(END_LESSON,SYSDATE)
      ;
   
      CURSOR CT_4
   IS   
   SELECT  '''' || TO_CHAR(ANSWER_DATE,'HH24.MI')|| '''' TH     
          FROM ANSWERS_STATISTICS_N a
         WHERE     a.LESSON_ID = P_LESSON_ID
            
          AND ANSWER_DATE  BETWEEN  START_LESSON AND NVL(END_LESSON,SYSDATE);
   
      
      

   CURSOR C4
   IS
        SELECT ID, '''' || UPPER (DESCR_ANSWER) || '''' TH
          FROM VW_ANSWERS
      ORDER BY ID;
      
       CURSOR C_L (
      P_LESSON_ID    NUMBER,
      p_answer_id    NUMBER)
   IS
        SELECT COUNT (*) cnt, ANSWER_ID, a.DESCR_ANSWER
          FROM ANSWERS_STATISTICS_N a
         WHERE     a.LESSON_ID = P_LESSON_ID
               AND ANSWER_ID = p_ANSWER_ID
               AND ANSWER_DATE NOT BETWEEN  START_LESSON AND END_LESSON
      GROUP BY ANSWER_ID, DESCR_ANSWER;
      
      
      
BEGIN
   IF TP = '1'                                                       -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         DUMMY := DUMMY || C1_REC.TH;
      END LOOP;
   ELSIF TP = '2'                                                     -- STATS
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C2_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || '<td>' || tm || '</td>';
         tm := NULL;
      END LOOP;
   ELSIF TP = '3'                                                    -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         cn := cn + 1;
      END LOOP;

      dummy := TO_CHAR (cn);
   ELSIF TP = '4'                                                    -- plot x
   THEN
      FOR C4_REC IN C4
      LOOP
         DUMMY := DUMMY || ',' || C4_REC.TH;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   ELSIF TP = '5'                                                   -- plot  y
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C2_REC IN C2 (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C2_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || ',' || NVL (tm, 0);
         tm := NULL;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   
   ELSIF TP = '6'                                                       -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         DUMMY := DUMMY || C1_REC.TH;
      END LOOP;
   ELSIF TP = '7'                                                     -- STATS
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C_L_REC IN C_L (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C_L_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || '<td>' || tm || '</td>';
         tm := NULL;
      END LOOP;
   ELSIF TP = '8'                                                    -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         cn := cn + 1;
      END LOOP;

      dummy := TO_CHAR (cn);
   ELSIF TP = '9'                                                    -- plot x
   THEN
      FOR C4_REC IN C4
      LOOP
         DUMMY := DUMMY || ',' || C4_REC.TH;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   ELSIF TP = '10'                                                   -- plot  y
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR C_L_REC IN C_L (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (C_L_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || ',' || NVL (tm, 0);
         tm := NULL;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   ELSIF TP = '11'                                                       -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         DUMMY := DUMMY || C1_REC.TH;
      END LOOP;
   ELSIF TP = '12'                                                     -- STATS
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR CT_REC IN CT (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (CT_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || '<td>' || tm || '</td>';
         tm := NULL;
      END LOOP;
   ELSIF TP = '13'                                                    -- HEADER
   THEN
      FOR C1_REC IN C1
      LOOP
         cn := cn + 1;
      END LOOP;

      dummy := TO_CHAR (cn);
   ELSIF TP = '14'                                                    -- plot x
   THEN
      FOR CT4_REC IN CT_4
      LOOP
         DUMMY := DUMMY || ',' || CT4_REC.TH;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   ELSIF TP = '15'                                                   -- plot  y
   THEN
      FOR C1_REC IN C1
      LOOP
         FOR CT_REC IN CT (P_LESSON_ID, C1_REC.ID)
         LOOP
            tm := TO_CHAR (CT_REC.cnt);
         END LOOP;

         DUMMY := DUMMY || ',' || NVL (tm, 0);
         tm := NULL;
      END LOOP;

      dummy := SUBSTR (dummy, 2, LENGTH (dummy));
      dummy := '[' || dummy || ']';
   
   
   
   END IF;

   RETURN (DUMMY);
END;
/


DROP VIEW EDTOOL.VW_ALL_LESSONS_BKP;

--
-- VW_ALL_LESSONS_BKP  (View) 
--
--  Dependencies: 
--   ALL_LESSONS (View)
--   CRT_TR_STAT (Function)
--   PG_ALLLESSONS (Package)
--   PG_CHAPTERS (Package)
--   PG_COURSES (Package)
--   PG_LESSONS (Package)
--   PG_LESSONSANSWERS (Package)
--
CREATE OR REPLACE FORCE VIEW EDTOOL.VW_ALL_LESSONS_BKP
(RN, USER_ID, USER_IDD, USER_ROLE, USER_ROLED, 
 USER_STATUS, USER_STATUSD, GENTER_ID, GENTER_IDD, COURSES_ID, 
 COURSES_IDD, CHAPTER_ID, CHAPTER_IDD, LESSON_ID, LESSON_IDD, 
 LESSON_DESCR, FR_LESSON_DATE, FR_LESSON_DATED, TO_LESSON_DATE, TO_LESSON_DATED, 
 TOT_USERS, ID_LES_ANS, ANSWER_ID, ANSWER_IDD, HD_STAT, 
 HD_STAT_DATA, COLSPAN_CN)
AS 
SELECT Rn,
          User_Id,
          PG_AllLessons.gUser_IdL (User_Id) User_IdD,
          User_Role,
          PG_AllLessons.gUser_RoleL (User_Role) User_RoleD,
          User_Status,
          PG_AllLessons.gUser_StatusL (User_Status) User_StatusD,
          Genter_Id,
          PG_AllLessons.gGenter_IdL (Genter_Id) Genter_IdD,
          Courses_Id,
          PG_AllLessons.gCourses_IdL (Courses_Id) Courses_IdD,
          Chapter_Id,
          PG_AllLessons.gChapter_IdL (Chapter_Id) Chapter_IdD,
          Lesson_Id,
          PG_AllLessons.gLesson_IdL (Lesson_Id) Lesson_IdD,
          Lesson_Descr,
          Fr_Lesson_Date,
          TO_CHAR (Fr_Lesson_Date, 'DD/MM/YYYY HH24:MI') Fr_Lesson_DateD,
          To_Lesson_Date,
          TO_CHAR (To_Lesson_Date, 'DD/MM/YYYY HH24:MI') To_Lesson_DateD,
          Tot_Users,
          Id_Les_Ans,
          Answer_Id,
          PG_AllLessons.gAnswer_IdL (Answer_Id) Answer_IdD,
          CRT_TR_STAT (LESSON_ID, 1) HD_STAT,
          CRT_TR_STAT (LESSON_ID, 2) HD_STAT_DATA,
          CRT_TR_STAT (LESSON_ID, 3) colspan_cn
     FROM ALL_LESSONS;


DROP PROCEDURE EDTOOL.CRT_ANSWERS_21_22_23;

--
-- CRT_ANSWERS_21_22_23  (Procedure) 
--
--  Dependencies: 
--   CRT_INS_INTO_LESSON_ANSWERS (Procedure)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE EDTOOL.crt_answers_21_22_23
IS
BEGIN
   CRT_INS_INTO_LESSON_ANSWERS (0);
   CRT_INS_INTO_LESSON_ANSWERS (-12);
   CRT_INS_INTO_LESSON_ANSWERS (-24);
   COMMIT;
END ;
/


ALTER TABLE EDTOOL.PERIOD_ANSWERS ADD (
  CONSTRAINT LESSON_PER_ID_FK 
  FOREIGN KEY (LESSON_ID) 
  REFERENCES EDTOOL.PERIOD_LESSONS (LESSON_ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.PERIOD_COURSES ADD (
  CONSTRAINT COURSES_R01 
  FOREIGN KEY (GEN_COURSE_ID) 
  REFERENCES EDTOOL.GEN_COURSES (COURSE_ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.PINMENU_DETAIL ADD (
  CONSTRAINT PINMENU_DETAIL_R01 
  FOREIGN KEY (ID_KATHG) 
  REFERENCES EDTOOL.PINMENU (PIN3)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.PIN_KATHG ADD (
  CONSTRAINT PIN_KATHG_R01 
  FOREIGN KEY (ID) 
  REFERENCES EDTOOL.PINMENU (PIN3)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.USERS ADD (
  CONSTRAINT USERS_R01 
  FOREIGN KEY (USER_ROLE) 
  REFERENCES EDTOOL.ROLES (TYPE_ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.USERS ADD (
  CONSTRAINT USERS_R02 
  FOREIGN KEY (USER_STATUS) 
  REFERENCES EDTOOL.STATUSES (ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.USERS ADD (
  CONSTRAINT USERS_R03 
  FOREIGN KEY (GENDER_ID) 
  REFERENCES EDTOOL.GENTERS (ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.USERS_COURSES ADD (
  CONSTRAINT USERS_COURSES_R01 
  FOREIGN KEY (USER_ID) 
  REFERENCES EDTOOL.USERS (USER_ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.USERS_COURSES ADD (
  CONSTRAINT USERS_COURSES_R02 
  FOREIGN KEY (COURSE_ID) 
  REFERENCES EDTOOL.PERIOD_COURSES (ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.GEN_CHAPTERS ADD (
  CONSTRAINT GEN_CHAPTERS_R01 
  FOREIGN KEY (COURSE_ID) 
  REFERENCES EDTOOL.GEN_COURSES (COURSE_ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.GEN_LESSONS ADD (
  CONSTRAINT GEN_LESSONS_R01 
  FOREIGN KEY (CHAPTER_ID) 
  REFERENCES EDTOOL.GEN_CHAPTERS (CHAPTER_ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.PERIOD_CHAPTERS ADD (
  CONSTRAINT CHAPTERS_R01 
  FOREIGN KEY (COURSE_ID) 
  REFERENCES EDTOOL.PERIOD_COURSES (ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.PERIOD_CHAPTERS ADD (
  CONSTRAINT PERIOD_CHAPTERS_R01 
  FOREIGN KEY (GEN_CHAPTER_ID) 
  REFERENCES EDTOOL.GEN_CHAPTERS (CHAPTER_ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.PERIOD_LESSONS ADD (
  CONSTRAINT LESSONS_R01 
  FOREIGN KEY (CHAPTER_ID) 
  REFERENCES EDTOOL.PERIOD_CHAPTERS (CHAPTER_ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.PERIOD_LESSONS ADD (
  CONSTRAINT PERIOD_LESSONS_R01 
  FOREIGN KEY (GEN_LESSON_ID) 
  REFERENCES EDTOOL.GEN_LESSONS (LESSON_ID)
  ENABLE VALIDATE);


ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CONSTRAINT LESSONS_ANSWERS_R01 
  FOREIGN KEY (LESSON_ID) 
  REFERENCES EDTOOL.PERIOD_LESSONS (LESSON_ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CONSTRAINT LESSONS_ANSWERS_R02 
  FOREIGN KEY (USER_ID) 
  REFERENCES EDTOOL.USERS (USER_ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  CONSTRAINT LESSONS_ANSWERS_R03 
  FOREIGN KEY (ANSWER_ID) 
  REFERENCES EDTOOL.ANSWERS (ID)
  ENABLE VALIDATE);

ALTER TABLE EDTOOL.LESSONS_ANSWERS ADD (
  FOREIGN KEY (PERIOD_ASWER_ID) 
  REFERENCES EDTOOL.PERIOD_ANSWERS (PERIOD_ASWER_ID)
  ENABLE VALIDATE);
