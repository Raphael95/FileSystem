<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="dao.imp.ProfessionalDAO" %>
<%@ page import="dao.imp.CoursePlanDAO" %>
<%@ page import="dao.imp.FileDAO" %>
<%@ page import="domain.FileUp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>淮阴工学院文件管理系统</title>
<style type="text/css">
ul{list-style: none;}
li{padding:5px;}
</style>
</head>
<body>
	<script type="text/javascript">
		function validate() {
			if (form1.file.value == "") {
				alert("请选择要上传的文件");
				return false;
			}
		}
	</script>
	<!-- 定义表单 -->
	<form action="UploadServlet" method="post"
		enctype="multipart/form-data" name="form1" id="form1"
		onsubmit="return validate()">
		<table>
			<tr>
				<td>
					<label>选择专业：</label>
				</td>
				<td>
					<select name="professional">
						<option value="软件工程">软件工程</option>
						<option value="计算机科学与技术（嵌入式）">计算机科学与技术（嵌入式）</option>
						<option value="软件工程（达内）">软件工程（达内）</option>
						<option value="软件工程（东软）">软件工程（东软）</option>
						<option value="物联网工程">物联网工程</option>
						<option value="网络工程">网络工程</option>
					</select>
				</td>
				<td>
					<input type="radio" name="t" value="培养计划">培养计划
					<input type="radio" name="t" value="教学大纲">教学大纲
				</td>
			</tr>
			
			<tr>
				<td>
					<label>请输入课程号</label>
				</td>
				<td>
					<input type="text" name="courseId">
				</td>
				<td>
					<label>（上传的文件若是培养计划则此项不填）</label>
				</td>
			</tr>
			<tr>
				<td>
					<label>请选择开课学期</label>
				</td>
				<td>
					<select name="semester">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
				</td>
				<td>
					<label>（上传的文件若是培养计划则此项不选）</label>
				</td>
			</tr>
			<tr>
				<td>
					<label>文件的年份</label>
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
			</tr>
		</table>
		<ul>
			<li>请选择要上传的附件：</li>
			<li>上传文件： <input type="file" name="file" /> <!-- 文件上传组件 --></li>
			<li>
				<input type="submit" name="Submit" value="上传" /> 
				<input type="reset" name="Submit2" value="重置" />
			</li>
		</ul>
		<%
			if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
				out.println("<script >alert('" + request.getAttribute("result")
						+ "');</script>"); //页面显示提示信息    	  
			}
		%>
	</form>
</body>
</html>