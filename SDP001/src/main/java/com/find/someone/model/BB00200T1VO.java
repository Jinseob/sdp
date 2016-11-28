package com.find.someone.model;

import java.sql.Date;

public class BB00200T1VO extends BB008VO{
	private String 	local_id		;
	private String 	local1			;
	private String 	local2			;
	private String 	local3			;
	private String 	cont_id			;
	private String 	title			;
	private String 	content			;
	private String 	detail_url		;
	private String 	list_img		;
	private String 	method			;
	private String 	write_dt		;
	private String 	place			;
	private String 	day				;
	private String 	status			;
	private Date 	cre_dt			;
	private Date 	upt_dt			;
	private String 	edu_period		;
	private String 	edu_time		;
	private String 	edu_persons		;
	private String 	tel				;
	private String 	tuition			;
	
	
	public String getEdu_period() {
		return edu_period == null ? "" : edu_period;
	}
	public void setEdu_period(String edu_period) {
		this.edu_period = edu_period;
	}
	public String getEdu_time() {
		return edu_time == null ? "" : edu_time;
	}
	public void setEdu_time(String edu_time) {
		this.edu_time = edu_time;
	}
	public String getEdu_persons() {
		return edu_persons == null ? "" : edu_persons;
	}
	public void setEdu_persons(String edu_persons) {
		this.edu_persons = edu_persons;
	}
	public String getTel() {
		return tel == null ? "" : tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTuition() {
		return tuition == null ? "" : tuition;
	}
	public void setTuition(String tuition) {
		this.tuition = tuition;
	}
	public String getCont_id() {
		return cont_id == null ? "" : cont_id;
	}
	public void setCont_id(String cont_id) {
		this.cont_id = cont_id;
	}
	public String getLocal_id() {
		return local_id == null ? "" : local_id;
	}
	public void setLocal_id(String local_id) {
		this.local_id = local_id;
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
	public String getDetail_url() {
		return detail_url == null ? "" : detail_url;
	}
	public void setDetail_url(String detail_url) {
		this.detail_url = detail_url;
	}
	public String getList_img() {
		return list_img == null ? "" : list_img;
	}
	public void setList_img(String list_img) {
		this.list_img = list_img;
	}
	public String getMethod() {
		return method == null ? "" : method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getWrite_dt() {
		return write_dt == null ? "" : write_dt;
	}
	public void setWrite_dt(String write_dt) {
		this.write_dt = write_dt;
	}
	public String getPlace() {
		return place == null ? "" : place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getDay() {
		return day == null ? "" : day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getStatus() {
		return status == null ? "" : status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCre_dt() {
		return cre_dt;
	}
	public void setCre_dt(Date cre_dt) {
		this.cre_dt = cre_dt;
	}
	public Date getUpt_dt() {
		return upt_dt;
	}
	public void setUpt_dt(Date upt_dt) {
		this.upt_dt = upt_dt;
	}
	@Override
	public String toString() {
		return "BB00200T1VO [local_id=" + local_id + ", local1=" + local1 + ", local2=" + local2 + ", local3=" + local3 + ", cont_id=" + cont_id + ", title=" + title + ", content=" + content + ", detail_url=" + detail_url + ", list_img=" + list_img + ", method=" + method + ", write_dt=" + write_dt + ", place=" + place + ", day=" + day + ", status=" + status + ", cre_dt=" + cre_dt + ", upt_dt=" + upt_dt + ", edu_period=" + edu_period + ", edu_time=" + edu_time + ", edu_persons=" + edu_persons + ", tel=" + tel + ", tuition=" + tuition + "]";
	}
	
	
}
