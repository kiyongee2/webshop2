package filter;

import java.io.IOException;
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

public class LogFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("WebMarket 초기화...");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("클라이언트 IP : " + request.getRemoteAddr() );
		System.out.println("접근한 URL 경로 : " + getURLPath(request) );
		long start = System.currentTimeMillis();
		System.out.println("요청 처리 시작 시각 : " + getCurrentTime() );
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시각 : " + getCurrentTime() );
		System.out.println("요청 처리 소요 시간 : " + (end-start) + "ms " );
		System.out.println("=================================================");
	}
	
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());  //현재 시간 설정
		return formatter.format(calendar.getTime());
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

	@Override
	public void destroy() {
		System.out.println("WebMarket 해제...");
	}

}
