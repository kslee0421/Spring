<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//배열 값이  null일 경우 jsp에서 해당 HTML 코드를 비활성화 시키는 방법
List<ArrayList<String>>product_data= (List<ArrayList<String>>)request.getAttribute("product_data");
int many = product_data.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
</head>
<body>
<table border="1" width="1000">
<thead>
	<tr>
	<th width="5%">번호</th>
	<th width="20%">상품코드</th>
	<th width="30%">상품명</th>
	<th width="20%">상품가격</th>
	<th width="5%">수정/삭제</th>
	</tr>
</thead>
<tbody>
<!-- database의 내용이 출력되는 파트 -->
<!-- 배열값 중 첫번째 아이디 값을 확인하여 값이 없을 경우에 대한 조건 -->
<% 
	int w =0 ;
	do{
	%>
	<tr align="center">
		<td><%=many-w%></td>
		<td><%=product_data.get(w).get(1)%></td>
		<td><%=product_data.get(w).get(2)%></td>
		<td><%=product_data.get(w).get(3)%></td>
		<td>null</td>
	</tr>
	<%
	w++;
	} while(w < many);
%>
</tbody>
</table>
</body>
</html>