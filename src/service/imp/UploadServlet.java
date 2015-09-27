package service.imp;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jspsmart.upload.SmartUpload;

import dao.imp.CoursePlanDAO;
import dao.imp.FileDAO;
import dao.imp.ProfessionalDAO;
import domain.CoursePlan;
import domain.FileUp;
//@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7042756416806244618L;
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {		
	String adjunctname ;
	String fileDir = request.getRealPath("upload/");	//ָ���ϴ��ļ��ı����ַ
	String message = "�ļ��ϴ��ɹ�";
	String address = "";
	if(ServletFileUpload.isMultipartContent(request)){	//�ж��Ƿ����ϴ��ļ�
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(20*1024); 				//�����ڴ�������洢���ֽ���
		factory.setRepository(factory.getRepository());	//���ô����ʱ�ļ���Ŀ¼
		ServletFileUpload upload = new ServletFileUpload(factory);	//�����µ��ϴ��ļ����
		
		int size = 2*1024*1024;							//ָ���ϴ��ļ��Ĵ�С
		List formlists = null;							//���������ϴ��ļ��ļ��϶���
		try {	
			formlists = upload.parseRequest(request);	//��ȡ�ϴ��ļ�����
		} catch (FileUploadException e) {				
			e.printStackTrace();
		}
		Iterator iter = formlists.iterator();			//��ȡ�ϴ��ļ�������
		while(iter.hasNext()){
			FileItem formitem = (FileItem)iter.next();	//��ȡÿ���ϴ��ļ�
			if(!formitem.isFormField()){				//���Բ����ϴ��ļ��ı���
				String name = formitem.getName();		//��ȡ�ϴ��ļ�������
				 if(formitem.getSize()>size){			//����ϴ��ļ����ڹ涨���ϴ��ļ��Ĵ�С
                     message = "���ϴ����ļ�̫����ѡ�񲻳���2M���ļ�";
                     break;								//�˳�����
                 }
				String adjunctsize = new Long(formitem.getSize()).toString();		//��ȡ�ϴ��ļ��Ĵ�С
				if((name == null) ||(name.equals(""))&&(adjunctsize.equals("0")))	//����ϴ��ļ�Ϊ��
					continue;							//�˳�����
				adjunctname = name.substring(name.lastIndexOf("\\")+1,name.length());
				address = fileDir+"\\"+adjunctname;		//�����ϴ��ļ��ı����ַ
				File saveFile = new File(address);		//�����ļ������ַ�������ļ�
				try {
						formitem.write(saveFile);			//���ļ�д����
					} 
					catch (Exception e) 
					{						
						e.printStackTrace();
					}

				SmartUpload su = new SmartUpload();
				String type=su.getRequest().getParameter("t");
				System.out.println(su.getRequest().getParameter("t"));
				if(type.equals("�����ƻ�"))
				{
					ProfessionalDAO proDAO=new ProfessionalDAO();
					String proId=proDAO.getProByProName(request.getParameter("type")).getProId();
					String year=request.getParameter("year");
					CoursePlanDAO coursePlan=new CoursePlanDAO();
					coursePlan.addCoursePlan(year, proId);
					String cpId=coursePlan.getCoursePlanByProYear(proId, year).getCpId();
					FileDAO fileDAO=new FileDAO();
					FileUp fp=new FileUp();
					fp.setCpId(cpId);
					fp.setType(request.getParameter("type"));
					fp.setPath(address);
					fp.setFileName(name);
					fileDAO.addFile(fp);
				}
				if(type.equals("��ѧ���"))
				{
					ProfessionalDAO proDAO=new ProfessionalDAO();
					String proId=proDAO.getProByProName(request.getParameter("type")).getProId();
					String year=request.getParameter("year");
					String semester=request.getParameter("semester");
					String courseId=request.getParameter("courseId");
					CoursePlanDAO coursePlan=new CoursePlanDAO();
					coursePlan.addCoursePlan1(year, semester, proId, courseId);
					String cpId=coursePlan.getCourseByCoYear(courseId, year).getCpId();
					FileDAO fileDAO=new FileDAO();
					FileUp fp=new FileUp();
					fp.setCpId(cpId);
					fp.setType(request.getParameter("type"));
					fp.setPath(address);
					fp.setFileName(name);
					fileDAO.addFile(fp);
				}
				}
			}		
	}
	request.setAttribute("result", message);			//����ʾ��Ϣ������request������
	RequestDispatcher requestDispatcher = request.getRequestDispatcher("UpFile.jsp");			//������Ӧ���ص�ַ
	requestDispatcher.forward(request, response);
}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
