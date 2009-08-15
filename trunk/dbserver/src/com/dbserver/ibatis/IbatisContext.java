package com.dbserver.ibatis;

public class IbatisContext {
	private static String context = null;

	public static final String getContext() {
		if (null != context) {
			return context;
		} else {
			final String slash = "/";
			String resourcePath = IbatisContext.class.getResource(slash)
					.getPath();
			String endChar = resourcePath.substring(resourcePath.length() - 1);
			if (!slash.equals(endChar)) {
				context = resourcePath + slash;
			} else {
				context = resourcePath;
			}
			return context;
		}
	}
}
