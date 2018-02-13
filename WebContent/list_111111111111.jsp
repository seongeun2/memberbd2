<%@page import="member.memVO"%>
<%@page import="member.memDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>
<%
memDAO dao = memDAO.getInstance();
int count = 0;
List memList = null;
count = dao.SelectCountMem();
if(count>0){
	memList = dao.memList();
}
%>

<p class="w3-left" style="padding-left: 30px;">
</p>
<div class="w3-container" style="width: 70%; margin: 0 auto;">
	<span class="w3-center w3-large">
	</span>
	<p class="w3-right w3-padding-right-large"><a href="writeForm.jsp">Haru 회원등록</a></p>
	
	회원수는 총 <%=count %> 명 입니다.
	<table class="w3-table-all" width="700">
		<tr style="background-color:rgba(255, 0, 0, 0.4);">
			<td align="center" width="50">번호</td>
			<td align="center" width="50">아이디</td>
			<td align="center" width="50">이름</td>
			<td align="center" width="70">생년월일</td>
			<td align="center" width="50">가입일시</td>
			<td align="center" width="50">회원등급</td>
			
		<%
		if(count==0){
		%>
			<tr height="30">
				<td colspan="6" style="text-align: center;">등록된 사용자가 없습니다.</td>
			</tr>
		<%
		}else{
		%>	
		<%
		for(int i=0; i<memList.size(); i++){
			memVO member = (memVO) memList.get(i);
		%>	
		<tr height="30">
		<!-- 상세보기 페이지 num을 넘겨준다 -->
		
			<td align="center" width="50"><%=member.getM_num()%></td>
			<td width="50"><a href="content.jsp?memnum=<%=member.getM_num()%>"><%=member.getM_id() %></a></td>
			<td align="center" width="50"><%=member.getM_name() %> </td>
			<td align="center" width="70"><%=member.getM_birth() %></td>
			<td align="center" width="50"><%=member.getM_reg_date() %></td>
			<td align="center" width="50"><%=member.getM_level() %></td>
		</tr><%} %>
		<%} %>
	</table>
</div>
</body>
</html>