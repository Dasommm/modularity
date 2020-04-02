package com.fileupload.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fileupload.dto.FileUploadDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/fileupload.do")
public class FIleUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FileUploadDto dto = new FileUploadDto();
    
    public FIleUploadServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// MultipartRequest객체를 이용한 파일 업로드. MultipartRequest를 사용하기 위해서는 cos.jar 라이브러리가 필요하다
		// 파일이 저장될 경로 지정
		String savePath = "C:\\Git_test\\ImageUpload\\WebContent\\filestorage";
		// 파일의 최대 크기 설정
		int sizeLimit = 10*1024*1024;
		
		// MultipartRequest의 생성자는 request 데이터를 읽어 지정한 경로에 파일을 생성한다. 생성자 호출과 동시에 파일이 업로드 되는 특징을 가지고 있다.
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		// new MultipartRequest(내장객체인 request, 저장경로, 파일크기제한, 인코딩, 중복파일명정책);
		// new DefaultFileRenamePolicy() : 같은 이름의 파일 업로드 시 파일명 뒤에 숫자를 붙여서 업로드. 이 옵션을 빼면 기존 파일은 삭제되고 새 파일이 업로드됨
		
		
		String command = multi.getParameter("command");
		
		if(command.equals("upload")) {
			String filename = multi.getFilesystemName("uploadfile");
							//getFilesystemName(""); 파일명 불러오는 메소드

			FileUploadDto dto = new FileUploadDto(); 
			dto.setFilename(filename);
			// DB에 데이터 저장하려면 dao 만들어서 db에 연결. 
			
			RequestDispatcher distpather = request.getRequestDispatcher("show.jsp");
			distpather.forward(request, response);
			
		} 
		

	}

}
