CREATE TABLE TB_EMPLOYEE_INFORMATION (
JOB_NUMBER NVARCHAR(255) NULL ,--工号
NAME NVARCHAR(255) NULL ,--姓名
SEX NVARCHAR(255) NULL ,--性别
DATE NVARCHAR(255) NULL ,--出生日期
DEPT NVARCHAR(255) NULL ,--所在岗位
RESULT NVARCHAR(255) NULL ,--检查结果

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)