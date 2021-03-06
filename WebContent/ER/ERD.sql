
/* Drop Tables */

DROP TABLE CHAT_HISTORY CASCADE CONSTRAINTS;
DROP TABLE CHATQNA CASCADE CONSTRAINTS;
DROP TABLE CORONA_PATIENT CASCADE CONSTRAINTS;
DROP TABLE HOS_DEPT CASCADE CONSTRAINTS;
DROP TABLE RESERVATION CASCADE CONSTRAINTS;
DROP TABLE SYMPTOM CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE HIS_ILL CASCADE CONSTRAINTS;
DROP TABLE HISTORY CASCADE CONSTRAINTS;
DROP TABLE HOSPITAL CASCADE CONSTRAINTS;
DROP TABLE HOUSEHOLD_MEDI CASCADE CONSTRAINTS;
DROP TABLE ILLNESS CASCADE CONSTRAINTS;
DROP TABLE NOTIFICATION_BBS CASCADE CONSTRAINTS;
DROP TABLE PRE_MEDI CASCADE CONSTRAINTS;
DROP TABLE PRESCRIPTION CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE PHARMACY CASCADE CONSTRAINTS;
DROP TABLE USING_TIME_COUNT CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BBS;
DROP SEQUENCE SEQ_CALENDAR;
DROP SEQUENCE SEQ_CHATQNA;
DROP SEQUENCE SEQ_DEPARTMENT;
DROP SEQUENCE SEQ_HISTORY;
DROP SEQUENCE SEQ_HOUSEHOLD_MEDI;
DROP SEQUENCE SEQ_ILLNESS;
DROP SEQUENCE SEQ_NOTIFICATION;
DROP SEQUENCE SEQ_PRESCRIPTION;
DROP SEQUENCE SEQ_QNA;
DROP SEQUENCE SEQ_RESERVATION;




/* Create Sequences */

CREATE SEQUENCE SEQ_BBS INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_CALENDAR INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_CHATQNA INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_DEPARTMENT INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_HISTORY INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_HOUSEHOLD_MEDI INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_ILLNESS INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_NOTIFICATION INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_PRESCRIPTION INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_QNA INCREMENT BY 1 MINVALUE 0 START WITH 0;
CREATE SEQUENCE SEQ_RESERVATION INCREMENT BY 1 MINVALUE 0 START WITH 0;



/* Create Tables */

CREATE TABLE CHATQNA
(
	QNA_NO number NOT NULL,
	QUESTION nvarchar2(100) NOT NULL,
	ANSWER nvarchar2(200) NOT NULL,
	PRIMARY KEY (QNA_NO)
);


CREATE TABLE CHAT_HISTORY
(
	MEM_EMAIL varchar2(50) NOT NULL,
	QNA_NO number NOT NULL,
	TIME date DEFAULT SYSDATE NOT NULL
);


CREATE TABLE CORONA_PATIENT
(
	PERSON number NOT NULL,
	DATE_ date NOT NULL,
	CONTENT nvarchar2(100) NOT NULL,
	LAT number(19,4) NOT NULL,
	LNG number(19,4) NOT NULL
);


CREATE TABLE DEPARTMENT
(
	DEPT_NAME nvarchar2(20) NOT NULL,
	PRIMARY KEY (DEPT_NAME)
);


CREATE TABLE HISTORY
(
	HIST_NO number NOT NULL,
	MEM_EMAIL varchar2(50) NOT NULL,
	CHRONIC_ILL nvarchar2(200),
	PRIMARY KEY (HIST_NO)
);


CREATE TABLE HIS_ILL
(
	HIST_NO number NOT NULL,
	ILL_CODE number NOT NULL
);


