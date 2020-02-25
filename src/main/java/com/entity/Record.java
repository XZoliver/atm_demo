package com.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 创建人：HDX 创建日期：2019年7月14日
 */
public class Record implements Serializable, Comparable<Record> {

	private static final long serialVersionUID = 1L;

	private String cardno;
	private String recordno;
	private String optype;
	private double amount;
	private Date recordtime;
	private String aimcard;

	public Record() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public Record(String cardno, String recordno, String optype, double amount, Date recordtime, String aimcard) {
		super();
		this.cardno = cardno;
		this.recordno = recordno;
		this.optype = optype;
		this.amount = amount;
		this.recordtime = recordtime;
		this.aimcard = aimcard;
	}

	@Override
	public String toString() {
		return "Record [cardno=" + cardno + ", recordno=" + recordno + ", optype=" + optype + ", amount=" + amount
				+ ", recordtime=" + recordtime + ", aimcard=" + aimcard + "]";
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getRecordno() {
		return recordno;
	}

	public void setRecordno(String recordno) {
		this.recordno = recordno;
	}

	public String getOptype() {
		return optype;
	}

	public void setOptype(String optype) {
		this.optype = optype;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getRecordtime() {
		return recordtime;
	}

	public void setRecordtime(Date recordtime) {
		this.recordtime = recordtime;
	}

	public String getAimcard() {
		return aimcard;
	}

	public void setAimcard(String aimcard) {
		this.aimcard = aimcard;
	}

	@Override
	public int compareTo(Record o) {
		// TODO 自动生成的方法存根
		// return this.recordtime.compareTo(o.getRecordtime());
		return o.recordno.compareTo(this.recordno);
	}

}
