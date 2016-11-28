package com.find.someone.model;

import java.sql.Date;

public class BB00800T1VO extends BB008VO{
	private String board_id;
	private String parent_id;
	private String title;
	private String content;
	private String reg_id;
	private Date reg_dt;
	private String upt_id;
	private Date upt_dt;
	private int user_cnt;
	private String tot_cnt;
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
	public String getTitle() {
		return title == null ? "" : title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content == null ? "" : content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_id() {
		return reg_id == null ? "" : reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getUpt_id() {
		return upt_id == null ? "" : upt_id;
	}
	public void setUpt_id(String upt_id) {
		this.upt_id = upt_id;
	}
	public Date getUpt_dt() {
		return upt_dt;
	}
	public void setUpt_dt(Date upt_dt) {
		this.upt_dt = upt_dt;
	}
	public int getUser_cnt() {
		return user_cnt;
	}
	public void setUser_cnt(int user_cnt) {
		this.user_cnt = user_cnt;
	}
	public String getTot_cnt() {
		return tot_cnt == null ? "" : tot_cnt;
	}
	public void setTot_cnt(String tot_cnt) {
		this.tot_cnt = tot_cnt;
	}
}
