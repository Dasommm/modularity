package summernoteDto;

import java.sql.Date;

public class SnDto {

	//게시판
	private int seq;
	private String title;
	private String content;
	private Date regdate;
	
	//이미지 업로드
		private int imgseq;	//이미지가 업로드되는 경우 'image/1'같은 형식으로 저장되고 여기서 1은 imgseq로 이미지 저장경로 저장
							//클라이언트에서 1을 요청하는 경우 imgseq 1을 불러와서 그에 맞는 filepath return하기
		private String filepath;
		private String filename;
		private String save_file_name;
		
	
	
	public SnDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	public SnDto(int seq, String title, String content, Date regdate, int imgseq, String filepath, String filename,
			String save_file_name) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.imgseq = imgseq;
		this.filepath = filepath;
		this.filename = filename;
		this.save_file_name = save_file_name;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public int getImgseq() {
		return imgseq;
	}



	public void setImgseq(int imgseq) {
		this.imgseq = imgseq;
	}



	public String getFilepath() {
		return filepath;
	}



	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}



	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}



	public String getSave_file_name() {
		return save_file_name;
	}



	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}

	
	
	
	
}
