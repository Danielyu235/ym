CREATE TABLE TB_IDENTIFICATION_LOG (
DWDM NVARCHAR(255) NULL ,--单位代码
CORP_NAME NVARCHAR(255) NULL ,--所属单位
HAZARDS_ID NVARCHAR(255) NULL ,--危险源ID
HAZARDS_NAME NVARCHAR(255) NULL ,--危险源名称
HAZARDS_TYPE NVARCHAR(255) NULL ,--危险源类型
INFO NVARCHAR(255) NULL ,--辨识信息
REASON NVARCHAR(255) NULL ,--原因
LOGDATE NVARCHAR(50) NULL,--辨识时间
ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)