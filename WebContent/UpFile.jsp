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
<title>������ѧԺ�ļ�����ϵͳ</title>
<style type="text/css">
ul{list-style: none;}
li{padding:5px;}
</style>
</head>
<body>
	<script type="text/javascript">
		function validate() {
			if (form1.file.value == "") {
				alert("��ѡ��Ҫ�ϴ����ļ�");
				return false;
			}
		}
	</script>
	<!-- ����� -->
	<form action="UploadServlet" method="post"
		enctype="multipart/form-data" name="form1" id="form1"
		onsubmit="return validate()">
		<table>
			<tr>
				<td>
					<label>ѡ��רҵ��</label>
				</td>
				<td>
					<select name="professional">
						<option value="�������">�������</option>
						<option value="�������ѧ�뼼����Ƕ��ʽ��">�������ѧ�뼼����Ƕ��ʽ��</option>
						<option value="������̣����ڣ�">������̣����ڣ�</option>
						<option value="������̣�����">������̣�����</option>
						<option value="����������">����������</option>
						<option value="���繤��">���繤��</option>
					</select>
				</td>
				<td>
					<input type="radio" name="t" value="�����ƻ�">�����ƻ�
					<input type="radio" name="t" value="��ѧ���">��ѧ���
				</td>
			</tr>
			
			<tr>
				<td>
					<label>������γ̺�</label>
				</td>
				<td>
					<input type="text" name="courseId">
				</td>
				<td>
					<label>���ϴ����ļ����������ƻ������</label>
				</td>
			</tr>
			<tr>
				<td>
					<label>��ѡ�񿪿�ѧ��</label>
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
					<label>���ϴ����ļ����������ƻ�����ѡ��</label>
				</td>
			</tr>
			<tr>
				<td>
					<label>�ļ������</label>
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
			<li>��ѡ��Ҫ�ϴ��ĸ�����</li>
			<li>�ϴ��ļ��� <input type="file" name="file" /> <!-- �ļ��ϴ���� --></li>
			<li>
				<input type="submit" name="Submit" value="�ϴ�" /> 
				<input type="reset" name="Submit2" value="����" />
			</li>
		</ul>
		<%
			if (request.getAttribute("result") != null) { //�жϱ�����request��Χ�ڵĶ����Ƿ�Ϊ��
				out.println("<script >alert('" + request.getAttribute("result")
						+ "');</script>"); //ҳ����ʾ��ʾ��Ϣ    	  
			}
		%>
	</form>
</body>
</html>