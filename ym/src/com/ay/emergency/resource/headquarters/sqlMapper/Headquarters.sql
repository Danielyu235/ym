CREATE TABLE TB_HEADQUARTERS (
NAME NVARCHAR(255) NULL ,--指挥中心名称
ADDRESS NVARCHAR(255) NULL ,--指挥中心地址
PHONE_NUMBER NVARCHAR(255) NULL ,--指挥中心电话
PERSONINCHARGE NVARCHAR(255) NULL ,--负责人
CHARGE_PHONE_NUMBER NVARCHAR(255) NULL ,--负责人电话

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)