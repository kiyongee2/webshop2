package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{
	PrintWriter writer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String filename = filterConfig.getInitParameter("filename"); //xml 설정
		
		if(filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다."); //강제로 예외 발생시킴
		}
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		writer.println("클라이언트 IP : " + request.getRemoteAddr() );
		writer.println("접근한 URL 경로 : " + getURLPath(request) );
		long start = System.currentTimeMillis();
		writer.println("요청 처리 시작 시각 : " + getCurrentTime() );
		
		chain.doFilter(request, response); //실행
		
		long end = System.currentTimeMillis();
		writer.println("요청 처리 종료 시각 : " + getCurrentTime() );
		writer.println("요청 처리 소요 시간 : " + (end-start) + "ms " );
		writer.println("=================================================");
	}
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath="";  //현재 경로
		String queryString="";  //쿼리스트링 - 파라미터
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;  //형 변환
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null ? "": "?" + queryString;
		}
		return currentPath + queryString;
	}
	
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());  //현재 시간 설정
		return formatter.format(calendar.getTime());
	}
	
	@Override
	public void destroy() {
		writer.close();
	}
}
