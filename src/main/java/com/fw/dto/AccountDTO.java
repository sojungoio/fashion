package com.fw.dto;

public class AccountDTO {
	private String accountId;
	private String email;
	private String identified; 
	private String password;
	private String createdDttm;
	private String nickname;
	private String name;
	
	
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdentified() {
		return identified;
	}
	public void setIdentified(String identified) {
		this.identified = identified;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreatedDttm() {
		return createdDttm;
	}
	public void setCreatedDttm(String createdDttm) {
		this.createdDttm = createdDttm;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
