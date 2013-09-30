CREATE TABLE TB_RESERVOIR_AREA_HAZARDS (
DWDM VARCHAR(50) NULL ,--所属单位
NO NVARCHAR(255) NULL ,--编号
NAME NVARCHAR(255) NULL ,--库区名称
LOCATION NVARCHAR(255) NULL ,--具体位置
ENVIRONMENT NVARCHAR(255) NULL ,--所处环境功能区
AREA NVARCHAR(255) NULL ,--库区占地面积
SIZE NVARCHAR(255) NULL ,--库房个数
SAVE_MAN NVARCHAR(255) NULL ,--填表人
CONTACT_PHONE NVARCHAR(255) NULL ,--联系电话
SAVE_TIME NVARCHAR(255) NULL ,--填表日期

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)
ALTER TABLE TB_RESERVOIR_AREA_HAZARDS 
ADD CONSTRAINT FK_TB_RESERVOIR_AREA_HAZARDS_DWDM FOREIGN KEY (DWDM) 
REFERENCES TB_ENTERPRISE ON DELETE CASCADE;