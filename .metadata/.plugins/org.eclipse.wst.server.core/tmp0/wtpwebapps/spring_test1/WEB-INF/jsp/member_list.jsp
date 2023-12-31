<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	int total = (int)request.getAttribute("total"); 
	
	List<ArrayList<String>> member_data= (List<ArrayList<String>>)request.getAttribute("member_data");
	
	int many = member_data.size();
	String part = (String)request.getAttribute("part");

	//out.print(part);
	// null 값을 조건에서 1순위로 체크 후 그리고 해당 데이터를 어떻게 처리할지를 코드를 작성
	String s = null;
	if(part != null && part.equals("tel")  ){
		s ="selected";
	}
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 리스트 페이지</title>
</head>
<body>
<p>회원가입 고객 리스트 가입자 수  : <%=total%>명</p>
<table border="1" width="1000">
<thead>
	<tr>
	<th width="5%">번호</th>
	<th width="20%">아이디</th>
	<th width="30%">이메일</th>
	<th width="20%">연락처</th>
	<th width="5%">나이</th>
	<th width="20%">가입일자</th>
	</tr>
</thead>
<tbody>
<!-- database의 내용이 출력되는 파트 -->
<!-- 배열값 중 첫번째 아이디 값을 확인하여 값이 없을 경우에 대한 조건 -->
<% if(member_data.get(0).get(1)== ""){ %>
<tr align="center">
<td colspan="6">검색한 내용을 찾을 수 없습니다.</td>
</tr>
	<%
}
else{
		int w =0 ;
		do{
	%>
		<tr align="center">
			<td><%=total%></td>
			<td><%=member_data.get(w).get(1)%></td>
			<td><%=member_data.get(w).get(2)%></td>
			<td><%=member_data.get(w).get(3)%></td>
			<td><%=member_data.get(w).get(4)%></td>
			<td><%=member_data.get(w).get(5).substring(0,10)%></td>
		</tr>
	<%
		w++;
		} while(w < many);
}
%>
</tbody>
</table>
<br><br>
<form id="f" method="get" action="./spring6ok.do" onsubmit="return idsearch()"> <!-- 검색은 get으로 -->
검색 : 
<!-- 검색시 분류 설정을 하여 검색이 되도록 함 -->
<select name="part">
<option value="id" selected>아이디</option>
<option value="tel" <%=s%>>연락처</option>
</select>
<input type="text" name="search">
<input type="submit" value="검색">
<input type="button" value="전체목록" onclick="alldata()">
</form>
</body>
<script>
//검색한 단어를 유지시키는 스크립트코드
var wd = window.location.search;
var sh =wd.split("&search=");
f.search.value = sh[1];

//console.log(data);
//document.getElementById("search").innerHTML =data2[1];
//document.getElementById("cate").innerHTML =data[1];

if(f.search.value=="undefined"){
	f.search.value = "";
}

function alldata(){
	location.href="./spring6ok.do";
}
function idsearch(){
	//입력에 따른 공백을 제거 후 조건문으로 재확인
	f.search.value = f.search.value.replaceAll(" ","");
	if(f.search.value==""){
		alert("검색할 단어를 입력하세요!!");
		return false;
	}
	else{
		return;
	}
}
</script>
</html>