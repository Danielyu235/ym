CREATE TABLE TB_PUNISH_SAFE (
PUNISHMENT_VIEWS NVARCHAR(255) NULL ,--三违罚款次数
FINES NVARCHAR(255) NULL ,--三违罚款金额
RECORD_TIME NVARCHAR(255) NULL ,--记录时间
REMARK NVARCHAR(4000) NULL ,--备注

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)