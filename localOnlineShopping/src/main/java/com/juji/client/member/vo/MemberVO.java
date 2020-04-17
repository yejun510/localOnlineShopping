package com.juji.client.member.vo;

import java.util.Date;

public class MemberVO {
	private String id;
	private String passwd;
	private String name;
	private String address;
	private String email;
	private Date join_date;
	private String tel;
	private String s_address1;
	private String s_address2;
	private String s_address3;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getS_address1() {
		return s_address1;
	}
	public void setS_address1(String s_address1) {
		this.s_address1 = s_address1;
	}
	public String getS_address2() {
		return s_address2;
	}
	public void setS_address2(String s_address2) {
		this.s_address2 = s_address2;
	}
	public String getS_address3() {
		return s_address3;
	}
	public void setS_address3(String s_address3) {
		this.s_address3 = s_address3;
	}
	
	
}
