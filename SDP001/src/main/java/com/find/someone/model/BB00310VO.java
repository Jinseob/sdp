package com.find.someone.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;

public class BB00310VO {
	private String	past_id;
	private String	local1;
	private String	local2;
	private String	local3;
	private String	local1_nm;
	private String	local2_nm;
	private String	local3_nm;
	private String	date_diff;
	private String	title;
	private int		comment_cnt;
	private String	content;
	private String	place;
	private String	tel;
	private int		view_cnt;
	private Float		grade;
	private String	cre_id;
	private Timestamp	cre_dt;
	private String	upt_id;
	private Timestamp		upt_dt;
	
	public String getPast_id() {
		return past_id == null ? "" : past_id;
	}
	public void setPast_id(String past_id) {
		this.past_id = past_id;
	}
	public String getLocal1() {
		return local1 == null ? "" : local1;
	}
	public void setLocal1(String local1) {
		this.local1 = local1;
	}
	public String getLocal2() {
		return local2 == null ? "" : local2;
	}
	public void setLocal2(String local2) {
		this.local2 = local2;
	}
	public String getLocal3() {
		return local3 == null ? "" : local3;
	}
	public void setLocal3(String local3) {
		this.local3 = local3;
	}
	public String getLocal1_nm() {
		return local1_nm == null ? "" : local1_nm;
	}
	public void setLocal1_nm(String local1_nm) {
		this.local1_nm = local1_nm;
	}
	public String getLocal2_nm() {
		return local2_nm == null ? "" : local2_nm;
	}
	public void setLocal2_nm(String local2_nm) {
		this.local2_nm = local2_nm;
	}
	public String getLocal3_nm() {
		return local3_nm == null ? "" : local3_nm;
	}
	public void setLocal3_nm(String local3_nm) {
		this.local3_nm = local3_nm;
	}
	public String getDate_diff() {
		return date_diff == null ? "" : date_diff;
	}
	public void setDate_diff(String date_diff) {
		this.date_diff = date_diff;
	}
	public String getTitle() {
		return title == null ? "" : title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getComment_cnt() {
		return comment_cnt == 0 ? 0 : comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public String getContent() {
		return content == null ? "" : content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPlace() {
		return place == null ? "" : place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getTel() {
		return tel == null ? "" : tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getView_cnt() {
		return view_cnt == 0 ? 0 : view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public Float getGrade() {
		return grade == 0 ? 0 : grade;
	}
	public void setGrade(Float grade) {
		this.grade = grade;
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
