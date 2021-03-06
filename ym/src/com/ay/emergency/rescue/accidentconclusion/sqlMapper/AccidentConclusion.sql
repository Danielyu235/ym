CREATE TABLE TB_ACCIDENT_CONCLUSION (
REPORT_NAME NVARCHAR(255) NULL ,--报告名称
ACCIDENT_INFO NVARCHAR(255) NULL ,--事故信息
TYPE NVARCHAR(255) NULL ,--事故类型
HAPPEN_TIME NVARCHAR(255) NULL ,--事故发生时间
ACCIDENT_ADDRESS NVARCHAR(255) NULL ,--事故地点
ACCIDENT_PROCESS NVARCHAR(255) NULL ,--事故过程描述
CALL_POLICE NVARCHAR(255) NULL ,--报警人
CALL_PHONE NVARCHAR(255) NULL ,--报警人电话
CALLED_MAN NVARCHAR(255) NULL ,--接警人
CALLED_TIME NVARCHAR(255) NULL ,--接警时间
PLAN_NAME NVARCHAR(255) NULL ,--启用预案名称
PLAN_LEVEL NVARCHAR(255) NULL ,--预案级别
PLAN_TYPE NVARCHAR(255) NULL ,--预案类型
DEAD_NUM NVARCHAR(255) NULL ,--死亡人数
INJURED_NUM NVARCHAR(255) NULL ,--受伤人数
MISSING_NUM NVARCHAR(255) NULL ,--失踪人数
HOSPITAL_NUM NVARCHAR(255) NULL ,--住院人数
DIRECT_LOSE NVARCHAR(255) NULL ,--直接财产损失
INDIRECT_LOSE NVARCHAR(255) NULL ,--间接财产损失
ACCIDENT_EVALUATION NVARCHAR(255) NULL ,--事故评价
EXPERT_OPINION NVARCHAR(255) NULL ,--专家意见
ZZH_OPINION NVARCHAR(255) NULL ,--总指挥意见
NOTE NVARCHAR(255) NULL ,--备注

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)