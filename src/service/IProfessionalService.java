package service;

import java.util.List;

import domain.Professional;

public interface IProfessionalService {
	public List<Professional> getProByInstId(String instId);
	public Professional getProByProName(String proName);

}
