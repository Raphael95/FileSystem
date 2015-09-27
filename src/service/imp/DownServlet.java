package service.imp;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownServlet")
public class DownServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public DownServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}


public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	response.setContentType("text/html");
	request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");
	String path=request.getParameter("path");	//��ȡ�ϴ��ļ���·��
	path=new String(path.getBytes("iso-8859-1"),"GBK");
	File file = new File(path);						//���ݸ�·�������ļ�����
	InputStream in = new FileInputStream(file);		//�����ļ��ֽ�������
	OutputStream os = response.getOutputStream();	//�������������
	response.addHeader("Content-Disposition", "attachment;filename="
			+ new String(file.getName().getBytes("GBK"),"iso-8859-1"));	//����Ӧ��ͷ��Ϣ
	response.addHeader("Content-Length", file.length() + "");
	response.setCharacterEncoding("GBK");		
	response.setContentType("application/octet-stream");
	int data = 0;
	while ((data = in.read()) != -1) {				//ѭ����ȡ�ļ�
		os.write(data);								//��ָ��Ŀ¼��д�ļ�
	}
	os.close();										//�ر���
	in.close();
}
}
