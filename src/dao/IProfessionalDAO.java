package dao;

import java.util.List;

import domain.Professional;

public interface IProfessionalDAO {
	public List<Professional> getProByInstId(String instId);
	public Professional getProByProName(String proName);
}
