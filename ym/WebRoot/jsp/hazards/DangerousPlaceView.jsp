<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="gb2312" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӡԤ��</title>


</head>

<body>
<h2 align="center" style="font-style: normal">Σ�ջ�ѧƷΣ�ճ�������������</h2>
<table width="1020" height="553" border="1" align="center" cellspacing="0" bordercolor="#000000">
  <tr>
    <td width="259" height="44">������λ</td>
    <td colspan="4">${sessionScope.dangerousplaceInfo.corpName}</td>
  </tr>
  <tr>
    <td height="46">Σ�ճ�������</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.dangerplacename}</td>
  </tr>
  <tr>
    <td height="49">Σ�ճ������ڵ�ַ</td>
     <td width="468">&nbsp;${sessionScope.dangerousplaceInfo.dangerplaceadress}</td>
    <td width="131">Σ�ճ���Ͷ��ʱ��</td>
    <td width="144" colspan="2">&nbsp;${sessionScope.dangerousplaceInfo.dangerplacetime}</td>
  </tr>
  <tr>
    <td height="38">Σ�ճ�������</td>
     <td>&nbsp;${sessionScope.dangerousplaceInfo.dangerplacelevel}</td>
    <td>Rֵ</td>
    <td colspan="2">&nbsp;${sessionScope.dangerousplaceInfo.rvalue}</td>
  </tr>
  <tr>
    <td height="72">��Ԫ����Ҫװ�á���ʩ�����������棩��ģ</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.unitsize}</td>
  </tr>
  <tr>
    <td height="50">�Ƿ�λ�ڻ�������ҵ��԰��</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.ispark}</td>
  </tr>
  <tr>
    <td height="78">Σ�ճ������ܱ��ص����Ŀ��������������m��</td>
     <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.distance}</td>
  </tr>
  <tr>
    <td height="53">�����߽���500m��Χ����������ֵ</td>
    <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.estimatedvalue}</td>
  </tr>
  <tr>
    <td height="121">��������Σ�ջ�ѧƷ�¹����</td>
   <td colspan="4">&nbsp;${sessionScope.dangerousplaceInfo.situation}</td>
  </tr>
</table>
<br>

<table width="1022" height="28" border="1" align="center" cellspacing="0" bordercolor="#000000">
  <tr>
    <th width="23" rowspan="2" scope="col"><p>��</p>
    <p>��</p></th>
    <th width="180" rowspan="2" scope="col">Σ�ջ�ѧƷ����</th>
    <th width="113" rowspan="2" scope="col">Σ�������</th>
    <th width="61" rowspan="2" scope="col">UN���</th>
    <th width="130" rowspan="2" scope="col">������;</th>
    <th width="130" rowspan="2" scope="col">��������</th>
    <th colspan="4" scope="col">�����������</th>
    <th width="110" rowspan="2" scope="col">��Ԫ��Σ�ջ�ѧƷ������t��</th>
    <th width="85" rowspan="2" scope="col"><p align="center">�ٽ�����t��</p>
    </th>
  </tr>
  <tr>
     <th width="85" scope="col">����״̬</th>
    <th width="85" scope="col">�����¶ȣ��棩</th>
    <th width="85" scope="col">����ѹ����Mpa��</th>
    <th width="85" scope="col">������t��</th>
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
    <td width="56" height="44" align="center">�����</td>
    <td width="142">&nbsp;${sessionScope.dangerousplaceInfo.formpeople}</td>
    <td width="176" align="center">��ϵ�绰</td>
    <td width="202">&nbsp;${sessionScope.dangerousplaceInfo.phonenumber}</td>
    <td width="110" align="center">���ʱ��</td>
    <td width="117">&nbsp;${sessionScope.dangerousplaceInfo.formdate}</td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
		

</body>
</html>