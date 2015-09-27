package service.imp;

import java.util.List;

import domain.Professional;
import service.IProfessionalService;
import dao.IProfessionalDAO;
import dao.imp.ProfessionalDAO;

public class ProfessionalService implements IProfessionalService{
	IProfessionalDAO professionalDAO=new ProfessionalDAO();
	public ProfessionalService()
	{
		
	}
	public List<Professional> getProByInstId(String instId)
	{
		if(instId==null)
			return null;
		else
			return professionalDAO.getProByInstId(instId);
	}
	
	public Professional getProByProName(String proName)
	{
		if(proName==null)
			return null;
		else
			return professionalDAO.getProByProName(proName);
	}
	
	public static void main(String[] args)
	{
		ProfessionalService p=new ProfessionalService();
		List<Professional> pro=p.getProByInstId("4");
		for(Professional Pro:pro)
		{
			System.out.println(Pro.getProName());
		}
	}

}
