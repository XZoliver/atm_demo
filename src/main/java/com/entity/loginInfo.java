package com.entity;
/*
 *创建人：肖易安
 *创建时间：2019年7月15日
 */

import java.io.Serializable;

public class loginInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	private String passname;
	private String passnum;
	private String isUser;

	public String getPassname() {
		return passname;
	}

	public void setPassname(String passname) {
		this.passname = passname;
	}

	public String getPassnum() {
		return passnum;
	}

	public void setPassnum(String passnum) {
		this.passnum = passnum;
	}

	public String getIsUser() {
		return isUser;
	}

	public void setIsUser(String isUser) {
		this.isUser = isUser;
	}

	@Override
	public String toString() {
		return "loginInfo [passname=" + passname + ", passnum=" + passnum + ", isUser=" + isUser + "]";
	}

	public loginInfo(String passname, String passnum, String isUser) {
		super();
		this.passname = passname;
		this.passnum = passnum;
		this.isUser = isUser;
	}

	public loginInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

}
