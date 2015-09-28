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
<jsp:useBean id="coursePlan" class="service.imp.CoursePlanService" scope="session"></jsp:useBean>
<jsp:useBean id="file" class="service.imp.FileService" scope="session"></jsp:useBean>
<jsp:useBean id="professional" class="service.imp.ProfessionalService"></jsp:useBean>
<%
	String proId=professional.getProByProName(request.getParameter("professional")).getProId();
	System.out.println(proId);
	String year=request.getParameter("year");
	System.out.println(year);
	CoursePlan cp=coursePlan.getCoursePlanByProYear(proId, year);
	System.out.println(coursePlan.getCoursePlanByProYear(proId, year).getCpId());
	FileUp f=file.getFileByCpId(coursePlan.getCoursePlanByProYear(proId, year).getCpId());
	String source="/upload/";
	String path=source+f.getFileName();
	System.out.println(path);
%>
	
<div id="head">
      <jsp:include page="Header.jsp"></jsp:include>
    </div>
  
    <div id="center"></div>
    <div class="center1">
    	<div class="jncenter">
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
			<tr>
				<td>
					<a href="DownServlet?path=<%=getServletContext().getRealPath(path) %>&fileId=<%=f.getFileId() %>"><img src="images/down.jpg"></a>
				</td>
			</tr>
		</table>
    	</div>
    	<div class="kncenter">
    		<img src="images/fex/doc.png" width="100px" height="100px">
    	</div>
    </div>
   
</body>
</html>