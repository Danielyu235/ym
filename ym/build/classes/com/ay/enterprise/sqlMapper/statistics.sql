--按经济类型统计
SELECT '国有经济',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '国有经济'
UNION
SELECT '集体经济',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '集体经济'
UNION
SELECT '私营经济',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '私营经济'
UNION
SELECT '有限责任公司',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '有限责任公司'
UNION
SELECT '联营经济',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '联营经济'
UNION
SELECT '股份合作',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '股份合作'
UNION
SELECT '外商投资',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '外商投资'
UNION
SELECT '港澳台投资',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '港澳台投资'
UNION
SELECT '个体经济',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '个体经济'
UNION
SELECT '其它经济',count(*) from TB_ENTERPRISE 
where TB_ENTERPRISE.STATUS = '1' AND ECO_TYPE = '其它经济'