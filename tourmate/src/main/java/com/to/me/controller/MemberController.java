package com.to.me.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.to.me.dto.FreeBoardDTO;
import com.to.me.dto.MateBoardDTO;
import com.to.me.dto.MemberDTO;
import com.to.me.dto.UserBoardDTO;

@Controller
public class MemberController<E> {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	MailSender mailSender;

	// 로그인폼으로 가기
	@RequestMapping("/loginform")
	public String loginform() {

		return "login";
	}
	
	
	// 로그인폼으로 가기
	@RequestMapping("/mypage")
	public String mypage() {

		return "mypage";
	}
	

	// 로그인처리
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model,
			MemberDTO mDto, HttpSession session) {
		System.out.println("login()");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		int login;

		List<MemberDTO> list = sqlSession.selectList("login", map);

		if (list.isEmpty()) {
			login = 0;
		} else if (mem_pwd.equals(list.get(0).getMem_pwd())) {
			session.setAttribute("mem_id", mem_id);
			login = 1;
			session.setAttribute("mem_pic", sqlSession.selectOne("getpic", mem_id));
			session.setAttribute("mem_grade", sqlSession.selectOne("selectGrade",session.getAttribute("mem_id")));
			session.setAttribute("memoReceiveCount", sqlSession.selectOne("memoReceiveCount", mem_id));
		} else {
			login = 2;
		}
		model.addAttribute("login", login);

		return "login";
	}

	// 로그아웃 처리
	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "login";
	}

	// 회원가입페이지로 가기
	@RequestMapping("/joinForm")
	public String joinForm(HttpServletRequest request, Model model) {
		model.addAttribute("mem_id", request.getParameter("mem_id"));	
		model.addAttribute("check", request.getParameter("check"));
		
		return "joinForm";
	}

	@RequestMapping("/joinOk")
	// 회원가입 축하
	public String joinOk(MultipartRequest file_path,
			HttpServletRequest request, MemberDTO dto, Model model) {
		System.out.println("joinOk()");
		MultipartFile multipartResolver = file_path.getFile("file");

		if (multipartResolver.getOriginalFilename() != "") {
			String beforememImg = multipartResolver.getOriginalFilename();
			String memImg = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			memImg = today + UUID.randomUUID().toString()
					+ beforememImg.substring(beforememImg.lastIndexOf("."));
			
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "resources" + File.separator + "memberPic" + File.separator;
			try {
				File file = new File(filePath + memImg);
				dto.setMem_pic(memImg);
				System.out.println(memImg);
				multipartResolver.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else if (multipartResolver.getOriginalFilename() == "") {
			dto.setMem_pic("mem_pic");
		}
		sqlSession.insert("joinInsert", dto);
		model.addAttribute("mem_name", dto.getMem_name());
		return "login";
	}
	
/////////////////////// id 중복확인 ajax 처리	
	@RequestMapping("/confirmId")
	public void confirmId(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		String confirm_id = request.getParameter("confirm_id");
		System.out.println(confirm_id);
		String conId = sqlSession.selectOne("confirmId", confirm_id);
		JSONArray ja = new JSONArray();

		if (confirm_id != "") {

			if (conId == null) {
				ja.add("<font color='blue' size='2'>" + confirm_id + "는 사용 가능한 아이디 입니다." + "</font>");
			} else {
				ja.add("<font color='red' size='2'>" + confirm_id + "는 이미 사용중인 아이디 입니다." + "</font>");
			}
		} else {
			ja.add("<font color='red' size='2'>" + "아이디를 입력해주세요" + "<font>");
		}
		PrintWriter out = response.getWriter();
		out.print(ja.toString());

	}
/////////////////////// id 중복확인 ajax 처리

	// 회원수정페이지로 가기
	@RequestMapping("/modifyForm")
	public String modifyForm(HttpServletRequest request, MemberDTO dto,
			Model model, HttpSession session) {
		System.out.println("modifyForm()");
		//String mem_id = request.getParameter("mem_id");
		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println("ERg = " + session.getAttribute("mem_id"));
		System.out.println("sdf = " + mem_id);
		model.addAttribute("dto", sqlSession.selectOne("modifyForm", mem_id));
		
		return "modifyForm";
	}

	@RequestMapping("/modifyOk")
	public String modifyOk(MultipartRequest file_path, HttpServletRequest request, MemberDTO dto,
			Model model, HttpSession session) {
System.out.println("modifyOk()");
		
		MultipartFile multipartResolver = file_path.getFile("file");

		if (multipartResolver.getOriginalFilename() != "") {
			String beforememImg = multipartResolver.getOriginalFilename();
			String memImg = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			memImg = today + UUID.randomUUID().toString()
					+ beforememImg.substring(beforememImg.lastIndexOf("."));
			
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //파일 기본경로 _ 상세경로
			String filePath = dftFilePath + "resources" + File.separator + "memberPic" + File.separator;
			
			///////////////////////////기존 사진 삭제
			String mem_id = (String) session.getAttribute("mem_id");
			dto = sqlSession.selectOne("modifyForm", mem_id);
			File file = new File(filePath + dto.getMem_pic());
			file.delete();
			///////////////////////////////////////////
			
			try {
				file = new File(filePath + memImg);
			
				dto.setMem_pic(memImg);
				System.out.println(memImg);
				multipartResolver.transferTo(file);
				System.out.println(multipartResolver.getName());
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else if (multipartResolver.getOriginalFilename() == "") {
			dto.setMem_pic("90159.jpg");
		}
		

		System.out.println(dto.getMem_name());
		System.out.println(dto.getMem_email());
		sqlSession.update("modifyOk", dto);
		return "login";
	}

	// 회원삭제
	@RequestMapping("/memberDelete")
	public String memberDelete(HttpServletRequest request, MemberDTO dto,
			Model model, HttpSession session) {
		System.out.println("memberDelete()");
		String mem_id = (String) session.getAttribute("mem_id");
		dto = sqlSession.selectOne("modifyForm", mem_id);
		
		String dftFilePath = request.getSession().getServletContext().getRealPath("/");
		 //파일 기본경로 _ 상세경로
		String filePath = dftFilePath + "resources" + File.separator + "memberPic" + File.separator;
		File file = new File(filePath + dto.getMem_pic());
		file.delete();
		
		//String mem_id = request.getParameter("mem_id");
		sqlSession.delete("memberDelete", mem_id);
		
		sqlSession.delete("freeDelete", mem_id);
		sqlSession.delete("freereplyDelete", mem_id);
		sqlSession.delete("userDelete", mem_id);
		sqlSession.delete("userreplyDelete", mem_id);
		sqlSession.delete("mateDelete", mem_id);
		sqlSession.delete("matereplyDelete", mem_id);
		sqlSession.delete("matememberDelete", mem_id);
		
		session.invalidate();
		return "login";
	}

	@RequestMapping("/researchIdForm")
	public String researchIdForm() {
		System.out.println("researchIdForm()");

		return "researchIdForm";
	}

	@RequestMapping("/researchId")
	public String researchId(String mem_email, Model model) {
		System.out.println("researchId");
		try {
			model.addAttribute("dto",
					sqlSession.selectOne("researchId", mem_email));

			Map<String, Object> map = model.asMap();

			MemberDTO dto = (MemberDTO) map.get("dto");

			SimpleMailMessage message = new SimpleMailMessage();

			message.setFrom("ujo2417@gmail.com");
			message.setTo(mem_email);
			message.setSubject("[tour mate]귀하의 ID찾기 결과입니다.");
			message.setText("ID는 " + dto.getMem_id() + "입니다.");
			mailSender.send(message);
		} catch (Exception e) {
			return "researchIdError";
		}
		return "researchIdOk";
	}
	
	@RequestMapping("/researchPwdForm")
	public String researchPwdForm(){
		System.out.println("researchPwdForm");
		
		return "researchPwdForm";
	}
	
	@RequestMapping("/researchPwd")
	public String researchPwd(MemberDTO mdto, Model model) {
		System.out.println("researchPwd");
		try {
			
			model.addAttribute("dto", sqlSession.selectOne("researchId", mdto));

			Map<String, Object> map = model.asMap();

			MemberDTO dto = (MemberDTO) map.get("dto");

			SimpleMailMessage message = new SimpleMailMessage();

			message.setFrom("ujo2417@gmail.com");
			message.setTo(dto.getMem_email());
			message.setSubject("[tour mate]귀하의 비밀번호찾기 결과입니다.");
			message.setText("password는 " + dto.getMem_pwd());
			mailSender.send(message);
		} catch (Exception e) {
			return "researchIdError";
		}
		return "researchPwdOk";
	}
	
	//상대방 정보 보기
	@RequestMapping("/memberDetail")
	public String memberDetail(HttpServletRequest request, MemberDTO dto,
			Model model) {
		System.out.println("memberDetail()");
		String mem_id = request.getParameter("mem_id");
		dto = sqlSession.selectOne("modifyForm", mem_id);
		
		model.addAttribute("dto", dto);
		
		return "memberDetail";
	}
	
	// 메이트 신청 확인
			@RequestMapping("/mateJoinList")
			public String mateJoinList(HttpServletRequest request, Model model, HttpSession session) {
				System.out.println("mateJoinList()");

				String mem_id = (String) session.getAttribute("mem_id");
				System.out.println(mem_id);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("mem_id", mem_id);
				
				
				model.addAttribute("mate_list", sqlSession.selectList("mateJoinList", map));

				return "mateJoinList";
			}
			
			@RequestMapping("/memberview")   //회원이 쓴 글보기
			   public String memeber_view(HttpSession session, Model model, MemberDTO dto, FreeBoardDTO fdto, MateBoardDTO mdto, UserBoardDTO udto) {
			      System.out.println("memberView()");
			      
			      return "memberView";
			   }
			
			@RequestMapping("/memberView_free")   //회원이 쓴 글보기 자유게시판
			   public String memberView_free(HttpSession session, Model model, MemberDTO dto, FreeBoardDTO fdto, MateBoardDTO mdto, UserBoardDTO udto) {
			      System.out.println("memberView_free()");
			      String mem_id = (String) session.getAttribute("mem_id");
			      Map<String, Object> map = new HashMap<String, Object>();
			      map.put("mem_id", mem_id);
			      
			      model.addAttribute("memberview_free", sqlSession.selectList("memberview_free", map));
			      model.addAttribute("memberview_free_reply", sqlSession.selectList("memberview_free_reply", map));
			      
			      return "memberView_free";
			   }
			@RequestMapping("/memberView_user")   //회원이 쓴 글보기 유저게시판
			   public String memberView_user(HttpSession session, Model model, MemberDTO dto, FreeBoardDTO fdto, MateBoardDTO mdto, UserBoardDTO udto) {
			      System.out.println("memberView_user()");
			      String mem_id = (String) session.getAttribute("mem_id");
			      Map<String, Object> map = new HashMap<String, Object>();
			      map.put("mem_id", mem_id);
			      
			      model.addAttribute("memberview_user", sqlSession.selectList("memberview_user", map));
			      model.addAttribute("memberview_user_reply", sqlSession.selectList("memberview_user_reply", map));
			      
			      return "memberView_user";
			   }
			@RequestMapping("/memberView_mate")   //회원이 쓴 글보기 메이트게시판
			   public String memberView_mate(HttpSession session, Model model, MemberDTO dto, FreeBoardDTO fdto, MateBoardDTO mdto, UserBoardDTO udto) {
			      System.out.println("memberView_mate()");
			      String mem_id = (String) session.getAttribute("mem_id");
			      Map<String, Object> map = new HashMap<String, Object>();
			      map.put("mem_id", mem_id);
			      
			      model.addAttribute("memberview_mate", sqlSession.selectList("memberview_mate", map));
			      model.addAttribute("memberview_mate_reply", sqlSession.selectList("memberview_mate_reply", map));
			      
			      return "memberView_mate";
			   }
			
		/*	@RequestMapping("/memberview")   //회원 상세보기
			   public String memeber_view(HttpSession session, Model model, MemberDTO dto, FreeBoardDTO fdto, MateBoardDTO mdto, UserBoardDTO udto) {
			      System.out.println("memberView()");
			      
			      String mem_id = (String) session.getAttribute("mem_id");
			      Map<String, Object> map = new HashMap<String, Object>();
			      map.put("mem_id", mem_id);
			      
			      model.addAttribute("memberview_free", sqlSession.selectList("memberview_free", map));
			      model.addAttribute("memberview_user", sqlSession.selectList("memberview_user", map));
			      model.addAttribute("memberview_mate", sqlSession.selectList("memberview_mate", map));
			      
			      model.addAttribute("memberview_free_reply", sqlSession.selectList("memberview_free_reply", map));
			      model.addAttribute("memberview_user_reply", sqlSession.selectList("memberview_user_reply", map));
			      model.addAttribute("memberview_mate_reply", sqlSession.selectList("memberview_mate_reply", map));
			    
			 
			      //model.addAttribute("memberview_mate_mem", );
			      
			      return "memberView";
			   }*/
}