CREATE TABLE HOSPITAL
(
	HOSP_CODE varchar2(200) NOT NULL,
	HOSP_NAME nvarchar2(50) NOT NULL,
	AUTHORIZED number DEFAULT -1 NOT NULL,
	TEL varchar2(20),
	WEEKDAY_OPEN number,
	WEEKDAY_CLOSE number,
	WEEKEND_OPEN number,
	WEEKEND_CLOSE number,
	LUNCHTIME nvarchar2(50),
	ADDRESS nvarchar2(100),
	COR_X number,
	COR_Y number,
	AUTH nvarchar2(20),
	APPROVED_DATE date DEFAULT SYSDATE,
	ANSIM varchar2(5),
	JEONDAM varchar2(5),
	EXJEONDAM varchar2(5),
	MEM_EMAIL varchar2(50) NOT NULL,
	AUTH_DATE date,
	PRIMARY KEY (HOSP_CODE)
);


CREATE TABLE HOS_DEPT
(
	HOSP_CODE varchar2(200) NOT NULL,
	DEPT_NAME nvarchar2(20) NOT NULL
);


CREATE TABLE HOUSEHOLD_MEDI
(
	HOUSE_MEDI_NO number NOT NULL,
	HOUSE_MEDI_NAME nvarchar2(20) NOT NULL,
	COMPANY_NAME nvarchar2(20) NOT NULL,
	EXPIRE_DATE number NOT NULL,
	WAY_TO_STORE nvarchar2(50) NOT NULL,
	HOUSE_MEDI_EFFICIENT nvarchar2(200),
	WAY_TO_TAKE nvarchar2(100) NOT NULL,
	CAUTION nvarchar2(2000) NOT NULL,
	PRIMARY KEY (HOUSE_MEDI_NO)
);


CREATE TABLE ILLNESS
(
	ILL_CODE number NOT NULL,
	ILL_NAME nvarchar2(30) NOT NULL,
	ILL_CONTENT nvarchar2(500),
	PREVENTION nvarchar2(2000),
	CAUSE nvarchar2(1000),
	PRIMARY KEY (ILL_CODE)
);


CREATE TABLE MEMBER
(
	MEM_EMAIL varchar2(50) NOT NULL,
	MEM_PWD varchar2(20) NOT NULL,
	MEM_NAME nvarchar2(10) NOT NULL,
	GENDER nvarchar2(10) NOT NULL,
	TEL varchar2(20) NOT NULL,
	AGE number,
	HEIGHT number,
	WEIGHT number,
	ROLE varchar2(10) NOT NULL,
	ENABLE number NOT NULL,
	SIGNUP_DATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (MEM_EMAIL)
);


CREATE TABLE NOTIFICATION_BBS
(
	NOTI_NO number NOT NULL,
	MEM_EMAIL varchar2(50) NOT NULL,
	TITLE nvarchar2(100) NOT NULL,
	CONTENT nvarchar2(2000) NOT NULL,
	POSTDATE date DEFAULT SYSDATE NOT NULL,
	FILE_ADDR varchar2(100),
	HIT number DEFAULT 0 NOT NULL,
	PRIMARY KEY (NOTI_NO)
);


CREATE TABLE PHARMACY
(
	PHAR_CODE varchar2(200) NOT NULL,
	PHAR_NAME nvarchar2(30) NOT NULL,
	TEL varchar2(20),
	WEEKDAY_OPEN number,
	WEEKDAY_CLOSE number,
	HOLIDAY_OPEN number,
	HOLIDAY_CLOSE number,
	LUNCHTIME nvarchar2(20),
	ADDRESS nvarchar2(100),
	COR_X number,
	COR_Y number,
	PRIMARY KEY (PHAR_CODE)
);


CREATE TABLE PRESCRIPTION
(
	PRE_NO number NOT NULL,
	MEM_EMAIL varchar2(50) NOT NULL,
	PRES_DATE date DEFAULT SYSDATE NOT NULL,
	DURATION number NOT NULL,
	COUNT number DEFAULT 0 NOT NULL,
	MEDI_NAME nvarchar2(50) NOT NULL,
	PRIMARY KEY (PRE_NO)
);


