package com.cafe24.smart.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.apache.log4j.Logger;

//한글 인코딩 설정
@WebFilter("/HangulEncodingFilter")
public class HangulEncodingFilter implements Filter {

	final static Logger log = Logger.getLogger(HangulEncodingFilter.class);
	
//	eincoding charset
	String encoding;
//	filter setting manager
	FilterConfig filterConfig;
	
    public HangulEncodingFilter() { }

    public void init(FilterConfig fConfig) throws ServletException {
    	
    	this.filterConfig = fConfig;
    	this.encoding = fConfig.getInitParameter("charset");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		if (request.getCharacterEncoding() == null) {
			if (encoding != null) {
				request.setCharacterEncoding(encoding);
			}
		}
		
		log.debug("console> doFilter : " + request.getCharacterEncoding());
		
		chain.doFilter(request, response);
	}

	public void destroy() {
		
		this.encoding = null;
		this.filterConfig = null;
	}
}