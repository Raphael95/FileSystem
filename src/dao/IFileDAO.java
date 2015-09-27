package dao;

import domain.FileUp;

public interface IFileDAO {
	public FileUp getFileById(String cpId);
	public void addFile(FileUp file);
}
