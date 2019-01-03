-- SCOTT �Լ� �������� 2019-01-03


-- COMM �� ���� NULL�� �ƴ� ���� ��ȸ
SELECT  COMM
FROM    EMP
WHERE   COMM IS NOT NULL;

-- Ŀ�̼��� ���� ���ϴ� ���� ��ȸ
SELECT  ENAME
FROM    EMP
WHERE   COMM IS NULL OR COMM = '0';

-- �����ڰ� ���� ���� ���� ��ȸ
SELECT  ENAME
FROM    EMP
WHERE   MGR IS NULL;

-- �޿��� ���� �޴� ���� ������ ��ȸ
SELECT  ENAME �̸�, SAL �޿�
FROM    EMP
ORDER BY �޿� DESC;

-- �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ
SELECT  ENAME �̸�, SAL �޿�, COMM Ŀ�̼�
FROM    EMP
ORDER BY �޿� DESC, COMM DESC;

-- EMP ���̺��� �����ȣ, �����,����, �Ի��� ��ȸ
-- �� �Ի����� �������� ���� ó����.
SELECT  EMPNO �����ȣ, ENAME �����, JOB ����, HIREDATE �Ի���
FROM    EMP
ORDER BY HIREDATE;

-- EMP ���̺�� ���� �����ȣ, ����� ��ȸ
-- �����ȣ ���� �������� ����
SELECT  EMPNO �����ȣ, ENAME �����
FROM    EMP
ORDER BY EMPNO DESC;

-- ���, �Ի���, �����, �޿� ��ȸ
-- �μ���ȣ�� ���� ������, ���� �μ���ȣ�� ���� �ֱ� �Ի��ϼ����� ó��
SELECT EMPNO ���, HIREDATE �Ի���, ENAME �����, SAL �޿�
FROM    EMP
ORDER BY DEPTNO, HIREDATE;

/***** �Լ� *****/

-- �ý������� ���� ���� ��¥�� ���� ������ ����� �� ��
SELECT  SYSDATE ���ó�¥
FROM    DUAL;

-- EMP ���̺�� ���� ���, �����, �޿� ��ȸ
-- ��, �޿��� 100���� ������ ���� ��� ó����.
-- �޿� ���� �������� ������.
SELECT  EMPNO ���, ENAME �����,
        TRUNC( SAL, -2 ) �޿�
FROM    EMP
ORDER BY SAL DESC;

-- EMP ���̺�� ���� �����ȣ�� Ȧ���� ������� ��ȸ
SELECT  *
FROM    EMP
WHERE   MOD( EMPNO, 2 ) = 1;
/* ���� ó�� �Լ�*/  

-- EMP ���̺�� ���� �����, �Ի��� ��ȸ
-- ��, �Ի����� �⵵�� ���� �и� �����ؼ� ���
SELECT  ENAME �����,
        EXTRACT( YEAR FROM HIREDATE ) || '��' ����,
        EXTRACT( MONTH FROM HIREDATE ) || '��' ��
FROM    EMP;

-- EMP ���̺�� ���� 9���� �Ի��� ������ ���� ��ȸ
SELECT  *
FROM    EMP
WHERE   SUBSTR( HIREDATE, 4, 2 ) = 9;

-- EMP ���̺�� ���� '81'�⵵�� �Ի��� ���� ��ȸ
SELECT  *
FROM    EMP
WHERE   TO_CHAR( HIREDATE, 'RR' ) = '81';

-- EMP ���̺�� ���� �̸��� 'E'�� ������ ���� ��ȸ
SELECT  *
FROM    EMP
WHERE   ENAME LIKE '%E';

-- emp ���̺�� ���� �̸��� ����° ���ڰ� 'R'�� ������ ���� ��ȸ
-- LIKE �����ڸ� ���
SELECT  *
FROM    EMP
WHERE   ENAME LIKE '__R_%';

-- SUBSTR() �Լ� ���
SELECT  *
FROM    EMP
WHERE   SUBSTR( ENAME, 3, 1 ) = 'R';


/************ ��¥ ó�� �Լ� **************/

-- �Ի��Ϸ� ���� 40�� �Ǵ� ��¥ ��ȸ
SELECT  TO_CHAR( HIREDATE, 'RRRR"�� " MM"�� " DD"�� "' ) �Ի���,
        SUBSTR( TO_CHAR( HIREDATE, 'RRRRYYMM' ), 1, 4 ) + 40 || '�� ' ||
        EXTRACT( MONTH FROM HIREDATE ) || '�� ' ||
        EXTRACT( DAY FROM HIREDATE ) || '��' "�Ի��Ϸκ��� 40�� ��"
FROM    EMP;

-- �Ի��Ϸ� ���� 33�� �̻� �ٹ��� ������ ���� ��ȸ
SELECT  *
FROM    EMP
WHERE   FLOOR( MONTHS_BETWEEN( SYSDATE, HIREDATE ) / 12 ) >= 33;
-- ���� ��¥���� �⵵�� ����
SELECT  EXTRACT ( YEAR FROM SYSDATE ) ���س⵵
FROM    DUAL;