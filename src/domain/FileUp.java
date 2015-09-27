package domain;

import java.util.Date;

public class FileUp {
	String fileId;
	String fileName;
	String type;
	String path;
	String date;
	String cpId;
	public FileUp()
	{
		
	}
	public FileUp(String fileName, String type, String path, String date, String cpId) {
		this.fileName = fileName;
		this.type = type;
		this.path = path;
		this.date = date;
		this.cpId = cpId;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCpId() {
		return cpId;
	}
	public void setCpId(String cpId) {
		this.cpId = cpId;
	}
	

}
