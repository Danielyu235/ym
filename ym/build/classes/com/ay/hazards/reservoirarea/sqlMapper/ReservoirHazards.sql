CREATE TABLE TB_RESERVOIR_HAZARDS (
AREA_ID VARCHAR(50) NULL ,--库区ID
NO NVARCHAR(255) NULL ,--库房序号
NAME NVARCHAR(255) NULL ,--库房名称
STYLE NVARCHAR(255) NULL ,--库房形式
STRUCTURE NVARCHAR(255) NULL ,--库房结构
USE_YEAR_TIME NVARCHAR(255) NULL ,--设计使用年限
BUILD_TIME NVARCHAR(255) NULL ,--竣工时间
AREA NVARCHAR(255) NULL ,--占地面积
HAS_FIRE_WALL NVARCHAR(255) NULL ,--有无防火墙
EXPLOSION_EQUIPMENT NVARCHAR(255) NULL ,--起爆器材
EXPLOSION_EXPLOSIVE NVARCHAR(255) NULL ,--工业炸药
EXPLOSION_MATERIALS NVARCHAR(255) NULL ,--爆炸危险原材料
FIRECRACKER NVARCHAR(255) NULL ,--烟火剂、烟花爆竹
LIQUID_LESS NVARCHAR(255) NULL ,--闪点＜28℃
LIQUID_MORE NVARCHAR(255) NULL ,--28℃≤闪点＜60℃
GAS_LESS NVARCHAR(255) NULL ,--爆炸下限＜10%
GAS_MORE NVARCHAR(255) NULL ,--爆炸下限≥10%
POISON_MOST NVARCHAR(255) NULL ,--剧毒品
POISON_MORE NVARCHAR(255) NULL ,--有毒品
POISON_LITTLE NVARCHAR(255) NULL ,--有害品

ID VARCHAR(50) NOT NULL PRIMARY KEY ,
STATUS CHAR(1) NULL DEFAULT ((1)) ,
CREATED VARCHAR(32) NULL ,
CREATE_TIME DATETIME NULL ,
UPDATED VARCHAR(32) NULL ,
UPDATE_TIME DATETIME NULL 
)

ALTER TABLE TB_RESERVOIR_HAZARDS 
ADD CONSTRAINT FK_TB_RESERVOIR_HAZARDS_AREA_ID FOREIGN KEY (AREA_ID) 
REFERENCES TB_RESERVOIR_AREA_HAZARDS ON DELETE CASCADE;