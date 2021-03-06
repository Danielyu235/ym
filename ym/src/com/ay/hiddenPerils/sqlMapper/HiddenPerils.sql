CREATE TABLE TB_HIDDEN_PERILS (
CADRES_ID NVARCHAR(255) NULL ,--干部ID
_NAME NVARCHAR(255) NULL ,--姓名
CADRES_LEVEL NVARCHAR(255) NULL ,--干部级别
POSITION NVARCHAR(255) NULL ,--职务
DEPARTMENT NVARCHAR(255) NULL ,--部门
HT_ADDRESS NVARCHAR(255) NULL ,--隐患地点
HT_DEPARTMENT NVARCHAR(255) NULL ,--隐患点部门
TASK NVARCHAR(255) NULL ,--任务
SHIFT NVARCHAR(255) NULL ,--班次
WALK_DATE NVARCHAR(255) NULL ,--走动日期
STATE NVARCHAR(255) NULL ,--录入状态
LISTED_DATE NVARCHAR(255) NULL ,--挂牌时间

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)