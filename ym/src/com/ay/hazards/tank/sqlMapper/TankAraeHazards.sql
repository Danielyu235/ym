CREATE TABLE TB_TANK_ARAE_HAZARDS (
NUMBER NVARCHAR(255) NULL ,--编号
DWDM NVARCHAR(255) NULL ,--单位代码
TANK_NAME NVARCHAR(255) NULL ,--贮罐区名称
ADDRESS NVARCHAR(255) NULL ,--具体位置
AMBIENT_DOMAIN NVARCHAR(255) NULL ,--所处环境功能区
TANK_AREA NVARCHAR(255) NULL ,--贮罐区面积
IS_NON_BULWARK NVARCHAR(255) NULL ,--有无防护堤
BULWARK_AREA NVARCHAR(255) NULL ,--防护堤所围面积
TANK_NUMBER NVARCHAR(255) NULL ,--贮罐个数
MIN_RANGE NVARCHAR(255) NULL ,--最小距离
TBLXDH NVARCHAR(255) NULL ,--填表联系电话
TBR NVARCHAR(255) NULL ,--填表人
TBRQ NVARCHAR(255) NULL ,--填表日期

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)