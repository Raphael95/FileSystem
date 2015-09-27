<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="service.imp.CoursePlanService" %>
<%@ page import="domain.CoursePlan" %>
<%@ page import="service.imp.FileService" %>
<%@ page import="domain.FileUp" %>
<%@ page import="domain.Professional" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>淮阴工学院文件管理系统</title>
</head>
<body>
<jsp:useBean id="coursePlan" class="service.imp.CoursePlanService" scope="session"></jsp:useBean>
<jsp:useBean id="file" class="service.imp.FileService" scope="session"></jsp:useBean>
<jsp:useBean id="professional" class="service.imp.ProfessionalService"></jsp:useBean>
<%
	String proId=professional.getProByProName(request.getParameter("professional")).getProId();
	System.out.println(proId);
	String year=request.getParameter("year");
	System.out.println(year);
	CoursePlan cp=coursePlan.getCoursePlanByProYear(proId, year);
	System.out.println(cp.getCpId());
	FileUp f=file.getFileByCpId(cp.getCpId());
%>
	
<div id="header">
	<jsp:include page="Header.jsp"></jsp:include>
</div>
<div id="main">
	<div id="left"></div>
	<div id="center">
		<table>
			<tr>
				<td>
					<%=f.getFileName() %>
				</td>
			</tr>
			<tr>
				<td>
					专业： <%=request.getParameter("professional")%>
				</td>
			</tr>
			<tr>
				<td>
					年级： <%=year%>
				</td>
			</tr>
			<tr>
				<td>
					文件类型： <%=f.getType() %>
				</td>
			</tr>
		</table>
	</div>
	<div id="right"></div>
</div>
<div id="footer"></div>
</body>
</html>