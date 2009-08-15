package com.tools;

public class CreateSql {

	private StringBuffer mysql;
	private StringBuffer sel_str;
	private StringBuffer tab_str;
	private StringBuffer where_str;
	private int s_length;
	private int t_length;
	private int w_length;
	
	public CreateSql(){
		this.createSql();
	}
	private void createSql(){
		this.mysql=new StringBuffer();
		this.sel_str=new StringBuffer("select");
		this.s_length=this.sel_str.length();
		this.tab_str=new StringBuffer("from");
		this.t_length=this.tab_str.length();
		this.where_str=new StringBuffer("where");
		this.w_length=this.where_str.length();
	}
	
	public String getSql(){
		return this.mysql.toString();
	}
	
	public void addSelect(String s_str){
		if(!s_str.equals("") && s_str!=null){
			if(sel_str.length()==this.s_length){
				this.sel_str.append(" "+s_str);
			}else{
				this.sel_str.append(","+s_str);
			}
		}
	}

	public void clearSelect(){
		this.sel_str.delete(this.s_length, sel_str.length());
	}
	
	public void addTable(String t_str){
		if(!t_str.equals("") && t_str!=null){
			if(this.tab_str.length()==this.t_length){
				this.tab_str.append(" "+t_str);
			}else{
				this.tab_str.append(","+t_str);
			}
		}
	}
	public void clearTab(){
		this.tab_str.delete(this.t_length,tab_str.length());
	}
	
	public void addWhere(String w_str){
		if(!w_str.equals("") && w_str!=null){
			if(this.where_str.length()==this.w_length){
				this.where_str.append(" "+w_str);
			}else{
				this.where_str.append(" and "+w_str);
			}
		}
	}
	
	public void createEnd(){
		this.mysql.append(this.sel_str);
		this.mysql.append(" "+this.tab_str);
		this.mysql.append(" "+this.where_str);
	}
	
}
