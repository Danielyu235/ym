CREATE TABLE TB_COAL_OUTPUT (
UNIT_GROUP NVARCHAR(255) NULL ,--单位队组
MONTH_PLAN NVARCHAR(255) NULL ,--本月计划
DAILY_PLAN NVARCHAR(255) NULL ,--日计划
DAILY_OUTPUT NVARCHAR(255) NULL ,--日产量
DAILY_EXCEED_LOSS NVARCHAR(255) NULL ,--日超亏
MONTH_CUMULATE_PLAN NVARCHAR(255) NULL ,--月累计划
MONTH_CUMULATE_OUTPUT NVARCHAR(255) NULL ,--月累产量
MONTH_CUMULATE_EXCEED_LOSS NVARCHAR(255) NULL ,--月累超亏
YEAR_CUMULATE_PLAN NVARCHAR(255) NULL ,--年累计划
YEAR_CUMULATE_OUTPUT NVARCHAR(255) NULL ,--年累产量
YEAR_CUMULATE_EXCEED_LOSS NVARCHAR(255) NULL ,--年累超亏

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)