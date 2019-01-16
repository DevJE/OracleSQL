-- 2019.01.16
-- workshop [DDL] ��������������������������������������������������������������������������������������������������������������������

-- QUESTION 01 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE TABLE TB_CATEGORY
(
 NAME       VARCHAR2(10),
 USE_YN     CHAR(1) DEFAULT 'Y'
);
    -- CONFIRM
    DESC    TB_CATEGORY;

-- QUESTION 02 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE TABLE TB_CLASS_TYPE
(
 NO     VARCHAR2(5) CONSTRAINT PK_NO PRIMARY KEY,
 NAME   VARCHAR2(10)
);
    -- CONFIRM
    DESC    TB_CLASS_TYPE;

-- QUESTION 03 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
ALTER TABLE TB_CATEGORY
ADD PRIMARY KEY (NAME);

-- QUESTION 04 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
ALTER TABLE TB_CLASS_TYPE
MODIFY  (NAME   NOT NULL);
    -- CONFIRM
    SELECT  TABLE_NAME, CONSTRAINT_NAME FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TB_C%';

-- QUESTION 05 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
ALTER TABLE TB_CLASS_TYPE
MODIFY  (NO VARCHAR2(10))
MODIFY  (NAME VARCHAR2(20));

ALTER TABLE TB_CATEGORY
MODIFY  (NAME VARCHAR2(20));

-- QUESTION 06 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
ALTER TABLE TB_CLASS_TYPE
RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CLASS_TYPE
RENAME COLUMN NAME TO CLASS_TYPE_NAME;
ALTER TABLE TB_CATEGORY
RENAME COLUMN NAME TO CATEGORY_NAME;
    -- CONFITRM
    SELECT * FROM TB_CLASS_TYPE;

-- QUESTION 07 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
ALTER TABLE TB_CATEGORY
RENAME CONSTRAINT PK_NAME TO PK_NAME2;
ALTER TABLE TB_CLASS_TYPE
RENAME CONSTRAINT PK_NO TO PK_NO2;

-- QUESTION 08 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT;

    -- CONFIRM
    SELECT  * FROM TB_CATEGORY;

-- QUESTION 09 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
ALTER TABLE TB_DEPARTMENT
ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY (CATEGORY_NAME)
    REFERENCES TB_CATEGORY;

-- QUESTION 10 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE OR REPLACE VIEW NW_�л��Ϲ����� (�й�, �л��̸�, �ּ�)
AS  SELECT  STUDENT_NO ,
            STUDENT_NAME ,
            STUDENT_ADDRESS
    FROM    TB_STUDENT;
     --CONFIRM
     SELECT * FROM NW_�л��Ϲ�����;
     
-- QUESTION 11 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE OR REPLACE VIEW VW_�������
AS  SELECT  STUDENT_NAME,
            DEPARTMENT_NAME,
            PROFESSOR_NAME
    FROM    TB_STUDENT S, TB_DEPARTMENT D, TB_PROFESSOR P
    WHERE   S.DEPARTMENT_NO = D.DEPARTMENT_NO(+) AND S.COACH_PROFESSOR_NO = P.PROFESSOR_NO(+);
    --CONFIRM
    SELECT  * FROM VW_�������;

-- QUESTION 12 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE OR REPLACE VIEW VW_�а����л���
AS  SELECT   DEPARTMENT_NAME,
             COUNT(*) STUDENT_COUNT
    FROM     TB_STUDENT
    JOIN     TB_DEPARTMENT USING (DEPARTMENT_NO)
    GROUP BY DEPARTMENT_NAME;
    --CONFIRM
    SELECT  * FROM VW_�а����л���;

-- QUESTION 13 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
UPDATE NW_�л��Ϲ�����
SET �л��̸� = '������'
WHERE �й� = 'A213046';

-- QUESTION 14 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE OR REPLACE VIEW NW_�л��Ϲ�����
AS  SELECT  STUDENT_NO AS "�й�",
            STUDENT_NAME AS "�л��̸�",
            STUDENT_ADDRESS AS "�ּ�"
    FROM    TB_STUDENT
WITH READ ONLY;

