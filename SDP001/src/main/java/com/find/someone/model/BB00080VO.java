package com.find.someone.model;

import java.sql.Timestamp;

public class BB00080VO {
	private String grade_id;
	private String board_id;
	private Float grade; 
	private String gubun;
	private String cre_id;
	private Timestamp cre_dt;
	private String upt_id;
	private Timestamp upt_dt;
	
	public String getGrade_id() {
		return grade_id == null ? "" : grade_id;
	}
	public void setGrade_id(String grade_id) {
		this.grade_id = grade_id;
	}
	public String getBoard_id() {
		return board_id == null ? "" : board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public Float getGrade() {
		return grade == 0 ? 0 : grade;
	}
	public void setGrade(Float grade) {
		this.grade = grade;
	}
	public String getGubun() {
		return gubun == null ? "" : gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCre_id() {
		return cre_id == null ? "" : cre_id;
	}
	public void setCre_id(String cre_id) {
		this.cre_id = cre_id;
	}
	public Timestamp getCre_dt() {
		return cre_dt;
	}
	public void setCre_dt(Timestamp cre_dt) {
		this.cre_dt = cre_dt;
	}
	public String getUpt_id() {
		return upt_id == null ? "" : upt_id;
	}
	public void setUpt_id(String upt_id) {
		this.upt_id = upt_id;
	}
	public Timestamp getUpt_dt() {
		return upt_dt;
	}
	public void setUpt_dt(Timestamp upt_dt) {
		this.upt_dt = upt_dt;
	}
	
}
