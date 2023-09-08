<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//배열 값이  null일 경우 jsp에서 해당 HTML 코드를 비활성화 시키는 방법
try{
List<ArrayList<String>> member_data= (List<ArrayList<String>>)request.getAttribute("member_data");
int many = member_data.size();
String aa = null;
}catch(Exception e){
out.print("오류발생");

}
%>
<%if(aa != null){ %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 리스트 페이지</title>
</head>
<body>
<p>회원가입 고객 리스트 가입자 수  : <%=many %>명</p>
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
<%
	int w =0 ;
	do{
%>
	<tr align="center">
	<td><%=many-w%></td>
	<td><%=member_data.get(w).get(1)%></td>
	<td><%=member_data.get(w).get(2)%></td>
	<td><%=member_data.get(w).get(3)%></td>
	<td><%=member_data.get(w).get(4)%></td>
	<td><%=member_data.get(w).get(5).substring(0,10)%></td>
	</tr>
<%
	w++;
	}while(w < many);
%>
</tbody>
</table>
<br><br>
<form id="f" method="get" action="./spring6ok.do" onsubmit="return idsearch()"> <!-- 검색은 get으로 -->
검색 : <input type="text" name="search">
<input type="submit" value="검색">
</form>
</body>
<%} %>
<script>
/*
 trim() => 앞,뒤에 공백만 삭제
 replace => 첫번째 관련 단어만 변경
 replaceAll => 모든 단어를 확인 하여 해당 단어로 변경
 */
var word = "홍길동님 환 영 합 니 다. ";
var word2 = word.trim();
var word3 = word.replace(" " ,"");
var word4 = word.replaceAll(" " ,"");
//console.log(word);
//console.log(word2);
//console.log(word3);
//console.log(word4);

var word_1 ="장바구니의 정보를 출력하는 페이지 바구니"
var word_1_1 = word_1.replace("바구니" ,"aaa");
var word_1_2 = word_1.replaceAll("바구니" ,"aaa");
//console.log(word_1_1);
//console.log(word_1_2);

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