-- QUESTION 15 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢� 2005~2009
SELECT  CLASS_NO �����ȣ, DEPARTMENT_NAME �����̸�, CNT ������������
FROM    ( SELECT   CLASS_NO, COUNT(*) CNT
          FROM     TB_GRADE
          WHERE    SUBSTR(TERM_NO, 1, 4) BETWEEN '2006' AND '299--0000'
          GROUP BY CLASS_NO
          ORDER BY 2 DESC ) INLV
JOIN    TB_CLASS USING (CLASS_NO)
JOIN    TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE   ROWNUM <= 3
ORDER BY 3 DESC, 1;

-- ��������������������������������������������������������������������������������������������������������������������������������������������������
-- workshop [DML] ��������������������������������������������������������������������������������������������������������������������
-- QUESTION 01 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
INSERT INTO TB_CLASS_TYPE VALUES ('01','�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES ('02','��������');
INSERT INTO TB_CLASS_TYPE VALUES ('03','�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES ('04','���缱��');
INSERT INTO TB_CLASS_TYPE VALUES ('05','������');
    --CONFIRM
    SELECT  * FROM TB_CLASS_TYPE;

-- QUESTION 02 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE TABLE TB_�л��Ϲ����� (�й�, �л��̸�, �ּ�)
AS  SELECT  STUDENT_NO,
            STUDENT_NAME,
            STUDENT_ADDRESS
    FROM    TB_STUDENT;
    -- CONFIRM
    SELECT  * FROM TB_�л��Ϲ�����;

-- QUESTION 03 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
CREATE TABLE TB_������а� (�й�, �л��̸�, ����⵵, �����̸�)
AS  SELECT  STUDENT_NO,
            STUDENT_NAME,
            EXTRACT ( YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN, 1, 2), 'RRRR')),
            PROFESSOR_NAME
    FROM    TB_STUDENT S, TB_PROFESSOR P
    WHERE   S.DEPARTMENT_NO = P.DEPARTMENT_NO;
    -- CONFIRM
    SELECT  * FROM TB_������а�;

-- QUESTION 04 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
UPDATE  TB_DEPARTMENT
SET     CAPACITY = ROUND((CAPACITY + (CAPACITY*0.1)) , 0);

    -- CONFIRM
    SELECT * FROM TB_DEPARTMENT;

-- QUESTION 05 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
UPDATE  TB_STUDENT
SET     STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
WHERE   STUDENT_NO = 'A413042';
    -- CONFIRM
    SELECT  STUDENT_ADDRESS FROM TB_STUDENT WHERE STUDENT_NAME = '�ڰǿ�';

-- QUESTION 06 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
UPDATE  TB_STUDENT
SET     STUDENT_SSN = SUBSTR(STUDENT_SSN, 1, 6);
    -- CONFIRM
    SELECT  STUDENT_SSN FROM TB_STUDENT;
    
-- QUESTION 07 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
UPDATE  TB_GRADE
SET     POINT = 3.5
WHERE   CLASS_NO = ( SELECT  G.CLASS_NO
                     FROM    TB_CLASS C, TB_GRADE G
                     WHERE   C.CLASS_NO = G.CLASS_NO
                             AND C.CLASS_NAME = '�Ǻλ�����'
                             AND TERM_NO = '200501')
        AND TERM_NO = '200501';

-- QUESTION 08 �¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢�
-- 1. �׳� ���� �����ϱ�.
DELETE FROM TB_GRADE
WHERE  STUDENT_NO IN ( SELECT DISTINCT STUDENT_NO
                      FROM   TB_GRADE
                      JOIN   TB_STUDENT USING (STUDENT_NO)
                      WHERE  ABSENCE_YN = 'Y' );
-- 2. ������ NULLó���� �� ����.                     
UPDATE TB_GRADE
SET    POINT = NULL
WHERE  STUDENT_NO IN (SELECT DISTINCT STUDENT_NO
                      FROM   TB_GRADE
                      JOIN   TB_STUDENT USING (STUDENT_NO)
                      WHERE  ABSENCE_YN = 'Y');
    -- CONFRIM
    SELECT  * FROM TB_GRADE
    WHERE  STUDENT_NO IN (SELECT DISTINCT STUDENT_NO
                      FROM   TB_GRADE
                      JOIN   TB_STUDENT USING (STUDENT_NO)
                      WHERE  ABSENCE_YN = 'Y');
    ROLLBACK;