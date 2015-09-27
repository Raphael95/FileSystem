<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="service.imp.ProfessionalService" %>
<%@ page import="domain.CoursePlan" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.FileUp" %>
<%@ page import="service.imp.FileService" %>
<%@ page import="domain.Course" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������ѧԺ�ļ�����ϵͳ</title>
</head>
<body>
<jsp:useBean id="professional" class="service.imp.ProfessionalService" scope="session"></jsp:useBean>
<jsp:useBean id="coursePlan" class="service.imp.CoursePlanService" scope="session"></jsp:useBean>
<jsp:useBean id="file" class="service.imp.FileService" scope="session"></jsp:useBean>
<jsp:useBean id="courseService" class="service.imp.CourseService" scope="session"></jsp:useBean>
<%
	String professional1=request.getParameter("professional");
	String proId=professional.getProByProName(professional1).getProId();
	System.out.println(proId);
	String year=request.getParameter("year");
	int pageNo=0;
	int allPage=coursePlan.allPage(6, proId, year);
	if(request.getParameter("No")==null)
		{
			pageNo=1;
		}
	else
		{
			pageNo=Integer.parseInt(request.getParameter("No"));
			System.out.println(pageNo);
		}
	List<CoursePlan> cp=coursePlan.getCoursePlanByOrder(pageNo, 6, proId, year);
%>
<div id="header">
	<jsp:include page="Header.jsp"></jsp:include>
</div>
<div id="main">
	<div id="left"></div>
	<div id="center">
	<table>
		<tr>
			<%
			for(CoursePlan courseplan:cp){
				FileUp files=file.getFileByCpId(courseplan.getCpId());
				Course cs=courseService.getCourseBycId(courseplan.getCourseId());
					System.out.println(cs.getCourseName());
		%>
				<td>
					<table>
						<tr>
							<td>
								<%=files.getFileName() %>
							</td>
						</tr>
						<tr>
							<td>
								ѧ�֣� <%=cs.getCredit() %>
							</td>
						</tr>
						<tr>
							<td>
								ѧʱ�� <%=cs.getPeriod() %>
							</td>
						</tr>
						<tr>
							<td>
								���˷�ʽ�� <%=cs.getCheckWay() %>
							</td>
						</tr>
					</table>
				</td>
		<%
			}
		%>
		</tr>
	</table>
	<form action="SyllabusResult.jsp" method="post">
	<table>
		<tr>
			<td>
				�ܹ�<%=allPage %>ҳ����ǰλ�ڵ�<%=pageNo %>ҳ
				<%
				if(pageNo>1){
%>
				<a href="SyllabusResult.jsp?No=<%=pageNo-1 %>&professional=<%=professional1 %>&year=<%=year %>">��һҳ</a>
<%
				}
				if(pageNo<allPage)
				{
%>
				<a href="SyllabusResult.jsp?No=<%=pageNo+1 %>&professional=<%=professional1 %>&year=<%=year %>">��һҳ</a>
<%
				}
%>
			</td>
		</tr>
	</table>
	</form>
	</div>
	<div id="right"></div>
</div>
<div id="footer"></div>
</body>
</html>