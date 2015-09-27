package service.imp;

import domain.FileUp;
import service.IFileService;
import dao.IFileDAO;
import dao.imp.FileDAO;

public class FileService implements IFileService{
	IFileDAO fileDAO=new FileDAO();
	public FileService()
	{
		
	}
	public FileUp getFileByCpId(String cpId)
	{
		if(cpId!=null)
			return fileDAO.getFileById(cpId);
		else
			return null;
	}
	
	public void addFile(FileUp file)
	{
		if(file==null)
			throw new RuntimeException("添加的对象不能为空");
		else
			fileDAO.addFile(file);
	}
	
	public static void main(String[] args)
	{
		FileService fs=new FileService();
		FileUp f=fs.getFileByCpId("1");
		System.out.println(f.getFileName());
	}

}
