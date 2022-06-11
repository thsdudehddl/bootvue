package com.pinos.demo.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pinos.demo.dao.MemberDao;
import com.pinos.demo.domain.Domain;
import com.pinos.demo.domain.domainCom;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final int PAGE_SIZE = 10;
	
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public Map<String, Object> memberList(int pageNum, Domain domain) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage -1) * PAGE_SIZE + 1;
		int endRow = startRow + PAGE_GROUP -1;
		
		boolean searchOption = (domain.getSabun() == (0)) && (domain.getName1().equals(""))
				&& (domain.getJoinGbnCode().equals("")) && (domain.getPutYn().equals(""))
				&& (domain.getPosGbnCode().equals("")) && (domain.getJobType().equals("")) 
				&& (domain.getJoinDay().equals("")) 
				&& (domain.getRetireDay().equals("")) ? false : true;
		System.out.println("서비스 서치옵션1" + searchOption);
		System.out.println("서비스 도메인쩜 사번" + domain.getSabun());
		System.out.println("서비스 도메인쩜 네임" + domain.getName1());
		System.out.println("서비스 도메인쩜 네임" + domain.getJoinGbnCode());
		System.out.println("서비스 도메인쩜 네임" + domain.getPutYn());
		System.out.println("서비스 도메인쩜 네임" + domain.getPosGbnCode());
		System.out.println("서비스 도메인쩜 네임" + domain.getJobType());
		System.out.println("서비스 도메인쩜 네임" + domain.getJoinDay());
		System.out.println("서비스 도메인쩜 네임" + domain.getRetireDay());
		
		int listCount = memberDao.getMemberCount(domain);
		System.out.println("서비스에서 이스트카운트 타임 키워드 도메인쩜 네임 : " + listCount + domain.getName1());
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("domain", domain);
		
		List<Domain> memberList = memberDao.memberList(params);
		
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP -1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("memberList", memberList);
		
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		modelMap.put("searchOption", searchOption);
		for(int i = 0; i < memberList.size(); i++) {
			System.out.println("서비스 리스트" + memberList.get(i).getRegNo());
			String mno = memberList.get(i).getRegNo();
			String ap = mno.split("-")[0];
			System.out.println(ap);
			System.out.println(mno.substring(7,8));
			String de = mno.substring(7,8);
			String comp = ap + "-" + de + "******";
			System.out.println(comp);
			memberList.get(i).setRegNo(comp);
		}
		if(searchOption) {
			modelMap.put("domain", domain);
			
			
		}
		System.out.println("서비스마지막 타입 키워드 리스트카운트 도메인쩜 네임 : " + domain.getName1() + listCount);
		System.out.println("서비스 서치옵션" + searchOption);
		System.out.println("서비스 페이징 : " + pageCount);
		System.out.println("서비스 페이징 : " + startPage);
		System.out.println("서비스 페이징 : " + endPage);
		System.out.println("서비스 페이징 : " + currentPage);
		System.out.println("서비스 페이징 : " + listCount);
		System.out.println("서비스 페이징 : " + PAGE_GROUP);
	System.out.println("asfasf" +domain.getSabun());
	System.out.println("서비스 엔드로우 : " + startRow);
		System.out.println("서비스 엔드로우 : " + endRow);
		return modelMap;
	}


	@Override
	public void insertMember(Domain domain) {
		System.out.println("insertservice");
		memberDao.insertMember(domain);
	}
	
	@Override
	public Domain detailMember(int sabun) {
		return memberDao.detailMember(sabun);
	}

	@Override
	public void updateMember(Domain domain) {
		memberDao.updateMember(domain);
		
	}
	
	@Override
	public void deleteMember(int sabun) {
		System.out.println("삭제");
		memberDao.deleteMember(sabun);
	}
	//ajax용
	@Override
	public void deleteMember(String sabun) {
		System.out.println("삭제");
		memberDao.deleteMember(sabun);
	}

	@Override
	public List<domainCom> joinList() {
		System.out.println("??");
		return memberDao.join();
	}

	@Override
	public List<domainCom> posList() {
		System.out.println("???");
		return memberDao.pos();
	}

	@Override
	public List<domainCom> deptList() {
		
		return memberDao.dept();
	}
	
	@Override
	public List<domainCom> jobList() {
		
		return memberDao.job();
	}
	
	@Override
	public List<domainCom> ynList() {
		
		return memberDao.yn();
	}
	
	@Override
	public List<domainCom> milTypeList() {
		
		return memberDao.milType();
	}

	@Override
	public List<domainCom> kosaYnList() {
		
		return memberDao.kosaYn();
	}

	@Override
	public List<domainCom> schoolList() {
		
		return memberDao.school();
	}
	
	@Override
	public List<domainCom> gradeList() {
		
		return memberDao.grade();
	}
	
	@Override
	public List<domainCom> kosaGradeList() {
		
		return memberDao.kosaGrade();
	}
	
	@Override
	public List<domainCom> genderList() {
		
		return memberDao.gender();
	}
	
	@Override
	public List<domainCom> milYnList() {
		
		return memberDao.milYn();
	}

	@Override
	public String idChk(String id1) {
		
		
		System.out.println("서비스");
		
		return memberDao.idChk(id1);
	}

	@Override
	public String reprofile(int sabun) {
		
		return memberDao.reprofile(sabun);
	}
	
	@Override
	public String recmp(int sabun) {
		
		return memberDao.recmp(sabun);
	}
	
	@Override
	public String recar(int sabun) {
		
		return memberDao.recar(sabun);
	}

	
}
