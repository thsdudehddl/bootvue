package com.pinos.demo.domain;

public class domainCom {
	
	String gubun, code, name, note;
	
	public domainCom() {}
	
	public domainCom(String gubun, String code, String name, String note) {
		this.gubun = gubun;
		this.code = code;
		this.name = name;
		this.note = note;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
	
	
}
