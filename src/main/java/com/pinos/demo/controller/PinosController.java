package com.pinos.demo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pinos.demo.service.MemberService;

import com.pinos.demo.domain.Domain;
import com.pinos.demo.domain.domainCom;

@Controller
public class PinosController {
	
	private final static String DEFAULT_PATH = "resources/upload/";
	
	@Autowired
	private MemberService memberService;
	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/memberList")
	public String memberList(Model model, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum, 
			Domain domain, @RequestParam(value="sabun1", required=false, defaultValue="0") int sabun, 
			@RequestParam(value="name2", required=false, defaultValue="") String name1, 
			@RequestParam(value="joinGbnCode1", required=false, defaultValue="") String joinGbnCode, 
			@RequestParam(value="putYn1", required=false, defaultValue="") String putYn, 
			@RequestParam(value="jobType1", required=false, defaultValue="") String jobType, 
			@RequestParam(value="posGbnCode1", required=false, defaultValue="") String posGbnCode, 
			@RequestParam(value="joinDay1", required=false, defaultValue="") String joinDay, 
			@RequestParam(value="retireDay1", required=false, defaultValue="") String retireDay, 
			domainCom domaincom,
			String code, String gubun, String name, String note) {
		System.out.println("컨트롤러시작12");
		domain.setSabun(sabun);
		domain.setName1(name1);
		domain.setJoinGbnCode(joinGbnCode);
		domain.setPutYn(putYn);
		domain.setJobType(jobType);
		domain.setPosGbnCode(posGbnCode);
		domain.setJoinDay(joinDay);
		domain.setRetireDay(retireDay);
		
		System.out.println("컨트롤 입사" + joinDay);
		System.out.println("ㅇㅇ" + domain.getJoinDay());
		
		
		List<domainCom> join = memberService.joinList();
		List<domainCom> pos = memberService.posList();
		List<domainCom> dept = memberService.deptList();
		List<domainCom> job = memberService.jobList();
		List<domainCom> yn = memberService.ynList();
		List<domainCom> milType = memberService.milTypeList();
		List<domainCom> kosaYn = memberService.kosaYnList();
		List<domainCom> school = memberService.schoolList();
		List<domainCom> grade = memberService.gradeList();
		List<domainCom> kosaGrade = memberService.kosaGradeList();
		List<domainCom> gender = memberService.genderList();
		List<domainCom> milYn = memberService.milYnList();
		
		
		model.addAttribute("join", join);
		model.addAttribute("pos", pos);
		model.addAttribute("dept", dept);
		model.addAttribute("job", job);
		model.addAttribute("yn", yn);
		model.addAttribute("milType", milType);
		model.addAttribute("kosaYn", kosaYn);
		model.addAttribute("school", school);
		model.addAttribute("grade", grade);
		model.addAttribute("kosaGrade", kosaGrade);
		model.addAttribute("gender", gender);
		model.addAttribute("milYn", milYn);
		
		boolean searchOption = (domain.getSabun() == (0)) && (domain.getName1().equals(""))
				&& (domain.getJoinGbnCode().equals("")) && (domain.getPutYn().equals(""))
				&& (domain.getPosGbnCode().equals("")) && (domain.getJobType().equals("")) 
				&& (domain.getJoinDay().equals("")) 
				&& (domain.getRetireDay().equals("")) ? false : true;
		
		
		Map<String, Object> modelMap = memberService.memberList(pageNum, domain);
		
		model.addAllAttributes(modelMap);
		System.out.println("네임1" +name1);
		System.out.println(modelMap);
		System.out.println("컨트롤러 끝");
		System.out.println("리스트 페이지넘" + pageNum);
		System.out.println("리스트 서치옵션" + searchOption);
		
		return "memberList";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm(Model model, domainCom domaincom,
										String code, String gubun, String name, String note, Domain domain, 
										@RequestParam(value="pageNum", required=false, defaultValue="1")
	int pageNum) {
		
		List<domainCom> join = memberService.joinList();
		List<domainCom> pos = memberService.posList();
		List<domainCom> dept = memberService.deptList();
		List<domainCom> job = memberService.jobList();
		List<domainCom> yn = memberService.ynList();
		List<domainCom> milType = memberService.milTypeList();
		List<domainCom> kosaYn = memberService.kosaYnList();
		List<domainCom> school = memberService.schoolList();
		List<domainCom> grade = memberService.gradeList();
		List<domainCom> kosaGrade = memberService.kosaGradeList();
		List<domainCom> gender = memberService.genderList();
		List<domainCom> milYn = memberService.milYnList();
		
		
		model.addAttribute("join", join);
		model.addAttribute("pos", pos);
		model.addAttribute("dept", dept);
		model.addAttribute("job", job);
		model.addAttribute("yn", yn);
		model.addAttribute("milType", milType);
		model.addAttribute("kosaYn", kosaYn);
		model.addAttribute("school", school);
		model.addAttribute("grade", grade);
		model.addAttribute("kosaGrade", kosaGrade);
		model.addAttribute("gender", gender);
		model.addAttribute("milYn", milYn);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("join " + join);
		
		return "memberJoinForm";
	}
	
	@RequestMapping(value="/joinProcess", method=RequestMethod.POST)
	public String insertMember(HttpServletRequest request, Model model, String name1, String engName, String id1, String pwd, String phone, 
				String hp, String hregNo, String sex, String email, String addr1,
				String addr2, String jobType, String gartLevel, String putYn, String milYn,
				String milType, String milLevel, String milStartdate, String milEnddate,
				String kosaRegYn, String kosaClassCode, String crmName, String cmpRegNo,
				String cmpRegImage, String carrier, String profile1, String selfIntro, String joinDay, 
				String retireDay, String posGbnCode, String joinGbnCode, String deptCode, String emailDomain, 
				@RequestParam(value="years2", required=false, defaultValue="0") int years1, 
				@RequestParam(value="zip1", required=false, defaultValue="0") int zip, 
				@RequestParam(value="salary1", required=false, defaultValue="0") int salary, 
				@RequestParam(value="profile2", required=false) MultipartFile multipartFile, 
				@RequestParam(value="cmpRegImage1", required=false) MultipartFile multipartFile1, 
				@RequestParam(value="carrier1", required=false) MultipartFile multipartFile2) throws IOException {
		
		
		System.out.println("originname : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		Domain domain = new Domain();
		System.out.println(name1);
		domain.setName1(name1);
		domain.setEngName(engName);
		domain.setId1(id1);
		domain.setPwd(pwd);
		domain.setPhone(phone);
		domain.setHp(hp);
		domain.setRegNo(hregNo);
		

		
		domain.setSex(sex);
		domain.setEmail(email + "@" + emailDomain);
		domain.setAddr1(addr1);
		domain.setAddr2(addr2);
		domain.setJobType(jobType);
		domain.setGartLevel(gartLevel);
		domain.setPutYn(putYn);
		domain.setMilYn(milYn);
		domain.setMilType(milType);
		domain.setMilLevel(milLevel);
		domain.setMilStartdate(milStartdate);
		domain.setMilEnddate(milEnddate);
		domain.setKosaRegYn(kosaRegYn);
		domain.setKosaClassCode(kosaClassCode);
		domain.setCrmName(crmName);
		domain.setCmpRegNo(cmpRegNo);
		domain.setCmpRegImage(cmpRegImage);
		domain.setCarrier(carrier);
		
		domain.setSelfIntro(selfIntro);
		
		domain.setJoinDay(joinDay);
		
		
		System.out.println(joinDay);
		domain.setRetireDay(retireDay);
		domain.setPosGbnCode(posGbnCode);
		domain.setJoinGbnCode(joinGbnCode);
		domain.setDeptCode(deptCode);
		
		domain.setYears1(years1);
		domain.setZip(zip);
		domain.setSalary(salary);
		System.out.println(years1);
		System.out.println(zip);
		System.out.println(salary);
		
		System.out.println(hp);
		/* model.addAttribute("name1", name1); */
		
		if(!multipartFile.isEmpty()) {
			System.out.println("파일다운로드 들어옴");
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("joinProcess - new Name : " + file.getName());
			System.out.println("join process - filePath : " + filePath);
			multipartFile.transferTo(file);
			
			domain.setProfile1(saveName);
			
			
		}
		
		if(!multipartFile1.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile1.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("joinProcess - new Name : " + file.getName());
			System.out.println("join process - filePath : " + filePath);
			multipartFile1.transferTo(file);
			
			
			domain.setCmpRegImage(saveName);
			
			
		}

		if(!multipartFile2.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile2.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("joinProcess - new Name : " + file.getName());
			System.out.println("join process - filePath : " + filePath);
			multipartFile2.transferTo(file);
			
			
			domain.setCarrier(saveName);
			
		}
		
		System.out.println("컨트롤러 파일 업로드 : " + domain.getProfile1());
		System.out.println("컨트롤러 등록증 업로드 : " + domain.getCmpRegImage());
		
		
		memberService.insertMember(domain);
		System.out.println("컨트롤러 우편번호" + domain.getZip());
		return "redirect:joinForm";
	}
	
	@RequestMapping("/memberUpdateForm")
	public String memberDetail(Model model, int sabun, @RequestParam(value="pageNum", required=false, defaultValue="1")
	int pageNum, domainCom domaincom, 
	@RequestParam(value="sabun1", required=false, defaultValue="0") String sabun1, 
	@RequestParam(value="name2", required=false, defaultValue="") String name2, 
	@RequestParam(value="joinGbnCode1", required=false, defaultValue="") String joinGbnCode1, 
	@RequestParam(value="putYn1", required=false, defaultValue="") String putYn1, 
	@RequestParam(value="jobType1", required=false, defaultValue="") String jobType1, 
	@RequestParam(value="posGbnCode1", required=false, defaultValue="") String posGbnCode1, 
	@RequestParam(value="joinDay1", required=false, defaultValue="") String joinDay1, 
	@RequestParam(value="retireDay1", required=false, defaultValue="") String retireDay1) {
		
		Domain domain1 = new Domain();
		
		
		
		domain1.setSabun(Integer.parseInt(sabun1));
		domain1.setName1(name2);
		domain1.setJoinGbnCode(joinGbnCode1);
		domain1.setPutYn(putYn1);
		domain1.setJobType(jobType1);
		domain1.setPosGbnCode(posGbnCode1);
		domain1.setJoinDay(joinDay1);
		domain1.setRetireDay(retireDay1);
		boolean searchOption = (domain1.getSabun() == (0)) && (domain1.getName1().equals(""))
				&& (domain1.getJoinGbnCode().equals("")) && (domain1.getPutYn().equals(""))
				&& (domain1.getPosGbnCode().equals("")) && (domain1.getJobType().equals("")) 
				&& (domain1.getJoinDay().equals("")) 
				&& (domain1.getRetireDay().equals("")) ? false : true;
		System.out.println("컨트롤러 업데이트폼 이름" + domain1.getName1());
		
		System.out.println("업데이트폼 사번" + domain1.getSabun());
		System.out.println("업데이트폼 이름" + domain1.getName1());
		
		
		
		Domain domain = memberService.detailMember(sabun);
		String re = domain.getRegNo();
		
		String ape = re.split("-")[0];
		System.out.println(ape);
		System.out.println(re.substring(7,8));
		String dee = re.substring(7,8);
		String comp = ape + "-" + dee + "******";
		System.out.println(comp);
		domain.setRegNo(comp);
		/*
		 * System.out.println("수정폼 증명사진" + domain.getProfile1());
		 * System.out.println("업데이트 폼 : " + domain.getZip());
		 */
		
		model.addAttribute("domain", domain);
		System.out.println(domain.getJoinDay());
		System.out.println("컨트롤러 업데이트 폼 : " + domain.getEmail());
		List<domainCom> join = memberService.joinList();
		List<domainCom> pos = memberService.posList();
		List<domainCom> dept = memberService.deptList();
		List<domainCom> job = memberService.jobList();
		List<domainCom> yn = memberService.ynList();
		List<domainCom> milType = memberService.milTypeList();
		List<domainCom> kosaYn = memberService.kosaYnList();
		List<domainCom> school = memberService.schoolList();
		List<domainCom> grade = memberService.gradeList();
		List<domainCom> kosaGrade = memberService.kosaGradeList();
		List<domainCom> gender = memberService.genderList();
		List<domainCom> milYn = memberService.milYnList();
		
		
		model.addAttribute("join", join);
		model.addAttribute("pos", pos);
		model.addAttribute("dept", dept);
		model.addAttribute("job", job);
		model.addAttribute("yn", yn);
		model.addAttribute("milType", milType);
		model.addAttribute("kosaYn", kosaYn);
		model.addAttribute("school", school);
		model.addAttribute("grade", grade);
		model.addAttribute("kosaGrade", kosaGrade);
		model.addAttribute("gender", gender);
		model.addAttribute("milYn", milYn);
		
		
		 String mail = domain.getEmail(); 
		 int idx = mail.indexOf("@"); 
		 String email = mail.substring(0,idx); 
		 String emailDomain = mail.substring(idx + 1);
		 
		 model.addAttribute("email", email);
		 model.addAttribute("emailDomain", emailDomain);
		 System.out.println("컨트롤러 수정폼" + email); 
		 System.out.println("수정폼 : " + emailDomain);
		 
		/*
		 * System.out.println(domain.getJoinDay()); String joinDay =
		 * domain.getJoinDay().substring(0,10); System.out.println(joinDay);
		 * model.addAttribute("joinDay", joinDay); String retireDay =
		 * domain.getRetireDay().substring(0,10); System.out.println(retireDay);
		 * model.addAttribute("retireDay", retireDay);
		 */
		model.addAttribute("pageNum", pageNum);
		
		model.addAttribute("searchOption", searchOption);
		/*
		 * System.out.println(domain.getEmail()); String[] array =
		 * domain.getEmail().split("@"); System.out.println(array[0]);
		 * domain.setEmail(array[0]); model.addAttribute("emailDomain", array[1]);
		 * System.out.println(emailDomain);
		 */
		
		if(searchOption) {
			model.addAttribute("domain1", domain1);
			}
		
		System.out.println("업데이트폼 서치옵션" + searchOption);
		return "memberUpdateForm";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
		public String updateMember(HttpServletResponse response, HttpServletRequest request,String email, Domain domain, Model model, String emailDomain, 
				RedirectAttributes reAttrs, @RequestParam(value="zip1", required=false, defaultValue="0") int zip, 
				@RequestParam(value="years2", required=false, defaultValue="0") int years1, 
				@RequestParam(value="pageNum", required=false, defaultValue="1")
				int pageNum, @RequestParam(value="name2", required=false, defaultValue="") String name2, 
				@RequestParam(value="sabun1", required=false, defaultValue="0") int sabun1, 
				
				@RequestParam(value="joinGbnCode1", required=false, defaultValue="") String joinGbnCode1, 
				@RequestParam(value="putYn1", required=false, defaultValue="") String putYn1, 
				@RequestParam(value="jobType1", required=false, defaultValue="") String jobType1, 
				@RequestParam(value="posGbnCode1", required=false, defaultValue="") String posGbnCode1, 
				@RequestParam(value="joinDay1", required=false, defaultValue="") String joinDay1, 
				@RequestParam(value="retireDay1", required=false, defaultValue="") String retireDay1, 

				@RequestParam(value="profile2", required=false) MultipartFile multipartFile, 
				@RequestParam(value="cmpRegImage1", required=false, defaultValue="null") MultipartFile multipartFile1, 
				@RequestParam(value="carrier1", required=false, defaultValue="null") MultipartFile multipartFile2) throws Exception {
		
		
			domain.setEmail(email + "@" + emailDomain);
			domain.setZip(zip);
			
			Domain domain1 = new Domain();
			domain1.setSabun(sabun1);
			domain1.setName1(name2);
			domain1.setJoinGbnCode(joinGbnCode1);
			domain1.setPutYn(putYn1);
			domain1.setJobType(jobType1);
			domain1.setPosGbnCode(posGbnCode1);
			domain1.setJoinDay(joinDay1);
			domain1.setRetireDay(retireDay1);
			System.out.println("Domain Name - " + domain.getName1());
			System.out.println("Domain1 Name - " + domain1.getName1());
			System.out.println("Name2 - " + name2);
			boolean searchOption = (domain1.getSabun() == (0)) && (domain1.getName1().equals(""))
					&& (domain1.getJoinGbnCode().equals("")) && (domain1.getPutYn().equals(""))
					&& (domain1.getPosGbnCode().equals("")) && (domain1.getJobType().equals("")) 
					&& (domain1.getJoinDay().equals("")) 
					&& (domain1.getRetireDay().equals("")) ? false : true;
			
			if(multipartFile.isEmpty()) {
				String rep = memberService.reprofile(domain.getSabun());
				domain.setProfile1(rep);
				System.out.println("너너너" + rep);
			}
			
			if(multipartFile1.isEmpty()) {
				String cmp = memberService.recmp(domain.getSabun());
				domain.setCmpRegImage(cmp);
				System.out.println("너너s너" + cmp);
			}
			
			if(multipartFile2.isEmpty()) {
				String car = memberService.recar(domain.getSabun());
				domain.setCarrier(car);
				System.out.println("너너f너" + car);
			}
			
			
			
			if(!multipartFile.isEmpty()) {
				System.out.println("파일다운로드 들어옴");
				String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
				
				UUID uid = UUID.randomUUID();
				String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
				
				File file = new File(filePath, saveName);
				System.out.println("joinProcess - new Name : " + file.getName());
				System.out.println("join process - filePath : " + filePath);
				multipartFile.transferTo(file);
				
				domain.setProfile1(saveName);
				
				
			}
			
			if(!multipartFile1.isEmpty()) {
				
				String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
				
				UUID uid = UUID.randomUUID();
				String saveName = uid.toString() + "_" + multipartFile1.getOriginalFilename();
				
				File file = new File(filePath, saveName);
				System.out.println("joinProcess - new Name : " + file.getName());
				System.out.println("join process - filePath : " + filePath);
				multipartFile1.transferTo(file);
				
				
				domain.setCmpRegImage(saveName);
				
				
			}

			if(!multipartFile2.isEmpty()) {
				
				String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
				
				UUID uid = UUID.randomUUID();
				String saveName = uid.toString() + "_" + multipartFile2.getOriginalFilename();
				
				File file = new File(filePath, saveName);
				System.out.println("joinProcess - new Name : " + file.getName());
				System.out.println("join process - filePath : " + filePath);
				multipartFile2.transferTo(file);
				
				
				domain.setCarrier(saveName);
				
			}
			
			domain.setYears1(years1);
			System.out.println("컨트롤러 테스트" + domain.getName1());
			
			memberService.updateMember(domain);
			
			System.out.println("컨트롤러 수정" + domain.getEmail());
			
			
			/*
			 * model.addAttribute("emailDomain", emailDomain);
			 * System.out.println("업데이트 이메일 도메인" + emailDomain);
			 */
			System.out.println("도메인1" + domain1);
			reAttrs.addAttribute("pageNum", pageNum);
			System.out.println("업데이트 페이지넘" + pageNum);
			
			reAttrs.addAttribute("searchOption", searchOption);
			System.out.println("업데이트 서치옵션" + searchOption);
			
			System.out.println("사번사번" + domain1.getSabun());
			 if(searchOption) { 
				 reAttrs.addAttribute("name2", domain1.getName1());
				 reAttrs.addAttribute("sabun1", domain1.getSabun());
				 reAttrs.addAttribute("joinGbnCode1", domain1.getJoinGbnCode());
				 reAttrs.addAttribute("putYn1", domain1.getPutYn());
				 reAttrs.addAttribute("posGbnCode1", domain1.getPosGbnCode());
				 reAttrs.addAttribute("joinDay1", domain1.getJoinDay());
				 reAttrs.addAttribute("retireDay1", domain1.getRetireDay());
				 reAttrs.addAttribute("jobType1", domain1.getJobType());
			 }
			 
			 
			
			
			
			if(domain.getCmpRegImage() != null) {
				model.addAttribute("fileName",
				URLEncoder. encode (domain.getCmpRegImage(), "utf-8"));
				}
		
			return "redirect:memberList";
	}
	
	//다운로드
	@RequestMapping("/fileDownload")
	public void download(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
	String fileName = request.getParameter("fileName");
	System. out .println("fileName : " + fileName);
	String filePath =
	request.getServletContext().getRealPath( DEFAULT_PATH );
	File file = new File(filePath, fileName);
	System. out .println("file.getName() : " + file.getName());
	
	response.setContentType("application/download; charset=UTF-8");
	response.setContentLength((int) file.length());
	
	fileName = URLEncoder. encode (file.getName(), "UTF-8");
	System. out .println("다운로드 fileName : " + fileName);
	
	response.setHeader("Content-Disposition",
	"attachment; filename=\"" + fileName + "\";");
	
	response.setHeader("Content-Transfer-Encoding", "binary");
	
	OutputStream out = response.getOutputStream();
	FileInputStream fis = null;
	
	fis = new FileInputStream(file);
	
	FileCopyUtils. copy (fis, out);
	if(fis != null) {
	fis.close();
	}
	
	out.flush();
	}
	
	
	
	
	
	//삭제
	@RequestMapping("/delete")
	public String deleteMember(HttpServletResponse response, 
				int sabun, 
				RedirectAttributes reAttrs,
				@RequestParam(value="pageNum", required=false, defaultValue="1")
				int pageNum) {
		
		
		memberService.deleteMember(sabun);;
		reAttrs.addAttribute("pageNum", pageNum);
		
		
		return "redirect:memberList";
	}
	
	//체크박스 삭제
	@RequestMapping("/ajaxDelete")
	public String ajaxdelete(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i = 0; i < size; i++) {
			memberService.deleteMember(ajaxMsg[i]);
		}
		return "redirect:memberList";
	}
	
	@RequestMapping("/idChk")
	@ResponseBody
	public String idChk(Domain domain) throws Exception {
		System.out.println("컨트롤러");
		System.out.println(domain.getId1());
		String result = memberService.idChk(domain.getId1());
		System.out.println(result);
	
		return result;
	}
	
	
	
	
	
	@RequestMapping("/main")
	public String main() {
		
		return "main";
	}
	
	
	
	@RequestMapping("/a")
	public String mainPage() {
		
		return "mainPage";
	}
	
}
