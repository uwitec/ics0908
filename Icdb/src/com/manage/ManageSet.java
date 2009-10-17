package com.manage;

import java.util.ArrayList;
import java.util.List;

import com.dbserver.xml.XMLBean;
import com.dbserver.xml.XMLReader;
import com.dbserver.xml.XMLWriter;
import com.mydomain.bean.ManageSetBean;

public class ManageSet {

	
	public List<?> getXMLBean(String fileName){
		XMLBean xmlb=new XMLBean(fileName);
		XMLReader.readXMLBean(xmlb);
		return xmlb.getItemList();
	}
	
	public void setXMLBean(String fileName,ManageSetBean manageset){
		XMLBean xmlb=new XMLBean(fileName);
		XMLReader.readXMLBean(xmlb);
		Object obj=xmlb.getItemList().get(0);
		if(obj instanceof ManageSetBean){
			((ManageSetBean)obj).setM_MaterABC(manageset.getM_MaterABC());
			((ManageSetBean)obj).setM_MaterErverTime(manageset.getM_MaterErverTime());
			((ManageSetBean)obj).setM_MaterInNum(manageset.getM_MaterInNum());
			((ManageSetBean)obj).setM_MaterNum(manageset.getM_MaterNum());
			((ManageSetBean)obj).setM_MaterOutNum(manageset.getM_MaterOutNum());
		}
		xmlb.setPath(fileName);
		XMLWriter.writeXMLBean(xmlb);
	}
	/*
	public void setXMLBean(String fileName,List<ManageSetBean> lhp){
		XMLBean xmlb=new XMLBean(fileName);
		XMLReader.readXMLBean(xmlb);
		for(int i=0;i<lhp.size();i++){
			Object obj=xmlb.getItemList().get(i);
			ManageSetBean manageset=lhp.get(i);
			if(obj instanceof ManageSetBean){
				((ManageSetBean)obj).setM_MaterABC(manageset.getM_MaterABC());
				((ManageSetBean)obj).setM_MaterErverTime(manageset.getM_MaterErverTime());
				((ManageSetBean)obj).setM_MaterInNum(manageset.getM_MaterInNum());
				((ManageSetBean)obj).setM_MaterNum(manageset.getM_MaterNum());
				((ManageSetBean)obj).setM_MaterOutNum(manageset.getM_MaterOutNum());
			}
		}
		XMLWriter.writeXMLBean(xmlb);
	}
	*/
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		ManageSet ms=new ManageSet();
//		List<ManageSetBean> lhp=(List<ManageSetBean>) ms.getXMLBean("/propeties/ManageSet1.xml");
		ManageSetBean mm1=new ManageSetBean();
		ManageSetBean mm2=new ManageSetBean();
		
		mm1.setM_MaterABC("1");
		mm1.setM_MaterErverTime("dat");
		mm2.setM_MaterABC("2");
		mm2.setM_MaterErverTime("year");
		List<ManageSetBean> lhp=new ArrayList<ManageSetBean>();
		lhp.add(mm1);
		lhp.add(mm2);
		
		ms.setXMLBean("/propeties/ManageSet1.xml", mm1);
	}
	
}
