package com.pinos.demo.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.pinos.demo.domain.Domain;
import com.pinos.demo.domain.domainCom;

public interface MemberService {
	
	public Map<String, Object> memberList(int pageNum, Domain domain);
	
	public void insertMember(Domain domain);
	
	public Domain detailMember(int sabun);
	
	public void updateMember(Domain domain);
	
	public void deleteMember(int sabun);
	
public List<domainCom> joinList();
	
	public List<domainCom> posList();
	
	public List<domainCom> deptList();
	
	public List<domainCom> jobList();
	
	public List<domainCom> ynList();
	
	public List<domainCom> milTypeList();
	
	public List<domainCom> kosaYnList();
	
	public List<domainCom> schoolList();
	
	public List<domainCom> gradeList();
	
	public List<domainCom> kosaGradeList();
	
	public List<domainCom> genderList();
	
	public List<domainCom> milYnList();
	
	public String reprofile(int sabun);
	
	public String recmp(int sabun);
	
	public String recar(int sabun);
	
	public String idChk(String id1);
	//ajax용
		public void deleteMember(String sabun);
		
}
