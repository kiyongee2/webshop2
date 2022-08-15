package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.Board;
import mvc.model.BoardDAO;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	
	private static final long serialVersionUID = 21L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String uri = request.getRequestURI();
		System.out.println(uri);  //경로(주소 -path) 정보
		
		String command = uri.substring(uri.lastIndexOf("/"));  //주소 문자열 추출
		System.out.println(uri.lastIndexOf("/"));
		System.out.println(command);
		
		String nextPage = null;  //jsp 페이지
		HttpSession session = request.getSession(); //세션 객체 생성
		PrintWriter out = response.getWriter();     //쓰기 객체 생성
		
		BoardDAO dao = BoardDAO.getInstance();  //dao 객체 생성
		
		if(command.equals("/boardListAction.do")) {
			ArrayList<Board> boardList = dao.getBoardList();
			request.setAttribute("boardList", boardList);
			nextPage = "/board/boardList.jsp";
		}else if(command.equals("/boardWriteForm.do")) { //새글 폼 페이지
			String id = (String)session.getAttribute("sessionId");
			String name = dao.getNameByLogin(id);
			request.setAttribute("names", name);
			nextPage = "/board/boardWriteForm.jsp";
		}else if(command.equals("/boardWriteAction.do")) {
			//자료 전달
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			//Board 객체 생성
			Board board = new Board();
			board.setId(id);
			board.setName(name);
			board.setSubject(subject);
			board.setContent(content);
			
			//글쓰기 처리
			dao.insertBoard(board);
			//view 이동
			nextPage = "/boardListAction.do";
		}else if(command.equals("/boardView.do")) { //게시글 상세 보기
			int num = Integer.parseInt(request.getParameter("num"));
			// 조회수
			dao.updateHit(num);
			// 상세 보기
			Board board = dao.getBoard(num);
			//model and view
			request.setAttribute("board", board);
			nextPage = "/board/boardView.jsp";
		}else if(command.equals("/boardDeleteAction.do")) {
			int num = Integer.parseInt(request.getParameter("num"));
			
			dao.deleteBoard(num);
			nextPage = "/boardListAction.do";
		}else if(command.equals("/boardUpdateAction.do")) {
			//자료 전달
			int num = Integer.parseInt(request.getParameter("num"));
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			//Board 객체 생성
			Board board = new Board();
			board.setNum(num);   //글번호(기본키)가 반드시 필요함
			board.setSubject(subject);
			board.setContent(content);
			
			dao.updateBoard(board);
			nextPage = "/boardListAction.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

}
