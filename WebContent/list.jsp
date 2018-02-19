<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="member.memVO"%>
<%@page import="member.memDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="/memberboard/css/list2.css" rel="stylesheet" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
//페이지처리
int pageSize = 5;
String pageNum = request.getParameter("pageNum");
if(pageNum==null || pageNum==""){
	pageNum="1"; }
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1) * pageSize;
int endRow = currentPage * pageSize;

memDAO dao = memDAO.getInstance();
int count = 0;
List memList = null;
count = dao.SelectCountMem();
if(count>0){
	memList = dao.memList(startRow, endRow);
}


%>
<body>
<div class="container" style="margin-top: 30px;">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
 <div class="mail-box">
 <aside class="lg-side">
 <div class="inbox-head" style="height: 90px";>
<h3 text-align="center">Haru 회원관리 (회원수 <%=count %> 명)</h3>
<form action="#" class="pull-right position">
	<div class="input-append">
		<p class="w3-right w3-padding-right-large"><a href="writeForm.jsp">Haru 회원등록</a></p>
    </div>

</div>
<div class="inbox-body">
	<div class="mail-option">
	
		<table class="table table-inbox table-hover">
			<tbody>
            	<tr class="unread">
                	<td class="view-message" align="center" width="50">회원번호</td>
                    <td class="view-message" align="center" width="50">아이디</td>
                    <td class="view-message" align="center" width="50">이름</td>
                    <td class="view-message" align="center" width="70">생년월일</td>
                    <td class="view-message" align="center" width="50">가입일시</td>
                    <td class="view-message" align="center" width="50">회원등급</td>
              	</tr>
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
			<td align="center" width="50"><a href="content.jsp?memnum=<%=member.getM_num()%>"><%=member.getM_id() %></a></td>
			<td align="center" width="50"><%=member.getM_name() %> </td>
			<td align="center" width="70"><%=member.getM_birth() %></td>
			<td align="center" width="50"><%=member.getM_reg_date() %></td>
			<td align="center" width="50"><%=member.getM_level() %></td>
		</tr><%} %>
		<%} %>
	</table>
	
	<div class="w3-center" style="margin-top: 20px;">
	<%int bottomLine=3;
	if(count>0){int pageCount=count/pageSize+(count%pageSize==0?0:1);
	int startPage = 1+(currentPage-1)/bottomLine*bottomLine;
	int endPage = startPage+bottomLine-1;
	if(endPage>pageCount) endPage=pageCount;
	if(startPage>bottomLine){	%>
	<a href="list.jsp?pageNum=<%=startPage-bottomLine %>">[이전]</a>
	<%} %>
	<%for (int i=startPage; i<=endPage; i++){ %>
	<a href="list.jsp?pageNum=<%=i%>"><%
		if(i!=currentPage) out.print("["+i+"]");
		else out.print("<font color='red'>["+i+"]</font>");	%></a>
	<%}
		if(endPage<pageCount){ %>
		<a href="list.jsp?pageNum=<%=startPage+bottomLine%>">[다음]</a>
		<%}	} %>
	
		
	</div>
</body>
</html>