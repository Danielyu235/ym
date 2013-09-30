CREATE TABLE TB_SCORE_MANAGEMENT (
SP NVARCHAR(255) NULL ,--安全教育考核占分数比例
HS NVARCHAR(255) NULL ,--人员职业健康扣分数
HP NVARCHAR(255) NULL ,--人员职业健康占分数比例
PS NVARCHAR(255) NULL ,--日常三违处罚扣分数
PP NVARCHAR(255) NULL ,--日常三违处罚占分数比例
DS NVARCHAR(255) NULL ,--人员日常状态扣分数
DP NVARCHAR(255) NULL ,--人员日常状态占分数比例
RLS NVARCHAR(255) NULL ,--人员日常考勤与奖罚-迟到扣分数
RAS NVARCHAR(255) NULL ,--人员日常考勤与奖罚-旷工扣分数
RPS NVARCHAR(255) NULL ,--人员日常考勤与奖罚-惩罚扣分数
RRS NVARCHAR(255) NULL ,--人员日常考勤与奖罚-奖励扣分数
RP NVARCHAR(255) NULL ,--人员日常考勤与奖罚占分数比例

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)