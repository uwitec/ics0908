package com.action.login;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.manage.baseset.EmployeeManage;
import com.mydomain.bean.baseset.EmployeeBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private String userName;
    private String passWord;

    public static String toSHA(String inputString) {
        char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f' };
        byte[] inputBs = inputString.getBytes();
        byte[] digestBs;
        char[] digestCs;
        int digestLengthI;
        MessageDigest mdTemp;

        try {
            mdTemp = MessageDigest.getInstance("SHA");
            digestBs = mdTemp.digest(inputBs);
            digestLengthI = digestBs.length;
            digestCs = new char[digestLengthI * 2];
            for (int i = 0, k = 0; i < digestLengthI; i++) {
                digestCs[k++] = hexDigits[digestBs[i] >>> 4 & 0xf];
                digestCs[k++] = hexDigits[digestBs[i] & 0xf];
            }
            return new String(digestCs);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
	public String login() {
        EmployeeManage em = new EmployeeManage();
        if (null != userName && null != passWord) {
            EmployeeBean employee = em.login(userName, toSHA(passWord));
            if (null != employee && null != employee.getPermissionCode()) {
            	ActionContext.getContext().getSession().put("user", employee);
            	ActionContext.getContext().getSession().put("OLDPassword", passWord);
                return "SUCCESS";
            }
        }
        userName=userName;
        return "NULLRESULT";
    }

    public String unlogin(){
    	ActionContext.getContext().getSession().clear();
    	return "Unload";
    }
    

    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

}
