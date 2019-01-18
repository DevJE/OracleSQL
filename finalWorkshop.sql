/* ����������������������������������������������������������������������������������������
                FINAL WORKSHOP
   ���������������������������������������������������������������������������������������� */
-- QUESTION 01
SELECT (A.C1 + B.C2 + C.C3 + D.C4) "�� ������ ����"
FROM   ( SELECT COUNT(*) C1 FROM TB_BOOK ) A,
       ( SELECT COUNT(*) C2 FROM TB_BOOK_AUTHOR ) B,
       ( SELECT COUNT(*) C3 FROM TB_PUBLISHER ) C,
       ( SELECT COUNT(*) C4 FROM TB_WRITER ) D;
     
-- QUESTION 02
SELECT  TABLE_NAME,
        COLUMN_NAME,
        DATA_TYPE,
        DATA_DEFAULT,
        NULLABLE,
        CONSTRAINT_NAME,
        CONSTRAINT_TYPE,
        R_CONSTRAINT_NAME
FROM    USER_CONSTRAINTS
JOIN    USER_TAB_COLUMNS USING (TABLE_NAME);

-- QUESTION 03
SELECT  BOOK_NO, BOOK_NM
FROM    TB_BOOK
WHERE   LENGTH(BOOK_NM) >= 25;

-- QUESTION 04
SELECT   NM �̸�, OT �繫����ȭ��ȣ, HT ����ȭ��ȣ, MN �޴�����ȣ
FROM     ( SELECT  WRITER_NM NM,
                   OFFICE_TELNO OT,
                   HOME_TELNO HT,
                   MOBILE_NO MN,
                   RANK() OVER (ORDER BY WRITER_NM ASC) RNK
           FROM TB_WRITER
           WHERE MOBILE_NO LIKE '019%'
                 AND WRITER_NM LIKE '��%' ) -- �ζ��� ��
WHERE    RNK = 1;

-- QUESTION 05
SELECT  COUNT(*)
FROM    (SELECT DISTINCT WRITER_NO
         FROM   TB_BOOK_AUTHOR
         WHERE  COMPOSE_TYPE = '�ű�') F,
         TB_WRITER W
WHERE   F.WRITER_NO = W.WRITER_NO;

-- QUESTION 06
SELECT   COMPOSE_TYPE ��������, COUNT(*) ��������
FROM     TB_BOOK_AUTHOR
WHERE    COMPOSE_TYPE IS NOT NULL
GROUP BY COMPOSE_TYPE
HAVING   COUNT(*) >= 300;

-- QUESTION 07
SELECT  B �ֽ�å�̸�, A ��������, P ���ǻ�
FROM    ( SELECT ISSUE_DATE A, BOOK_NM B, PUBLISHER_NM P
          FROM TB_BOOK
          ORDER BY 1 DESC )
WHERE ROWNUM = 1;

-- QUESTION 08
SELECT  �۰�, �Ǽ�
FROM    ( SELECT    WRITER_NM �۰�,
                    COUNT(*) �Ǽ�,
                    RANK() OVER(ORDER BY COUNT(*) DESC) RNK
          FROM      TB_WRITER W, TB_BOOK_AUTHOR A
          WHERE     W.WRITER_NO = A.WRITER_NO
          GROUP BY  WRITER_NM )
WHERE   RNK < 4;

-- QUESTION 09
    
--select issue_date from tb_book
--order by 1;
-- ���� �߸��� ��
-- UPDATE TB_WRITER
-- SET REGIST_DATE = ( SELECT  A
--                     FROM    (SELECT ISSUE_DATE A
--                              FROM TB_BOOK
--                              ORDER BY 1)
--                     WHERE ROWNUM = 1 );
                    
UPDATE TB_WRITER TW
SET REGIST_DATE = ( SELECT  F.MB
                    FROM    ( SELECT ROW_NUMBER() OVER (PARTITION BY WRITER_NO ORDER BY MIN(BOOK_NO)) AS ROWN,
                                     WRITER_NO , 
                                     TO_DATE(SUBSTR(MIN(BOOK_NO),1,8), 'RR/MM/DD') MB
                                     FROM   TB_BOOK_AUTHOR
                                     GROUP BY WRITER_NO ) F
                    WHERE F.ROWN = 1
                          AND TW.WRITER_NO = F.WRITER_NO );
                    
SELECT  WRITER_NO, REGIST_DATE FROM TB_WRITER
ORDER BY 1;
SELECT  WRITER_NO, BOOK_NO FROM TB_BOOK_AUTHOR
ORDER BY 1, 2;
rollback;

-- QUESTION 10
CREATE TABLE TB_BOOK_TRANSLATOR
(
 BOOK_NO        VARCHAR2(10),
 WRITER_NO      VARCHAR2(10),
 TRANS_LANG     VARCHAR2(60),
 CONSTRAINT PK_BOOK_TRANSLATOR PRIMARY KEY (BOOK_NO, WRITER_NO),
 CONSTRAINT FK_BOOK_TRANSLATOR_01 FOREIGN KEY (BOOK_NO) REFERENCES TB_BOOK(BOOK_NO),
 CONSTRAINT FK_BOOK_TARNSLATOR_02 FOREIGN KEY (WRITER_NO) REFERENCES TB_WRITER(WRITER_NO)
);

COMMENT ON COLUMN TB_BOOK_TRANSLATOR.BOOK_NO IS '������ȣ';
COMMENT ON COLUMN TB_BOOK_TRANSLATOR.WRITER_NO IS '�۰���ȣ';
COMMENT ON COLUMN TB_BOOK_TRANSLATOR.TRANS_LANG IS '�������';

-- QUESTION 11
INSERT INTO TB_BOOK_TRANSLATOR (BOOK_NO, WRITER_NO)
(
 SELECT BOOK_NO, WRITER_NO
 FROM   TB_BOOK_AUTHOR
 WHERE  COMPOSE_TYPE IN ('�ű�','����','��','����')
);

DELETE TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('�ű�','����','��','����');

ROLLBACK;
SELECT  * FROM TB_BOOK_TRANSLATOR;
SELECT  DISTINCT COMPOSE_TYPE FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE = '����';