CREATE TABLE PRE_MEDI
(
	PRE_NO number NOT NULL,
	ALARM varchar2(20)
);


CREATE TABLE QNA
(
	QNA_NO number NOT NULL,
	MEM_EMAIL varchar2(50) NOT NULL,
	TITLE nvarchar2(200) NOT NULL,
	CONTENT nvarchar2(1000) NOT NULL,
	Q_DATE date DEFAULT SYSDATE NOT NULL,
	ANSWER_TITLE nvarchar2(200) NOT NULL,
	ANSWER_CONTENT nvarchar2(1000) NOT NULL,
	PRIMARY KEY (QNA_NO)
);


CREATE TABLE RESERVATION
(
	RESERV_NO number NOT NULL,
	HOSP_CODE varchar2(200) NOT NULL,
	DEPT_NAME nvarchar2(20) NOT NULL,
	MEM_EMAIL varchar2(50) NOT NULL,
	RES_DATE varchar2(20) NOT NULL,
	RES_TIME varchar2(20) NOT NULL,
	APPLY_TIME date DEFAULT SYSDATE,
	SEL_SYMP nvarchar2(10) NOT NULL,
	APPROVED nvarchar2(20) DEFAULT '???????????????' NOT NULL,
	PRIMARY KEY (RESERV_NO)
);


CREATE TABLE SYMPTOM
(
	SYMPTOM nvarchar2(10) NOT NULL,
	DEPT_NAME nvarchar2(20) NOT NULL
);


CREATE TABLE USING_TIME_COUNT
(
	TIME_ varchar2(20)
);



/* Create Foreign Keys */

ALTER TABLE CHAT_HISTORY
	ADD FOREIGN KEY (QNA_NO)
	REFERENCES CHATQNA (QNA_NO)
;


ALTER TABLE HOS_DEPT
	ADD FOREIGN KEY (DEPT_NAME)
	REFERENCES DEPARTMENT (DEPT_NAME)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (DEPT_NAME)
	REFERENCES DEPARTMENT (DEPT_NAME)
;


ALTER TABLE SYMPTOM
	ADD FOREIGN KEY (DEPT_NAME)
	REFERENCES DEPARTMENT (DEPT_NAME)
;


ALTER TABLE HIS_ILL
	ADD FOREIGN KEY (HIST_NO)
	REFERENCES HISTORY (HIST_NO)
;


ALTER TABLE HOS_DEPT
	ADD FOREIGN KEY (HOSP_CODE)
	REFERENCES HOSPITAL (HOSP_CODE)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (HOSP_CODE)
	REFERENCES HOSPITAL (HOSP_CODE)
;


ALTER TABLE HIS_ILL
	ADD FOREIGN KEY (ILL_CODE)
	REFERENCES ILLNESS (ILL_CODE)
;


ALTER TABLE CHAT_HISTORY
	ADD FOREIGN KEY (MEM_EMAIL)
	REFERENCES MEMBER (MEM_EMAIL)
;


ALTER TABLE HISTORY
	ADD FOREIGN KEY (MEM_EMAIL)
	REFERENCES MEMBER (MEM_EMAIL)
;


ALTER TABLE HOSPITAL
	ADD FOREIGN KEY (MEM_EMAIL)
	REFERENCES MEMBER (MEM_EMAIL)
;


ALTER TABLE NOTIFICATION_BBS
	ADD FOREIGN KEY (MEM_EMAIL)
	REFERENCES MEMBER (MEM_EMAIL)
;


ALTER TABLE PRESCRIPTION
	ADD FOREIGN KEY (MEM_EMAIL)
	REFERENCES MEMBER (MEM_EMAIL)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (MEM_EMAIL)
	REFERENCES MEMBER (MEM_EMAIL)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (MEM_EMAIL)
	REFERENCES MEMBER (MEM_EMAIL)
;


ALTER TABLE PRE_MEDI
	ADD FOREIGN KEY (PRE_NO)
	REFERENCES PRESCRIPTION (PRE_NO)
;



