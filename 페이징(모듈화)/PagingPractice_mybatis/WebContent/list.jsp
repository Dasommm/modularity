<%@page import="com.paging.dto.PagingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	a{
		text-decoration: none;
		color: black
	}
	a:visited{
		text-decoration: none;
		color: black;
	}
	a:hover{
		color: red;
	}

	.under{
		text-align: center;
	}
</style>
</head>
<%
	PagingDto currentpage = (PagingDto)request.getAttribute("pagingdto");
	int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
	int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
	int endseq = currentpage.getUnderpagescale() * pagegroup;
	int totalpage = currentpage.getTotalpage();
	
	System.out.println(pagegroup);
	System.out.println(startseq);
	System.out.println(endseq);
	System.out.println(totalpage);
%>
<body>

	<table border="1" style="margin-left: auto; margin-right: auto;">
		<col width="75">
		<col width="150">
		<col width="300">
		<col width="250">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td>- - - - - - - - - - 게시글이 존재하지 않습니다 - - - - - - - - - -</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<tr align="center">
					<td>${dto.seq }</td>
					<td>${dto.writer }</td>
					<td><a href="">${dto.title }</a></td>
					<td>${dto.regdate }</td>
				</tr>
			</c:forEach>

		</c:otherwise>
	</c:choose>	
	</table>
	<div class="under">
<%
	if(pagegroup > 1){
%>	
	<a href="paging.do?command=list&currentpage=<%=startseq-1 %>">&lt;&lt;prev</a>
<%
	}
	for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
	<a href="paging.do?command=list&currentpage=<%=pagenum %>"><%=pagenum %></a>	
<%
	}
	if(endseq < currentpage.getTotalpage()){
%>
	<a href="paging.do?command=list&currentpage=<%=endseq+1 %>">next&gt;&gt;</a>
<%		
	}

%>
</div>	
</body>
</html>