package com.find.someone.model;

import java.sql.Timestamp;

public class BB00090VO {
	private String comment_id;
	private String board_id;
	private String parent_id; 
	private String gubun;
	private String comments;
	private Timestamp cre_dt;
	private String cre_id;
	private Timestamp upt_dt;
	private String upt_id;
	private int level;
	public String getComment_id() {
		return comment_id == null ? "" : comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
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
	public Timestamp getCre_dt() {
		return cre_dt;
	}
	public void setCre_dt(Timestamp cre_dt) {
		this.cre_dt = cre_dt;
	}
	public String getCre_id() {
		return cre_id == null ? "" : cre_id;
	}
	public void setCre_id(String cre_id) {
		this.cre_id = cre_id;
	}
	public Timestamp getUpt_dt() {
		return upt_dt;
	}
	public void setUpt_dt(Timestamp upt_dt) {
		this.upt_dt = upt_dt;
	}
	public String getUpt_id() {
		return upt_id == null ? "" : upt_id;
	}
	public void setUpt_id(String upt_id) {
		this.upt_id = upt_id;
	}
	public String getComments() {
		return comments == null ? "" : comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
