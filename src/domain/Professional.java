package domain;

public class Professional {
	String proId;
	String proName;
	String instId;
	public Professional()
	{
		
	}
	public Professional(String proName,String instId)
	{
		this.proName=proName;
		this.instId=instId;
	}
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getInstId() {
		return instId;
	}
	public void setInstId(String instId) {
		this.instId = instId;
	}
	

}
