package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signup.do")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;    
   
    public SignupController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request,response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		HttpSession session = request.getSession();
		
		if(command.equals("emailChk")) {   //이메일 인증 버튼 클릭 시
	        String mem_email =    request.getParameter("mem_email");
	        session.setAttribute("mem_email", mem_email);
	        
			boolean emailNotTobe  = true; 
			// 만약 이메일 중복 확인을 하고 싶으면 로직을 만들어서 위 변수를 변경되게 해준다.
			//  emailNotTobe=true => 이메일이 없다. (중복이 아니다)

			 try {
		            String mail_to =    mem_email;     			//메일 받는 사람
		            String title =      "인증번호 확인 메일 입니다. "; // 메일 제목
		            String contents =   "";
		            String authNum=getRamdomPassword(7);		// 인증번호(랜덤7자)
		            String serverUrl = "http://localhost:8787/EmailConfirm"; // 서버 주소(로컬 주소)
		            session.setAttribute("pre_authNum", authNum); // 인증번호 session에 넘김
		            //이메일 인코딩 방식
		            mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
		            
		            // Smtp properties 설정 (거의 변경하지 않음)
		            Properties props = new Properties();
		            props.put("mail.transport.protocol", "smtp");
		            props.put("mail.smtp.host", "smtp.gmail.com");
		            props.put("mail.smtp.port", "465");
		            props.put("mail.smtp.starttls.enable", "true");
		            props.put("mail.smtp.socketFactory.port", "465");
		            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		            props.put("mail.smtp.socketFactory.fallback", "false");
		            props.put("mail.smtp.auth", "true");
		 
		            Authenticator auth = new SMTPAuthenticator();
		            //SMTPAuthenticator 클래스에서 보낼 사람의 정보를 받아온다.
		            Session sess = Session.getDefaultInstance(props, auth);
		            // Session클래스로 위의 속성값과 STMP정보로 session 객체를 만든다. 
		            MimeMessage msg = new MimeMessage(sess);
		            // 보낼 메일 내용을 만든다.
		            msg.setFrom(new InternetAddress(mail_to));
		            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
		            msg.setSubject(title, "UTF-8");
		            msg.setContent(contents, "text/html; charset=UTF-8");
		            msg.setText(new StringBuffer().append("<fieldset style='text-align:center; height: 1100px;'>")
						.append("<legend><h1>회원가입을 환영합니다.</h1></legend><br/>")
						.append("<img alt='png01;' src='https://kr.seaicons.com/wp-content/uploads/2015/09/Mail-icon1.png' />")
						.append("<p style='font-weight:bold; font-size:12px; '>이 메일은 EveryFarm에서 보낸 메일로 회원가입 절차를 진행하기 위한 메일입니다.</p><br/>")
						.append("<p style='font-weight:bold; font-size:12px; color:blue;'>인증번호 : [" + authNum
								+ "]</p><br/>")
						.append("<p style='font-weight:bold; font-size:12px; '>아래 버튼 클릭한 후 인증번호를 입력해 주세요.</p><br/><hr/><br/>")
						.append("<p style='font-weight:bold; font-size:12px; '>This email was sent by EveryFarm to proceed with the signup process.</p><br/>")
						.append("<p style='font-weight:bold; font-size:12px; color:blue;'>Verification Code : ["
								+ authNum + "]</p><br/>")
						.append("<p style='font-weight:bold; font-size:12px; '>Please click the button below and enter the verification code.</p><br/><hr/><br/>")
						.append("<p style='font-weight:bold; font-size:12px; '>このメールはサインアップためのEveryFarmから送られたメールです。</p><br/>")
						.append("<p style='font-weight:bold; font-size:12px; color:blue;'>認証番号 : [" + authNum
								+ "]</p><br/>")
						.append("<p style='font-weight:bold; font-size:12px; '>下のボタンを押した後、認証番号を入力してください。</p><br/>")
						.append("<button style=\"color:white; background:black; font-weight:bold; width:150px; height:40px; font-size:18px; border-radius:10px;\">"
								+ "<a style=\"color:white; text-decoration: none;\" href=\""+serverUrl+"/signup.do?command=keysend\">Click</a></button>")
						.append("</fieldset>").toString()
		            		);
		            msg.setHeader("Content-type", "text/html; charset=UTF-8");
		            Transport.send(msg);
		            System.out.println("<이메일 전송 성공>");
		            response.sendRedirect("signupform.jsp?emailNotTobe="+emailNotTobe); // 이메일 중복 response
		        } catch (Exception e) {
		        	e.printStackTrace();
		        	System.out.println("[ERROR]:전송에러");
		        } finally {
		    }
			
			}else if(command.equals("keysend")) {  //사용자가 메일에서 링크 클릭 시
				System.out.println("사용자 메일에서 링크해서 접속 성공");
		    	session.setAttribute("authNum", session.getAttribute("pre_authNum"));//인증키
		    	System.out.println("인증키: "+session.getAttribute("pre_authNum"));
		    	jsResponse("홈페이지로 이동합니다.","signup.do?command=signupform",response);
		    	
		    } else if(command.equals("signupform")) { // 이메일 인증 페이지로 이동
				response.sendRedirect("signupform.jsp");
		    }
	}
		
	public static String getRamdomPassword(int len) { // 인증번호 생성 함수
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		System.out.println("charSet.length :::: " + charSet.length);
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random());
			System.out.println("idx :::: " + idx);
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException { 
		String res = "<script type='text/javascript'>" 
					+ " alert('" + msg + "');" 
					+ " location.href='" + url + "';"
					+ "</script>";
		PrintWriter out = response.getWriter();
		out.println(res);
	}

}
