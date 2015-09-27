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
<title>Insert title here</title>
<style type="text/css">
        body {margin:0;padding:0;
        }
        #head {
            background-image: url(images/logo.png);
            background-color: black;
            height: 60px;
            width: 1365px;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }
        #menu {
            color: white;
            font-size: 20px;
            margin: 0;
            padding: 0;
        }
            #menu table tr td {
                width: 120px;
                height: 58px;
                line-height: 58px;
                text-align:center;
                margin: 0;
                padding: 0;
            }
            #menu table {
                position: relative;
                left: 230px;
                margin: 0;
                padding: 0;
            }
                #menu table tr td:hover {
                    background-color: gray;
                    margin: 0;
                    padding: 0;
                    cursor: pointer;
                }
        #inputSearch {
            position: relative;
            border:0px;
            left: 630px;
            top:-60px;
            margin: 0;
            padding: 0;
            height: 27px;
            padding: 2px 5px 3px 5px;
            width: 270px;
        }
        #searchlogo {
            position: relative;
            left: 593px;
            top: -47px;
        }
            #searchlogo:hover {
                cursor: pointer;
            }
        #submit1 {
            background-color: red;
            border-radius: 5px;
            width: 100px;
            height: 35px;
            color: white;
            font-size: 17px;
            border: none;
            position: relative;
            left: 1230px;
            top: -93px;
        }
            #submit1:hover {
                cursor: pointer;
                background-color: #CC0033;
            }
        .center1{position: absolute;border:1px solid gray;width:400px;height:160px;top:180px;left:230px;}
        .center2{position: absolute;border:1px solid gray;width:400px;height:160px;top:372px;left:230px;}
        .center3{position: absolute;border:1px solid gray;width:400px;height:160px;top:564px;left:230px;}
        .center4{position: absolute;border:1px solid gray;width:400px;height:160px;top:564px;left:720px;}
        .center5{position: absolute;border:1px solid gray;width:400px;height:160px;top:372px;left:720px;}
        .center6{position: absolute;border:1px solid gray;width:400px;height:160px;top:180px;left:720px;}
        .center1:hover{border:3px solid gray;top:179px;left:229px;cursor: pointer;}
        .center2:hover{border:3px solid gray;top:371px;left:229px;cursor: pointer;}
        .center3:hover{border:3px solid gray;top:563px;left:229px;cursor: pointer;}
        .center4:hover{border:3px solid gray;top:563px;left:719px;cursor: pointer;}
        .center5:hover{border:3px solid gray;top:371px;left:719px;cursor: pointer;}
        .center6:hover{border:3px solid gray;top:179px;left:719px;cursor: pointer;}
        #center{position: absolute;border:1px solid gray;width:1000px;height:605px;top:150px;left:175px;}
        #option{position: absolute;border:1px solid gray;width:1200px;height:50px;top:80px;left:75px;}
        .jncenter{border:1px solid black;width:239px;height:160px;margin:0;float:right;}
        .kncenter{border:1px solid black;width:159px;height:160px;margin:0;}
    </style>
</head>
<body>
<jsp:useBean id="professional" class="service.imp.ProfessionalService" scope="session"></jsp:useBean>
<jsp:useBean id="coursePlan" class="service.imp.CoursePlanService" scope="session"></jsp:useBean>
<jsp:useBean id="file" class="service.imp.FileService" scope="session"></jsp:useBean>
<jsp:useBean id="courseService" class="service.imp.CourseService" scope="session"></jsp:useBean>
<%
	String professional1=request.getParameter("professional");
	String proId;
	String year;
	if(request.getParameter("professional")==null)
	{
		proId=request.getParameter("proId");
		year=request.getParameter("year");
		System.out.println(proId);
	}
	else{
		proId=professional.getProByProName(professional1).getProId();
		year=request.getParameter("year");
	}
		
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
<div id="head">
     <jsp:include page="Header.jsp"></jsp:include>
