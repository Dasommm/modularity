package com.paging.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paging.biz.PagingBiz;
import com.paging.biz.PagingBizImpl;
import com.paging.dto.BoardDto;
import com.paging.dto.PagingDto;


@WebServlet("/paging.do")
public class PagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PagingBiz biz = new PagingBizImpl();
       
   
    public PagingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command : " + command);
		
		if(command.equals("list")) {
			int currentpage = Integer.parseInt(request.getParameter("currentpage"));
			PagingDto pagingdto = new PagingDto();
			pagingdto.setCurrentpage(currentpage);
			pagingdto.setColumn(10);   //게시글은 10개씩
			pagingdto.setUnderpagescale(5);    //아래 페이지 수의 크기는 5개씩
			pagingdto.setTotalpage(biz.totalPage(pagingdto.getColumn()));  //마지막 페이지 번호
			
			List<BoardDto> list = biz.selectList(pagingdto);
			request.setAttribute("list", list);
			request.setAttribute("pagingdto", pagingdto);
			dispatch("list.jsp", request, response);
		}
		
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"');");
		out.println("location.href='"+url+"');");
		out.println("</script>");
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	private void historyBack(String msg, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"');");
		out.println("history.back()");
		out.println("</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}

}
