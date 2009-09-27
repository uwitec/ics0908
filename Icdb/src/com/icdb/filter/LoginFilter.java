package com.icdb.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {
	private String[] urls = { "/favicon.ico", "/login.jsp", "/css/",
			"/images/", "/error.jsp", "/jstree/", "/main/",
			"/script/" };
	private String regex = "";

	private String[] strBadChar = { ":", "\'", "\"", "chr", "javascript:",
			"jscript:", "xss", "vbscript", "master", "truncate", "declare",
			"SiteName", "net user", "xp_cmdshell", "/add", "script", "alert",
			"exec master.dbo.xp_cmdshell", "net localgroup administrators",
			"\\\\", "/", "?", "“", "<", ">", "|" };

	private char[] badChar = { '?', ':', '/', '\'', '|', '<', '>', '"' };

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	public String convertLeagalChar(String str) {
		if (null != str && !"".equals(str)) {
			char[] cs = str.toCharArray();
			for (int i = cs.length - 1; i >= 0; i--) {
				for (char bc : badChar) {
					if (cs[i] == bc) {
						cs[i] = (char) (bc + 65248);
					}
				}
			}
			return new String(cs);
		}
		return str;
	}

	public boolean isLegal(String str) {
		if (null != str && str.length() > 0) {
			str = str.replaceAll("[ ]|%20", "");
			str = str.toLowerCase();
			for (int i = 0; i < strBadChar.length; i++) {
				if (0 <= str.indexOf(strBadChar[i])) {
					System.out.println("BadUrl: " + str);
					return false;
				}
			}
		}
		return true;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String requestUrl = httpRequest.getServletPath();
		String queryString = httpRequest.getQueryString();
		queryString = convertLeagalChar(queryString);
		if (!isLegal(queryString)) {
			((HttpServletResponse) response)
					.sendRedirect(((HttpServletRequest) request)
							.getContextPath()
							+ "/error.jsp");
			return;
		}
		if (!(requestUrl.matches(regex))) {
			Object obj = httpRequest.getSession().getAttribute("user");
			// System.out.println("url: " + requestUrl);
			// System.out.println("session id: " +
			// httpRequest.getSession().getId());

			if (null == obj) {
				((HttpServletResponse) response)
						.sendRedirect(((HttpServletRequest) request)
								.getContextPath()
								+ "/error.jsp");
				return;
			}
		}
		// else {
		// if (null != obj) {
		// if (null != queryString
		// && 0 <= queryString.indexOf("opt=Login.vali")) {
		// ((HttpServletResponse) response)
		// .sendRedirect(((HttpServletRequest) request)
		// .getContextPath()
		// + "/error2.jsp");
		// System.out.println("同一会话，已有一个用户登录！");
		// return;
		// }
		// }
		// }
		chain.doFilter(request, response);

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		StringBuilder sbd = new StringBuilder();
		String[] line = { "", "|" };
		sbd.append(".*(");
		for (int i = urls.length - 1; i >= 0; i--) {
			sbd.append(urls[i]);
			sbd.append(i != 0 ? line[1] : line[0]);
		}
		sbd.append(").*");
		regex = sbd.toString();
	}

}
