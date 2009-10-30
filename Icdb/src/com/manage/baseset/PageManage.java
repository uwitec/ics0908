package com.manage.baseset;

import java.sql.SQLException;
import java.util.List;

import propeties.IcdbOption;

import com.dbserver.DBServer;
import com.mydomain.bean.BaseBean;
import com.tools.ICTools;

public class PageManage {

	
	@SuppressWarnings("unchecked")
	public BaseBean setPage(BaseBean obj,String paramert){
		try {
			List<BaseBean> countList=(List<BaseBean>) DBServer.quider.queryForList(paramert,obj);
			BaseBean tempObj=countList.get(0);
			int countnum=Integer.valueOf(IcdbOption.getValue("pageCount"));
			
			obj.setCountSize(ICTools.mathCeil(tempObj.getCountValue(),countnum));
			obj.setCountValue(tempObj.getCountValue());
			return obj;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new BaseBean();
		}
		
	}
}
/*
if(person==null){
person=new PersonBean();
person=(PersonBean) DBServer.quider.queryForObject("selectAllPersonBeanPag", person);
System.out.println("news");
}
System.out.println(person.getStartSize());

//person.setCountValue((Integer.valueOf(DBServer.quider.queryForObject("selectAllPersonBeanPag", "person").toString())));
person.setCountSize(ICTools.mathCeil(person.getCountValue(),BaseBean.countNumber));
person.setStartSize(person.getStartSize());

person.print();
*/