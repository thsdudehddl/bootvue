package com.pinos.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pinos.demo.domain.Domain;
import com.pinos.demo.domain.domainCom;
@Mapper
public interface MemberDao {
	
	public abstract List<Domain> memberList(Map<String, Object> params);
	
	//직원수 구하기
	public abstract int getMemberCount(Domain domain);
	
	public void insertMember(Domain domain);
	
	public Domain detailMember(int no);
	
	public void updateMember(Domain domain);
	
	public void deleteMember(int sabun);
	//입사여부
		public List<domainCom> join();
		//직위
		public List<domainCom> pos();
		//부서
		public List<domainCom> dept();
		//직종
		public List<domainCom> job();
		//투입여부
		public List<domainCom> yn();
		//군별
		public List<domainCom> milType();
		//KOSA등록
		public List<domainCom> kosaYn();
		//학력
		public List<domainCom> school();
		//계급
		public List<domainCom> grade();
		//KOSA등급
		public List<domainCom> kosaGrade();
		//성별
		public List<domainCom> gender();
		//군필여부
		public List<domainCom> milYn();
	
	public String idChk(String id1);
	
	public String reprofile(int sabun);
	
	public String recmp(int sabun);
	
	public String recar(int sabun);
	
	//ajax용
		public void deleteMember(String sabun);
	
}
