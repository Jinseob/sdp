package com.find.someone.model;

import java.sql.Date;
import java.sql.Timestamp;

public class BB00100T1VO extends BB008VO{
	private String group_id;
	private String parent_id;
	private String title;
	private String content;
	private String allow_cnt;
	private String code;
	private String del_yn;
	private String reg_id;
	private Date reg_dt;
	private String upt_id;
	private Timestamp upt_dt;
	public String getGroup_id() {
		return group_id == null ? "" : group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
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
	public String getAllow_cnt() {
		return allow_cnt == null ? "" : allow_cnt;
	}
	public void setAllow_cnt(String allow_cnt) {
		this.allow_cnt = allow_cnt;
	}
	public String getCode() {
		return code == null ? "" : code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDel_yn() {
		return del_yn == null ? "" : del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
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
	public Timestamp getUpt_dt() {
		return upt_dt;
	}
	public void setUpt_dt(Timestamp upt_dt) {
		this.upt_dt = upt_dt;
	}
}
