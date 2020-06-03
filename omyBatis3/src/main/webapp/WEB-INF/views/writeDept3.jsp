<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>부서정보 입력</h2>
<c:if test="${msg!=null}">${msg }</c:if>
<form action="writeDept.do" method="post" name ="frm">
	<table>
	<tr><th>부서번호</th>
	<td><input type="number" name="deptno" required="required" maxlength="2">
	</td></tr>
	<tr><th>부서이름</th>
	<td><input type="text" name="dname" required="required">
	</td></tr>
	<tr><th>부서위치</th>
	<td><input type="text" name="loc" required="required" >
	</td></tr>
	<tr><td colspan="2">
	<input type="submit" value="확인"></td></tr>
</table>
입력된 부서번호:<c:if test="${dept.odeptno!=null }">${dept.odeptno }</c:if><p>
입력된 부서이름:<c:if test="${dept.odname!=null }">${dept.odname }</c:if><p>
입력된 부서위치:<c:if test="${dept.oloc!=null }">${dept.oloc }</c:if><p>
	   <h2>부서 정보 List</h2>
	   <table>
		<tr><th>부서명</th><th>부서이름</th><th>근무지</th></tr>
		<c:forEach var="listDept" items="${listDept}">
			<tr><td>${listDept.odeptno }</td>
			    <td>${listDept.odname }</td>
				<td>${listDept.oloc }</td>
			</tr>
		</c:forEach>
	   </table>     
</form>
</body>
</html>
 




