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
<title>������ѧԺ�ļ�����ϵͳ</title>
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
					<label><a style="font-size:25px;font-family:����">ѡ��ѧԺ :</a></label>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>	
				<td>
					<select name="institude" >
						<option value="��е����Ϲ���ѧԺ">��е����Ϲ���ѧԺ</option>
						<option value="�Զ���ѧԺ">�Զ���ѧԺ</option>
						<option value="������Ϣ����ѧԺ">������Ϣ����ѧԺ</option>
						<option value="��������������ѧԺ">��������������ѧԺ</option>
						<option value="��������ѧԺ">��������ѧԺ</option>
						<option value="��ѧ����ѧԺ">��ѧ����ѧԺ</option>
						<option value="������ѧ��ʳƷ����ѧԺ">������ѧ��ʳƷ����ѧԺ</option>
						<option value="��ͨ����ѧԺ">��ͨ����ѧԺ</option>
						<option value="������ѧԺ">������ѧԺ</option>
						<option value="��ѧԺ">��ѧԺ</option>
						<option value="����ѧԺ">����ѧԺ</option>
						<option value="����ѧԺ">����ѧԺ</option>
						<option value="�����ѧԺ">�����ѧԺ</option>
						<option value="�������ѧԺ">�������ѧԺ</option>
					</select>
				</td>
				<td>&nbsp;</td>
			</tr>	
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
					<input type="submit" value="ȷ��">
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
					<a href="Syllabus.jsp" style=" text-decoration:none;font-size:20px;">���ҽ�ѧ�ƻ�</a>
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