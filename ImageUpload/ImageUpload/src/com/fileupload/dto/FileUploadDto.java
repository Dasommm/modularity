package com.fileupload.dto;

public class FileUploadDto {
	
	private String filename;

	
	
	public FileUploadDto() {
		
	}

	public FileUploadDto(String filename) {
		this.filename = filename;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	
}
