package service.imp;

import dao.IInstitudeDAO;
import dao.imp.InstitudeDAO;
import domain.Institude;
import service.IInstitudeService;

public class InstitudeService implements IInstitudeService{
	IInstitudeDAO institudeDAO=new InstitudeDAO();
	public InstitudeService()
	{
		
	}
	public Institude getInstByInstName(String instName)
	{
		if(instName==null)
			return null;
		else
			return institudeDAO.getInstByInstName(instName);
	}
	
	public static void main(String[] args)
	{
		InstitudeService in=new InstitudeService();
		System.out.println(in.getInstByInstName("…Ã—ß‘∫").getInstId());
	}

}
