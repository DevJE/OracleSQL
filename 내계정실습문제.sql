-- 2019.01.14

-- �ǽ� 1
-- ���, �̸�, �޿�, ���޸�, �μ���, �ٹ�������, �Ҽӱ����� ��ȸ
-- ��ȸ ����� EMP_LIST ���̺� ����.
CREATE TABLE EMP_LIST
AS SELECT    EMP_ID, EMP_NAME, SALARY, JOB_ID, DEPT_ID, LOC_DESCRIBE, COUNTRY_NAME
   FROM      EMPLOYEE
   JOIN      DEPARTMENT USING (DEPT_ID)
   JOIN      LOCATION ON (LOC_ID = LOCATION_ID)
   JOIN      COUNTRY USING (COUNTRY_ID);
   
SELECT  * FROM EMP_LIST;

-- �ǽ� 2
-- EMPLOYEE ���̺��� ���� ������ ������ ��ȸ�ؼ�  EMP_MAN���̺� ����.
CREATE TABLE EMP_MAN
AS SELECT    *
   FROM      EMPLOYEE
   WHERE     SUBSTR(EMP_NO, 8, 1) = '1';
   
SELECT  * FROM EMP_MAN;

DROP TABLE EMP_MAN;

-- �ǽ� 3
-- ���� ������ ������ ��ȸ�ؼ� EMP_FEMAIL���̺� ����.
CREATE TABLE EMP_FEMAIL
AS SELECT   *
   FROM     EMPLOYEE
   WHERE    SUBSTR(EMP_NO, 8, 1) = '2';
   
SELECT  * FROM EMP_FEMAIL;

-- �ǽ� 4
-- �μ��� ���� ����� �����ؼ� PART_LIST ���̺� ����
-- DEPT_NAME, JOB_TILE, EMP_NAME, EMP_ID�� COLUMN ����
CREATE TABLE PART_LIST
AS SELECT    DEPT_NAME, JOB_TITLE, EMP_NAME, EMP_ID
   FROM      EMPLOYEE E, DEPARTMENT D, JOB J
   WHERE     E.DEPT_ID = D.DEPT_ID(+) AND E.JOB_ID = J.JOB_ID(+)
   ORDER BY  DEPT_NAME;

COMMENT ON COLUMN PART_LIST.DEPT_NAME IS '�μ���';
COMMENT ON COLUMN PART_LIST.JOB_TITLE IS '���޸�';
COMMENT ON COLUMN PART_LIST.EMP_NAME IS '�����';
COMMENT ON COLUMN PART_LIST.EMP_ID IS '�����ȣ';
   
DROP TABLE PART_LIST;
SELECT  * FROM PART_LIST;

-- �ǽ� : ���������� ������ ���̺� �����
/*
 ���̺�� : PHONEBOOK
 �÷��� : ID CHAR(3) �⺻Ű(�����̸� : PK_PBID)
 PNAME    VARCHAR2(20) �� ������.
                        (NN_PBNAME)
 PHONE    VARCHAR2(15) �� ������.
                        (NN_PBPHONE)
                        �ߺ��� �Է¸���.
                        (UN_PBHONE)
 ADDRESS  VARCHAR2(100) �⺻�� ������
                        '����� ���α�'
 NOT NULL�� �����ϰ�, ��� ���̺� �������� ������.
*/
CREATE TABLE PHONEBOOK
(
 ID      CHAR(3),
 PNAME   VARCHAR2(20) CONSTRAINT NN_PNAME NOT NULL,
 PHONE   VARCHAR2(15) CONSTRAINT NN_PBPHONE NOT NULL,
 ADDRESS VARCHAR2(100) DEFAULT '����� ���α�',
 CONSTRAINT PK_PBID PRIMARY KEY (ID),
 CONSTRAINT UN_PBPHONE UNIQUE (PHONE)
);
INSERT INTO PHONEBOOK VALUES ('Br1', '�ѱ���', '010-0000-1111', DEFAULT);
SELECT  * FROM PHONEBOOK;