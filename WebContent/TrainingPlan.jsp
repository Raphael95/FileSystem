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
<link rel="stylesheet" href="css/style1.css" type="text/css"/>
<link rel="stylesheet" href="css/luara.css" type="text/css"/>
<style type="text/css">
body,ul,li,ol,img{margin: 0;padding: 0;}
li{list-style: none;}
#left {position:relative;left:200px;top:130px;}
#left .example ol{position:relative;width: 80px;height: 20px;top:-30px;left:60px;}
#left .example ol li{float:left;width: 10px;height: 10px;margin: 5px;background: #fff;}
#left .example ol li.seleted{background: #1AA4CA;}
#center{position:relative;left:750px;top:-230px;}
#img{position:relative;left:-20px;}
</style>
</head>
<body>
<div id="header"></div>
<div id="main">
	<div id="left">
	<script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.luara.0.0.1.min.js"></script>
    <div class="example">
        <ul>
            <li><img src="images/1.jpg" alt="1" /></li>
            <li><img src="images/2.jpg" alt="2" /></li>
            <li><img src="images/3.jpg" alt="3" /></li>
            <li><img src="images/4.jpg" alt="4" /></li>
        </ul>
        <ol>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ol>
    </div>
    <script>
        $(function(){
            $(".example").luara({width:"500",height:"334",interval:3000,selected:"seleted"});
        });
    </script>
    </div>
	<div id="center">
	<form action="ShowResult.jsp" method="post">
		<img id="img" src="images/huaiyin.png" alt="" /><br/><br/><br/>
		<table>
			<tr>
				<td>
					<label><a style="font-size:25px;font-family:楷体">选择学院 :</a></label>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>	
				<td>
					<select name="institude" >
						<option value="机械与材料工程学院">机械与材料工程学院</option>
						<option value="自动化学院">自动化学院</option>
						<option value="电子信息工程学院">电子信息工程学院</option>
						<option value="计算机与软件工程学院">计算机与软件工程学院</option>
						<option value="建筑工程学院">建筑工程学院</option>
						<option value="化学工程学院">化学工程学院</option>
						<option value="生命科学与食品工程学院">生命科学与食品工程学院</option>
						<option value="交通工程学院">交通工程学院</option>
						<option value="管理工程学院">管理工程学院</option>
						<option value="商学院">商学院</option>
						<option value="数理学院">数理学院</option>
						<option value="人文学院">人文学院</option>
						<option value="外国语学院">外国语学院</option>
						<option value="设计艺术学院">设计艺术学院</option>
					</select>
				</td>
				<td>&nbsp;</td>
			</tr>	
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
					<input type="submit" value="确定">
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
					<a href="Syllabus.jsp" style=" text-decoration:none;font-size:20px;">查找教学计划</a>
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