package summernoteController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import summernoteBiz.BizImpl;
import summernoteBiz.SnBiz;
import summernoteDto.SnDto;

/**
 * Servlet implementation class SummernoteServlet
 */
@WebServlet("/summernote.do")
public class SummernoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SummernoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/HTML; charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    String savePath = "C:\\workspace_module\\summernote_module\\summernote_module\\WebContent\\WEB-INF\\resources\\images";

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/HTML; charset=UTF-8");
		
		String command = request.getParameter("command");
		SnBiz biz = new BizImpl();
		
		
		if(command.equals("artcleDB")) {	//text insert
			String title = request.getParameter("title");
			String content = request.getParameter("article");
			
			SnDto dto = new SnDto();
			dto.setContent(content);
			dto.setTitle(title);
			
			int artiRes = biz.insertArticle(dto);
			
			if(artiRes>0) {
				System.out.println("arti성공");
				response.sendRedirect("index.html");
			}else {
				System.out.println("실패");
			}
			
			
		}else if(command.equals("imageUpload")) {
			//파일을 저장하는 작업, 파일이름을 생성하여 DB에 저장하는 작업 진행
			//servlet에서 작업이 끝나면 클라이언트에게 파일번호(imgseq)를 전달 ex)'image/1'

			MultipartRequest multi = new MultipartRequest(	//cor.jar라이브러리 필요
					request, savePath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			//받은 파일을 , 저장할 곳, 크기, encoding, 이름 중복되지 않도록 하는
			
			String imagePath = "resources\\images\\";
			String fileName = multi.getFilesystemName("file");
			String filePath = imagePath+fileName;
			
			System.out.println(fileName);
			System.out.println(filePath);
			
			SnDto fileDto = new SnDto();
			fileDto.setFilename(fileName);
			fileDto.setFilepath(filePath);
			
			int imgSeq = biz.insertImg(fileDto);
			
			if(imgSeq>0) {
				System.out.println("이미지 저장 성공");
				System.out.println(imgSeq);
			}else {
				System.out.println("실패");
			}
			
			PrintWriter out = response.getWriter();
			out.println(filePath);
		}
		
	}

}