</div>
<div id="center"></div>
<%
	if(1<=cp.size()){
%>
		<div class="center1">
    	<div class="jncenter">
    				<table>
						<tr>
							<td>
								<%=file.getFileByCpId(cp.get(0).getCpId()).getFileName() %>
							</td>
						</tr>
						<tr>
							<td>
								学分： <%=courseService.getCourseBycId(cp.get(0).getCourseId()).getCredit() %>
							</td>
						</tr>
						<tr>
							<td>
								学时： <%=courseService.getCourseBycId(cp.get(0).getCourseId()).getPeriod() %>
							</td>
						</tr>
						<tr>
							<td>
								考核方式： <%=courseService.getCourseBycId(cp.get(0).getCourseId()).getCheckWay() %>
							</td>
						</tr>
					</table>
    	</div>
    	<div class="kncenter">
    		<img src="images/fex/doc.png" width="100px" height="100px">
    	</div>
    </div>
<% 
	}
	if(2<=cp.size()){
%>
		<div class="center2">
    	<div class="jncenter">
    		<table>
						<tr>
							<td>
								<%=file.getFileByCpId(cp.get(1).getCpId()).getFileName() %>
							</td>
						</tr>
						<tr>
							<td>
								学分： <%=courseService.getCourseBycId(cp.get(1).getCourseId()).getCredit() %>
							</td>
						</tr>
						<tr>
							<td>
								学时： <%=courseService.getCourseBycId(cp.get(1).getCourseId()).getPeriod() %>
							</td>
						</tr>
						<tr>
							<td>
								考核方式： <%=courseService.getCourseBycId(cp.get(1).getCourseId()).getCheckWay() %>
							</td>
						</tr>
					</table>
    	</div>
    	<div class="kncenter">
    		<img src="images/fex/doc.png" width="100px" height="100px">
    	</div>
    </div>
<%
	}
	if(3<=cp.size()){
%>
		<div class="center3">
    	<div class="jncenter">
    		<table>
						<tr>
							<td>
								<%=file.getFileByCpId(cp.get(2).getCpId()).getFileName() %>
							</td>
						</tr>
						<tr>
							<td>
								学分： <%=courseService.getCourseBycId(cp.get(2).getCourseId()).getCredit() %>
							</td>
						</tr>
						<tr>
							<td>
								学时： <%=courseService.getCourseBycId(cp.get(2).getCourseId()).getPeriod() %>
							</td>
						</tr>
						<tr>
							<td>
								考核方式： <%=courseService.getCourseBycId(cp.get(2).getCourseId()).getCheckWay() %>
							</td>
						</tr>
					</table>
    	</div>
    	<div class="kncenter">
    		<img src="images/fex/doc.png" width="100px" height="100px">
    	</div>
    </div>
<% 
	}
	if(4<=cp.size()){
%>
		<div class="center4">
    	<div class="jncenter">
    		<table>
						<tr>
							<td>
								<%=file.getFileByCpId(cp.get(3).getCpId()).getFileName() %>
							</td>
						</tr>
						<tr>
							<td>
								学分： <%=courseService.getCourseBycId(cp.get(3).getCourseId()).getCredit() %>
							</td>
						</tr>
						<tr>
							<td>
								学时： <%=courseService.getCourseBycId(cp.get(3).getCourseId()).getPeriod() %>
							</td>
						</tr>
						<tr>
							<td>
								考核方式： <%=courseService.getCourseBycId(cp.get(3).getCourseId()).getCheckWay() %>
							</td>
						</tr>
					</table>
    	</div>
    	<div class="kncenter">
    		<img src="images/fex/doc.png" width="100px" height="100px">
    	</div>
    </div>
<%
	}
	if(5<=cp.size()){
%>
		<div class="center5">
    	<div class="jncenter">
    		<table>
						<tr>
							<td>
								<%=file.getFileByCpId(cp.get(4).getCpId()).getFileName() %>
							</td>
						</tr>
						<tr>
							<td>
								学分： <%=courseService.getCourseBycId(cp.get(4).getCourseId()).getCredit() %>
							</td>
						</tr>
						<tr>
							<td>
								学时： <%=courseService.getCourseBycId(cp.get(4).getCourseId()).getPeriod() %>
							</td>
						</tr>
						<tr>
							<td>
								考核方式： <%=courseService.getCourseBycId(cp.get(4).getCourseId()).getCheckWay() %>
							</td>
						</tr>
					</table>
    	</div>
    	<div class="kncenter">
    		<img src="images/fex/doc.png" width="100px" height="100px">
    	</div>
    </div>
<% 
	}
	if(6<=cp.size()){
%>
		<div class="center6">
		<div class="jncenter">
    		<table>
						<tr>
							<td>
								<%=file.getFileByCpId(cp.get(5).getCpId()).getFileName() %>
							</td>
						</tr>
						<tr>
							<td>
								学分： <%=courseService.getCourseBycId(cp.get(5).getCourseId()).getCredit() %>
							</td>
						</tr>
						<tr>
							<td>
								学时： <%=courseService.getCourseBycId(cp.get(5).getCourseId()).getPeriod() %>
							</td>
						</tr>
						<tr>
							<td>
								考核方式： <%=courseService.getCourseBycId(cp.get(5).getCourseId()).getCheckWay() %>
							</td>
						</tr>
					</table>
    	</div>
    	<div class="kncenter">
    		<img src="images/fex/doc.png" width="100px" height="100px">
    	</div>
    </div>
<% 
	}
%>   

	<table>
		<tr>
			<td>
				总共<%=allPage %>页，当前位于第<%=pageNo %>页
				<%
				if(pageNo>1){
%>
				<a href="ShowSyllabus.jsp?No=<%=pageNo-1 %>&proId=<%=proId %>&year=<%=year %>">上一页</a>
<%
				}
				if(pageNo<allPage)
				{
%>
				<a href="ShowSyllabus.jsp?No=<%=pageNo+1 %>&proId=<%=proId %>&year=<%=year %>">下一页</a>
<%
				}
%>
			</td>
		</tr>
	</table>
</body>
</html>