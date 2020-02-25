package com.entity;

import java.io.Serializable;
import java.sql.Date;

/*
 *创建人：肖易安
 *创建时间：2019年7月12日
 */
public class Notice implements Serializable {
	private static final long serialVersionUID = 1L;

	private String noticeno;
	private Date pbtime;
	private String content;

	public String getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}

	public Date getPbtime() {
		return pbtime;
	}

	public void setPbtime(Date date) {
		this.pbtime = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", pbtime=" + pbtime + ", content=" + content + "]";
	}

	public Notice(String noticeno, Date pbtime, String content) {
		super();
		this.noticeno = noticeno;
		this.pbtime = pbtime;
		this.content = content;
	}

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

}
