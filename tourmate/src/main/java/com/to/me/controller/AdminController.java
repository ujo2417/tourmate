package com.to.me.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.me.dto.FreeBoardDTO;
import com.to.me.dto.MateBoardDTO;
import com.to.me.dto.MateMemberDTO;
import com.to.me.dto.MemberDTO;
import com.to.me.dto.UserBoardDTO;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/contact")
	public String contact() {
		System.out.println("contact()");
		return "contact";
	}

	@RequestMapping("/adminpage")
	// 관리자 회원관리 리스트
	public String adminOk(MemberDTO dto, Model model, HttpSession session) {
		System.out.println("adminOk()");

		model.addAttribute("adminList", sqlSession.selectList("adminList"));
		String mem_id = (String)session.getAttribute("mem_id");
		model.addAttribute("count",sqlSession.selectOne("mem_count"));
		model.addAttribute(mem_id);
		return "admincustomerlist";
	}
	
	@RequestMapping("/adminSearchlist")
	// 관리자 회원관리 검색리스트
	public String adminsearch(HttpServletRequest request, MemberDTO dto, Model model, HttpSession session) {
		System.out.println("adminsearch()");
		String memid= request.getParameter("memid");
		String memname=request.getParameter("memname");
		String mem_id = (String)session.getAttribute("mem_id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memid", memid);
		map.put("memname", memname);
		if(memid.length()>0){
			model.addAttribute("adminList", sqlSession.selectList("mem_id_searchlist", map));
			model.addAttribute("count",sqlSession.selectOne("mem_id_searchcount", map));
		}
		if(memname.length()>0){
			model.addAttribute("adminList", sqlSession.selectList("mem_name_searchlist", map));
			model.addAttribute("count",sqlSession.selectOne("mem_name_searchcount", map));
		}
		model.addAttribute(mem_id);
		return "adminsearchlist";
	}

	@RequestMapping("/adminmodifyForm")
	// 회원관리 수정
	public String modifyForm(HttpServletRequest request, MemberDTO dto,
			Model model) {
		System.out.println("adminModifyForm()");

		String mem_id = request.getParameter("mem_id");

		System.out.println(mem_id);

		model.addAttribute("adminList",
				sqlSession.selectOne("modifyForm", mem_id));

		return "adminModifyForm";

	}

	@RequestMapping("/adminModifyOk")
	// 회원 수정 완료
	public String adminModifyOk(HttpServletRequest request, MemberDTO dto,
			Model model) {
		System.out.println("adminModifyOk()");

		sqlSession.update("modifyOk", dto);

		return "redirect:adminpage";
	}

	@RequestMapping("/adminmemberDelete")
	// 회원 삭제
	public String adminmemberDelete(HttpServletRequest request, MemberDTO dto,
			Model model, HttpSession session) {
		System.out.println("adminmemberDelete()");
		String mem_id = request.getParameter("mem_id");
		sqlSession.delete("memberDelete", mem_id);
		
		sqlSession.delete("freeDelete", mem_id);
		sqlSession.delete("freereplyDelete", mem_id);
		sqlSession.delete("userDelete", mem_id);
		sqlSession.delete("userreplyDelete", mem_id);
		sqlSession.delete("mateDelete", mem_id);
		sqlSession.delete("matereplyDelete", mem_id);
		sqlSession.delete("matememberDelete", mem_id);
		
		session.invalidate();
		return "redirect:adminpage";
	}

	@RequestMapping("/adminFreelist")
	// 관리지 자유게시판 리스트
	public String adminfree_list(HttpServletRequest request, Model model) {
		System.out.println("adminFreelist()");

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageSize = 7;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) - 6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		count = sqlSession.selectOne("free_count");
		number = count - (currentPage - 1) * pageSize;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("free_list", sqlSession.selectList("free_list", map));

		return "adminFreelist";
	}

	@RequestMapping("/adminFreelistDelete")
	// 자유게시판 글 삭제
	public String delete(HttpServletRequest request, Model model) {

		System.out.println("adminFreelistDelete()");
		String free_num = request.getParameter("free_num");

		System.out.println("free_num : " + free_num);

		sqlSession.delete("free_delete", free_num);
		sqlSession.delete("free_reply_deleteAll", free_num);

		return "redirect:adminFreelist";
	}

	@RequestMapping("/adminfreecontentview")
	// 자유게시판 자세히 보기
	public String content_view(HttpServletRequest request, Model model,
			FreeBoardDTO bDto) {
		System.out.println("adminfree_content_view()");

		String free_num = request.getParameter("free_num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("free_num", free_num);
		sqlSession.update("free_upHit", map);
		model.addAttribute("reply_view",
				sqlSession.selectList("free_reply_view", map));
		model.addAttribute("content_view",
				sqlSession.selectOne("free_content_view", map));

		return "admincontent_view";
	}

	@RequestMapping("/adminfreereplywrite")
	// 자유게시판 댓글 등록
	public String reply_write(HttpServletRequest request, Model model) {
		System.out.println("adminreply_write()");

		String re_freenum = request.getParameter("re_freenum");
		String re_content = request.getParameter("re_content");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("re_content", re_content);
		map.put("re_freenum", re_freenum);
		map.put("mem_id", request.getParameter("mem_id"));
		sqlSession.insert("free_reply_write", map);
		sqlSession.update("free_reply_write_num", map);

		model.addAttribute("free_num", re_freenum);

		return "redirect:adminfreecontentview";
	}

	@RequestMapping("/adminfreereplydelete")
	// 자유게시판 댓글 삭제
	public String reply_delete(HttpServletRequest request, Model model) {
		System.out.println("free_reply_delete()");

		String re_num = request.getParameter("re_num");
		String free_num = request.getParameter("free_num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("free_num", free_num);
		map.put("re_num", re_num);
		sqlSession.delete("free_reply_delete", map);
		sqlSession.delete("free_reply_delete_num", map);
		model.addAttribute("free_num", free_num);

		return "redirect:adminfreecontaentview";
	}

	@RequestMapping("/adminUserlist")
	// 게시판 리스트
	public String user_list(HttpServletRequest request, Model model) {
		System.out.println("adminuserlist()");

		/* 페이징 */
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageSize = 7;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) - 6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		count = sqlSession.selectOne("user_count");
		number = count - (currentPage - 1) * pageSize;

		/* 페이징끝 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("user_list", sqlSession.selectList("user_list", map));

		return "adminUserlist";
	}

	@RequestMapping("/adminusercontentview")
	// 게시글 상세보기
	public String content_view(HttpServletRequest request, Model model,
			UserBoardDTO bDto) {
		System.out.println("adminuser_content_view()");
		String user_num = request.getParameter("user_num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_num", user_num);
		sqlSession.update("user_upHit", map);
		model.addAttribute("reply_view",
				sqlSession.selectList("user_reply_view", map));
		model.addAttribute("content_view",
				sqlSession.selectOne("user_content_view", map));

		return "admin_user_content_view";
	}

	@RequestMapping("/adminuserdelete")
	// 게시글 삭제
	public String userdelete(HttpServletRequest request, Model model) {
		System.out.println("delete()");

		String user_num = request.getParameter("user_num");
		sqlSession.delete("user_delete", user_num);
		sqlSession.delete("user_reply_deleteAll", user_num);
		return "redirect:adminUserlist";
	}

	@RequestMapping("/adminuserreplywrite")
	// 댓글작성
	public String userreply_write(HttpServletRequest request, Model model) {
		System.out.println("admin_user_reply_write()");

		String re_usernum = request.getParameter("re_usernum");
		String re_content = request.getParameter("re_content");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("re_content", re_content);
		map.put("re_usernum", re_usernum);
		map.put("mem_id", request.getParameter("mem_id"));
		sqlSession.insert("user_reply_write", map);
		sqlSession.update("user_reply_write_num", map);

		model.addAttribute("user_num", re_usernum);
		return "redirect:adminusercontentview";
	}

	@RequestMapping("/adminuserreplydelete")
	// 댓글삭제
	public String userreply_delete(HttpServletRequest request, Model model) {
		System.out.println("adminuser_reply_delete()");

		String re_num = request.getParameter("re_num");
		String user_num = request.getParameter("user_num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_num", user_num);
		map.put("re_num", re_num);
		sqlSession.delete("user_reply_delete", map);
		sqlSession.delete("user_reply_delete_num", map);
		model.addAttribute("user_num", user_num);

		return "redirect:adminusercontentview";
	}

	@RequestMapping("/adminmatelist")
	// 게시판 리스트
	public String mate_list(HttpServletRequest request, Model model) {
		System.out.println("adminmatelist()");

		/* 페이징 */
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageSize = 7;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) - 6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		count = sqlSession.selectOne("mate_count");
		number = count - (currentPage - 1) * pageSize;
		System.out.println("mate_count다음");
		/* 페이징끝 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("mate_list", sqlSession.selectList("mate_list", map));
		return "adminMate_list";
	}

	@RequestMapping("/adminmatecontentview")
	// 게시글 상세보기
	public String content_view(HttpServletRequest request, Model model,
			MateBoardDTO bDto) {
		System.out.println("adminmate_content_view()");
		String mate_num = request.getParameter("mate_num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mate_num", mate_num);
		sqlSession.update("mate_upHit", map);
		model.addAttribute("reply_view",
				sqlSession.selectList("mate_reply_view", map));
		model.addAttribute("content_view",
				sqlSession.selectOne("mate_content_view", map));

		return "adminMate_content_view";
	}

	@RequestMapping("/adminmatedelete")
	// 게시글 삭제
	public String admindelete(HttpServletRequest request, Model model) {
		System.out.println("admindelete()");

		String mate_num = request.getParameter("mate_num");
		sqlSession.delete("mate_delete", mate_num);
		sqlSession.delete("mate_reply_deleteAll", mate_num);
		sqlSession.delete("mate_mem_deleteAll", mate_num);

		return "redirect:adminmatelist";
	}

	@RequestMapping("/adminmatereplywrite")
	// 댓글작성
	public String adminreply_write(HttpServletRequest request, Model model) {
		System.out.println("adminreply_write()");

		String re_matenum = request.getParameter("re_matenum");
		String re_content = request.getParameter("re_content");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("re_content", re_content);
		map.put("re_matenum", re_matenum);
		map.put("mem_id", request.getParameter("mem_id"));
		sqlSession.insert("mate_reply_write", map);
		sqlSession.update("mate_reply_write_num", map);

		model.addAttribute("mate_num", re_matenum);
		return "redirect:adminmatecontentview";
	}

	@RequestMapping("/adminmatereplydelete")
	// 댓글삭제
	public String adminreply_delete(HttpServletRequest request, Model model) {
		System.out.println("adminmate_reply_delete()");

		String re_num = request.getParameter("re_num");
		String mate_num = request.getParameter("mate_num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mate_num", mate_num);
		map.put("re_num", re_num);
		sqlSession.delete("mate_reply_delete", map);
		sqlSession.delete("mate_reply_delete_num", map);
		model.addAttribute("mate_num", mate_num);

		return "redirect:adminmatecontentview";
	}

	@RequestMapping("/adminmatesearchlist")
	// MATE게시판 검색 리스트
	public String mate_searchlist(HttpServletRequest request, Model model) {
		System.out.println("adminmatesearchlist()");

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageSize = 7;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) - 6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		String mate_title = request.getParameter("mate_title");
		String mem_id = request.getParameter("mem_id");
		String mate_content = request.getParameter("mate_content");
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		if (mate_title.length() > 0) {
			map2.put("mate_title", mate_title);
			count = sqlSession.selectOne("mate_title_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("mate_title", mate_title);
			model.addAttribute("mate_list",	sqlSession.selectList("mate_title_searchlist", map));
			System.out.println("title" + mate_title);
		}
		if (mate_content.length() > 0) {
			map2.put("mate_content", mate_content);
			count = sqlSession.selectOne("mate_content_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("mate_content", mate_content);
			model.addAttribute("mate_list",	sqlSession.selectList("mate_content_searchlist", map));
			System.out.println("content" + mate_content);
		}
		if (mem_id.length() > 0) {
			map2.put("mem_id", mem_id);
			count = sqlSession.selectOne("mate_mem_id_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("mem_id", mem_id);
			model.addAttribute("mate_list",	sqlSession.selectList("mate_mem_id_searchlist", map));
			System.out.println("id" + mem_id);
		}

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("mate_title", mate_title);

		return "adminMatesearchlist";
	}
	
	
	// 자유게시판 검색 리스트
	@RequestMapping("/adminFreeSearchlist")
	public String free_searchlist(HttpServletRequest request, Model model) {
		System.out.println("adminFreeSearchlist()");

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageSize = 7;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) - 6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		String free_title = request.getParameter("free_title");
		String mem_id = request.getParameter("mem_id");
		String free_content = request.getParameter("free_content");
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		if (free_title.length() > 0) {
			map2.put("free_title", free_title);
			count = sqlSession.selectOne("free_title_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("free_title", free_title);
			model.addAttribute("free_list",	sqlSession.selectList("free_title_searchlist", map));
			System.out.println("title" + free_title);
		}
		if (free_content.length() > 0) {
			map2.put("free_content", free_content);
			count = sqlSession.selectOne("free_content_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("free_content", free_content);
			model.addAttribute("free_list",	sqlSession.selectList("free_content_searchlist", map));
			System.out.println("content" + free_content);
		}
		if (mem_id.length() > 0) {
			map2.put("mem_id", mem_id);
			count = sqlSession.selectOne("free_mem_id_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("mem_id", mem_id);
			model.addAttribute("free_list",	sqlSession.selectList("free_mem_id_searchlist", map));
			System.out.println("id" + mem_id);
		}

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("free_title", free_title);


		return "adminFreeSearchlist";
	}
	@RequestMapping("/adminUserSearchlist")
	// 후기게시판 검색 리스트
	public String user_searchlist(HttpServletRequest request, Model model) {
		System.out.println("adminUserSearchlist()");

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageSize = 7;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) - 6;
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		String user_title = request.getParameter("user_title");
		String mem_id = request.getParameter("mem_id");
		String user_content = request.getParameter("user_content");
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		if (user_title.length() > 0) {
			map2.put("user_title", user_title);
			count = sqlSession.selectOne("user_title_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("user_title", user_title);
			model.addAttribute("user_list",	sqlSession.selectList("user_title_searchlist", map));
			System.out.println("title" + user_title);
		}
		if (user_content.length() > 0) {
			map2.put("user_content", user_content);
			count = sqlSession.selectOne("user_content_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("user_content", user_content);
			model.addAttribute("user_list",	sqlSession.selectList("user_content_searchlist", map));
			System.out.println("content" + user_content);
		}
		if (mem_id.length() > 0) {
			map2.put("mem_id", mem_id);
			count = sqlSession.selectOne("user_mem_id_searchcount", map2);
			number = count - (currentPage - 1) * pageSize;
			map.put("mem_id", mem_id);
			model.addAttribute("user_list",	sqlSession.selectList("user_mem_id_searchlist", map));
			System.out.println("id" + mem_id);
		}

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("user_title", user_title);


		return "adminUserSearchlist";
	}
}
