package com.entity;

import java.io.Serializable;

import org.springframework.context.annotation.Role;

import com.sun.tools.javac.util.List;

// 用户
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	private String isUser;
	private List<Role> role;

	public String getIsUser() {
		return isUser;
	}

	public void setIsUser(String isUser) {
		this.isUser = isUser;
	}

	private String cardno;
	private String id;
	private String username;
	private String sex;
	private String tele;
	private String address;
	private boolean state;
	private String passkey;
	private double balance;

	public User(String cardno, String id, String username, String sex, String tele, String address, boolean state,
			String passkey, double balance) {
		super();
		this.cardno = cardno;
		this.id = id;
		this.username = username;
		this.sex = sex;
		this.tele = tele;
		this.address = address;
		this.state = state;
		this.passkey = passkey;
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "User [cardno=" + cardno + ", id=" + id + ", username=" + username + ", sex=" + sex + ", tele=" + tele
				+ ", address=" + address + ", state=" + state + ", passkey=" + passkey + ", balance=" + balance + "]";
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTele() {
		return tele;
	}

	public void setTele(String tele) {
		this.tele = tele;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean getState() {
		return state;
	}

	public void setState(boolean i) {
		this.state = i;
	}

	public String getPasskey() {
		return passkey;
	}

	public void setPasskey(String passkey) {
		this.passkey = passkey;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public User() {
		super();
		// TODO 自动生成的构造函数存根
	}

}
