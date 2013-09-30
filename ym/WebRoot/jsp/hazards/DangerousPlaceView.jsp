<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>打印预览</title>


</head>

<body>
<h2 align="center" style="font-style: normal">危险化学品危险场所基本特征表</h2>
<table width="1020" height="553" border="1" align="center" cellspacing="0" bordercolor="#000000">
  <tr>
    <td width="259" height="44">所属单位</td>
    <td colspan="4">${sessionScope.dangerousplaceInfo.corpName}</td>
  </tr>
  <tr>
    <td height="46">危险场所名称</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.dangerplacename}</td>
  </tr>
  <tr>
    <td height="49">危险场所所在地址</td>
     <td width="468">&nbsp;${sessionScope.dangerousplaceInfo.dangerplaceadress}</td>
    <td width="131">危险场所投用时间</td>
    <td width="144" colspan="2">&nbsp;${sessionScope.dangerousplaceInfo.dangerplacetime}</td>
  </tr>
  <tr>
    <td height="38">危险场所级别</td>
     <td>&nbsp;${sessionScope.dangerousplaceInfo.dangerplacelevel}</td>
    <td>R值</td>
    <td colspan="2">&nbsp;${sessionScope.dangerousplaceInfo.rvalue}</td>
  </tr>
  <tr>
    <td height="72">单元内主要装置、设施及生产（储存）规模</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.unitsize}</td>
  </tr>
  <tr>
    <td height="50">是否位于化工（工业）园区</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.ispark}</td>
  </tr>
  <tr>
    <td height="78">危险场所与周边重点防护目标最近距离情况（m）</td>
     <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.distance}</td>
  </tr>
  <tr>
    <td height="53">厂区边界外500m范围内人数估算值</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.estimatedvalue}</td>
  </tr>
  <tr>
    <td height="121">近三年内危险化学品事故情况</td>
   <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.situation}</td>
  </tr>
</table>
<br>

<table width="1022" height="28" border="1" align="center" cellspacing="0" bordercolor="#000000">
  <tr>
    <th width="23" rowspan="2" scope="col"><p>序</p>
    <p>号</p></th>
    <th width="180" rowspan="2" scope="col">危险化学品名称</th>
    <th width="113" rowspan="2" scope="col">危险性类别</th>
    <th width="61" rowspan="2" scope="col">UN编号</th>
    <th width="130" rowspan="2" scope="col">生产用途</th>
    <th width="130" rowspan="2" scope="col">生产工艺</th>
    <th colspan="4" scope="col">单个最大容器</th>
    <th width="110" rowspan="2" scope="col">单元内危险化学品存量（t）</th>
    <th width="85" rowspan="2" scope="col"><p align="center">临界量（t）</p>
    </th>
  </tr>
  <tr>
     <th width="85" scope="col">物理状态</th>
    <th width="85" scope="col">操作温度（℃）</th>
    <th width="85" scope="col">操作压力（Mpa）</th>
    <th width="85" scope="col">存量（t）</th>
  </tr>
  <c:set var="i" value="0" ></c:set>
  <c:forEach var="dangerousplaceInfo" items="${sessionScope.dangerousplaceInfo.list}">

     <tr>
     <td>${i+1}</td>
     <td>${dangerousplaceInfo.dangercargoname}</td>
     <td>${dangerousplaceInfo.materials.type}</td>
     <td>${dangerousplaceInfo.dangernumber}</td>
     <td>${dangerousplaceInfo.dangeruse}</td>
     <td>${dangerousplaceInfo.dangertech}</td>
     <td>${dangerousplaceInfo.physical}</td>
     <td>${dangerousplaceInfo.dangercartem}</td>
     <td>${dangerousplaceInfo.dangermpa}</td>
     <td>${dangerousplaceInfo.dangerstore}</td>
     <td>${dangerousplaceInfo.dangerunitstore}</td>
     <td>${dangerousplaceInfo.materials.thresholdQuantity}</td>
     
     </tr>
     <c:set var="i" value="${i+1}"></c:set>
  </c:forEach>

</table>
<table width="843" align="center" cellspacing="0">
  <tr>
    <td width="56" height="44" align="center">填表人</td>
    <td width="142">&nbsp;${sessionScope.dangerousplaceInfo.formpeople}</td>
    <td width="176" align="center">联系电话</td>
    <td width="202">&nbsp;${sessionScope.dangerousplaceInfo.phonenumber}</td>
    <td width="110" align="center">填表时间</td>
    <td width="117">&nbsp;${sessionScope.dangerousplaceInfo.formdate}</td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
		

</body>
</html>