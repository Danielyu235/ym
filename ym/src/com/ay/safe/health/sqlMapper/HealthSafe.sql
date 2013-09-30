CREATE TABLE TB_HEALTH_SAFE (
EMPLOYEE_ID NVARCHAR(255) NULL ,--员工工号
SOURCE NVARCHAR(255) NULL ,--体检结果
DATE NVARCHAR(255) NULL ,--填报时间
NUMBER NVARCHAR(255) NULL ,--职业项数量
REMARK NVARCHAR(255) NULL ,--备注

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)