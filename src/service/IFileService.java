package service;

import domain.FileUp;

public interface IFileService {
	public FileUp getFileByCpId(String cpId);
	public void addFile(FileUp file);
}
