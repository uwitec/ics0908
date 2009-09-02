package com.dbserver.conf;

/**
 * @author Zhong Lizhi
 * 
 */
public final class Environment {
    private static String context = null;

    public static final String getContext() {
        if (null != context) {
            return context;
        } else {
            String slash = "/";
            String resourcPath = Environment.class.getResource(slash).getPath();
            char endChar = resourcPath.charAt(resourcPath.length() - 1);
            if (!slash.equals(Character.toString(endChar))) {
                context = resourcPath + slash;
            } else {
                context = resourcPath;
            }
            return context;
        }
    }
}
