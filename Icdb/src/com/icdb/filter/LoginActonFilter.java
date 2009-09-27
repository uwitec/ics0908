package com.icdb.filter;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginActonFilter extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		ActionContext ctx = arg0.getInvocationContext();
		Map<?, ?> map = ctx.getSession();
		Object obj = map.get("user");
		System.out.println("login: " + obj);
		if (null != obj) {
			return arg0.invoke();
		}
		return Action.LOGIN;
	}
}
