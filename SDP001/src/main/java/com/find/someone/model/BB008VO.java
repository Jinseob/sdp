package com.find.someone.model;

public class BB008VO {
	private String board_id;
	private String parent_id;
	private String gubun;
	private String order_no;
	private String user_id;
	
	public String getBoard_id() {
		return board_id == null ? "" : board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getParent_id() {
		return parent_id == null ? "" : parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getGubun() {
		return gubun == null ? "" : gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getOrder_no() {
		return order_no == null ? "" : order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getUser_id() {
		return user_id == null ? "" : user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
