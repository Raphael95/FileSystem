<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="service.imp.ProfessionalService" %>
<%@ page import="service.imp.InstitudeService" %>
<%@ page import="domain.Professional" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>淮阴工学院文件管理系统</title>
<style type="text/css">
	 #option{position: absolute;border:1px solid gray;width:1200px;height:50px;top:80px;left:75px;}
</style>
</head>
<body>
<jsp:useBean id="professional" class="service.imp.ProfessionalService" scope="session"></jsp:useBean>
<jsp:useBean id="institude" class="service.imp.InstitudeService" scope="session"></jsp:useBean>
<div id="header">
	<jsp:include page="Header.jsp"/>
</div>
<div id="main">
	<div id="left"></div>
	<div id="center">
		 <div id="option">
		 	<form action="ShowPlan.jsp" method="post">
		<table>
		<tr>
			<td>
				<label>选择专业 ： </label>
			</td>
			<td>
				<select name="professional">
<%
	List<Professional> Pro=professional.getProByInstId(institude.getInstByInstName(request.getParameter("institude")).getInstId());
	for(Professional p:Pro){
		System.out.println(p.getInstId());
%>	
				<option value=<%=p.getProName()%>><%=p.getProName()%></option>
<% 
	}
%>
				</select>
			</td>
			<td>
				<label>选择年份：</label>
			</td>
			<td>
				<select name="year">
					<option value="2010">2010</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
				</select>
			</td>
			<td>
				<input type="submit" value="搜索文件">
			</td>
		</tr>
	</table>
	</form>
		 </div>
	</div>
	<div id="right">
	</div>
</div>
<div id="footer"></div>
</body>
</html>