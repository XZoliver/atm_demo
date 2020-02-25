package com.entity;

import java.io.Serializable;

/*
 *创建人：肖易安
 *创建时间：2019年7月12日
 */
public class Admin implements Serializable {
	@Override
	public String toString() {
		return "Admin [acoount=" + acoount + ", adminkey=" + adminkey + "]";
	}

	private static final long serialVersionUID = 1L;

	private String acoount;
	private String adminkey;

	public String getAcoount() {
		return acoount;
	}

	public void setAcoount(String acoount) {
		this.acoount = acoount;
	}

	public String getAdminkey() {
		return adminkey;
	}

	public void setAdminkey(String adminkey) {
		this.adminkey = adminkey;
	}

	public Admin(String acoount, String adminkey) {
		super();
		this.acoount = acoount;
		this.adminkey = adminkey;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

}
