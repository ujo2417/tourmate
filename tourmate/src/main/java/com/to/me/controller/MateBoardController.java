package com.to.me.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.me.dto.MateBoardDTO;
import com.to.me.dto.MateMemberDTO;
import com.to.me.dto.MemberDTO;
import com.to.me.dto.Re_MateBoardDTO;

@Controller
public class MateBoardController {
	@Autowired
	   private SqlSession sqlSession;   

	   @RequestMapping("/matelist")   //게시판 리스트
	   public String mate_list(HttpServletRequest request, Model model, HttpSession session) {
	      System.out.println("matelist()");
	      
	      /*페이징*/
	      String pageNum = request.getParameter("pageNum");  
	      if(pageNum ==null) pageNum ="1";
	      int pageSize = 6;
	      int currentPage = Integer.parseInt(pageNum);
	      int startRow = (currentPage * pageSize) -6;
	      int endRow = currentPage * pageSize;
	      int count = 0, number = 0;
	      count = sqlSession.selectOne("mate_count");
	      number = count - (currentPage -1) * pageSize;
	      System.out.println("mate_count다음");
	      /*페이징끝*/
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("startRow", startRow);
	      map.put("endRow", endRow);
	   
	      List<MateBoardDTO> mate_list = sqlSession.selectList("mate_list", map);
	      for(int i=0; i<mate_list.size();i++){
	    	  String mem_id=mate_list.get(i).getMem_id();
	    	  if(sqlSession.selectOne("selectGrade", mem_id)!=null){
	    	  mate_list.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
	    	  } else{
		    	  mate_list.get(i).setMem_grade(-1);

	    	  }
	      }
	      
	      model.addAttribute("currentPage", currentPage);
	      model.addAttribute("startRow", startRow);
	      model.addAttribute("endRow", endRow);
	      model.addAttribute("pageSize", pageSize);
	      model.addAttribute("number", number);
	      model.addAttribute("count", count);
	      model.addAttribute("mate_list", mate_list);
	      return "matelist";
	   }
	   
	   @RequestMapping("/matewriteview")   //게시글 작성 폼
	   public String write_view(Model model) {
	      System.out.println("write_view()");   
	      
	      GregorianCalendar gc = new GregorianCalendar();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	      Date d = gc.getTime();
	      String str = sdf.format(d);
	      str = str.substring(0,4) + "-" + str.substring(4,6) + "-" + str.substring(6, 8);
	      
	      System.out.println(str);
	      model.addAttribute("str", str);
	      
	      return "mate_write_view";
	   }
	   
	   @RequestMapping("/matewrite")   //게시글 작성
	   public String write(HttpServletRequest request, Model model, MateBoardDTO bDto) {
	      System.out.println("write()");
	      String mem_id=request.getParameter("mem_id");
	      String mate_num=Integer.toString(bDto.getMate_num());
	      bDto.setMem_id(request.getParameter("mem_id"));
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("mem_id", mem_id);
	      map.put("mate_num", mate_num);
	      sqlSession.insert("matewriteadd", map);
	      sqlSession.insert("mate_write", bDto);
	      sqlSession.update("gradeUp10", request.getParameter("mem_id"));
	      return "redirect:matelist";
	   }
	   
	   @RequestMapping("/matecontentview")   //게시글 상세보기
	   public String content_view(HttpServletRequest request, Model model, HttpSession session) {
	      System.out.println("mate_content_view()");
	      String mate_num = request.getParameter("mate_num");
	      String mem_id = request.getParameter("mem_id");
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("mate_num", mate_num);
	      map.put("mem_id", mem_id);
	      
	      GregorianCalendar gc = new GregorianCalendar();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	      Date d = gc.getTime();
	      String str = sdf.format(d);
	      str = str.substring(0,4) + "-" + str.substring(4,6) + "-" + str.substring(6, 8);
	      
	      sqlSession.update("mate_upHit", map);
	      
	      List<Re_MateBoardDTO> mate_reply_view = sqlSession.selectList("mate_reply_view", map);
	      for(int i=0; i<mate_reply_view.size();i++){
	    	  mem_id=mate_reply_view.get(i).getMem_id();
	    	  if(sqlSession.selectOne("selectGrade", mem_id)!=null){
	    		  mate_reply_view.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
	    	  } else {
		    	  mate_reply_view.get(i).setMem_grade(-1);

	    	  }
	      }
	      
	      if(session.getAttribute("mem_id") != null) {
	    	  map.put("session_id", session.getAttribute("mem_id"));
		      if(((String)session.getAttribute("mem_id")).equals(sqlSession.selectOne("selectMateMember", map))) {
		    	  model.addAttribute("value", 1);
		      } else {
		    	  model.addAttribute("value", 0);
		      }
	      }
	      
	      model.addAttribute("str", str);
	      model.addAttribute("mem_id", mem_id);
	      model.addAttribute("matemem", sqlSession.selectList("mateconfirm", map));
	      model.addAttribute("reply_view", mate_reply_view);
	      model.addAttribute("content_view", sqlSession.selectOne("mate_content_view", map));
	      
	      return "mate_content_view";
	   }
	   
	   @RequestMapping("/matemodifyview")   //게시글 수정 폼
	   public String modify_view(HttpServletRequest request, Model model) {
	      System.out.println("modify_view()");
	      
	      GregorianCalendar gc = new GregorianCalendar();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	      Date d = gc.getTime();
	      String str = sdf.format(d);
	      str = str.substring(0,4) + "-" + str.substring(4,6) + "-" + str.substring(6, 8);

	      String mate_num = request.getParameter("mate_num");
	      MateBoardDTO bDto = sqlSession.selectOne("mate_content_view", mate_num);
	      
	      model.addAttribute("content_view", bDto);
	      model.addAttribute("str", str);
	      
	      return "mate_modify_view";
	   }
	   
	   @RequestMapping("/matemodify")   //게시글 수정완료
	   public String modify(HttpServletRequest request, Model model) {
	      System.out.println("modify()");
	      
	      String mate_num = request.getParameter("mate_num");
	      String mate_title = request.getParameter("mate_title");
	      String mate_content = request.getParameter("mate_content");
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("mate_date1",  request.getParameter("mate_date1"));
	      map.put("mate_date2",  request.getParameter("mate_date2"));
	      map.put("mate_num", mate_num);
	      map.put("mate_title", mate_title);
	      map.put("mate_content", mate_content);
	      
	      sqlSession.update("mate_modify", map);
	      
	      return "redirect:matelist";
	   }
	   
	   @RequestMapping("/matedelete")   //게시글 삭제
	   public String delete(HttpServletRequest request, Model model) {
	      System.out.println("delete()");
	      
	      String mate_num = request.getParameter("mate_num");
	      sqlSession.delete("mate_delete", mate_num);
	      sqlSession.delete("mate_reply_deleteAll", mate_num);
	      sqlSession.delete("mate_mem_deleteAll", mate_num);
	      return "redirect:matelist";
	   }
	   
	   @RequestMapping("/matereplywrite")   //댓글작성
	   public String reply_write(HttpServletRequest request, Model model) {
	      System.out.println("reply_write()");
	      
	      String re_matenum = request.getParameter("re_matenum");
	      String re_content = request.getParameter("re_content");
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("re_content", re_content);
	      map.put("re_matenum", re_matenum);
	      map.put("mem_id", request.getParameter("mem_id"));
	      sqlSession.insert("mate_reply_write", map);
	      sqlSession.update("mate_reply_write_num", map);
	      sqlSession.update("gradeUp2", request.getParameter("mem_id"));
	      model.addAttribute("mate_num", re_matenum);
	      return "redirect:matecontentview";
	   }
	   
	   
	   @RequestMapping("/matereplydelete")   //댓글삭제
	   public String reply_delete(HttpServletRequest request, Model model) {
	      System.out.println("mate_reply_delete()");
	      
	      String re_num = request.getParameter("re_num");
	      String mate_num = request.getParameter("mate_num");
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("mate_num", mate_num);
	      map.put("re_num", re_num);
	      sqlSession.delete("mate_reply_delete", map);
	      sqlSession.delete("mate_reply_delete_num", map);
	      model.addAttribute("mate_num", mate_num);
	      
	      return "redirect:matecontentview";      
	   }
	   
	   @RequestMapping("/mateapp")  // 메이트멤버 신청 확인
	   public String mateapp(HttpServletRequest request, HttpServletResponse response , HttpSession session ,Model model) throws IOException{
		   System.out.println("mateapp()");
		   String mate_num = request.getParameter("mate_num");
		  // request.setCharacterEncoding("UTF-8");
		   response.setContentType("text/html;charset=UTF-8");
		   //String mem_id = request.getParameter("mem_id"); // 작성자 id
		   String mem_id = (String) session.getAttribute("mem_id");
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("mate_num", mate_num);
		   map.put("mem_id", mem_id);
		   JSONObject obj = new JSONObject();
			JSONArray ja = new JSONArray();	
			System.out.println(mem_id);
			System.out.println(map.toString());
		   if(sqlSession.selectOne("mateconfirm2", map)!=null){
			   ja.add("이미 신청하였거나 가입된 글입니다");
			   return "mate_appfail";
		   } else {
			   sqlSession.insert("mateadd", map);
			   ja.add("신청 성공하였습니다");
		   }
		   PrintWriter out = response.getWriter();
			out.print(ja.toString());
		   
		  return "mate_appsuccess";
	   }
	   
	   @RequestMapping("/matemem")  // 메이트 멤버 목록
	   public String matemem(HttpServletRequest request, Model model){
		   System.out.println("matemem()");
		   String mate_num = request.getParameter("mate_num");
		   String mem_id = request.getParameter("mem_id");
		   String session_id = request.getParameter("session_id");
		   int flag = 0;
		   List<MateMemberDTO> list = sqlSession.selectList("matemem", mate_num);
		   System.out.println("sessionid = "+session_id);
		   
		   for(int i = 0; i < list.size(); i++) {
	            if(!(list.get(i).getMem_id()).equals(session_id)){
	            	flag=1;
	            	System.out.println("flag 1 , "+list.get(i).getMem_id());
	            } else {
	            	flag=0;
	            	System.out.println("flag 0");
	            	break;
	            }
	        }
		   model.addAttribute("matemem", sqlSession.selectList("matemem", mate_num));
		   model.addAttribute("flag", flag);
		   model.addAttribute("mem_id", mem_id);
		   model.addAttribute("mate_num", mate_num);
		   return "mate_mem";
	   }
	   
	   @RequestMapping("/mateapplist")  // 메이트멤버 신청 목록
	   public String mateapplist(HttpServletRequest request, Model model){
		   System.out.println("mateapplist()");
		   String mate_num = request.getParameter("mate_num");
		  
		   model.addAttribute("mateapplist", sqlSession.selectList("mateapplist", mate_num));
		   model.addAttribute("mate_num", mate_num);
		   return "mate_applist";
	   }
	   
	   @RequestMapping("/mateappOk")  // 메이트멤버 신청 수락
	   public String mateappOk(HttpServletRequest request, Model model, HttpSession session){
		   System.out.println("mateappOk()");
		   String mate_num = request.getParameter("mate_num");
		   String mem_id = request.getParameter("mem_id");
		   String writer_id = (String) session.getAttribute("mem_id");
		   int flag;
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("mate_num", mate_num);
		   map.put("mem_id", mem_id);
		   map.put("writer_id", writer_id);
		   map.put("title", mate_num+"번 메이트글에서 수락하였습니다.");
		   map.put("content", mate_num+"번 메이트글에서 수락하였습니다.");
		   MateBoardDTO dto = sqlSession.selectOne("mateSelect", map);
		   
		   if(dto.getMate_present()<dto.getMate_max()){
			   sqlSession.update("mateappOk", map);
			   sqlSession.update("matecountUp", map);
			   sqlSession.insert("memoSendsorry", map);
			   flag=0;
			   model.addAttribute("flag",flag);
		   } else {
			   flag = 1;
			   model.addAttribute("flag",flag);
		   }
		   model.addAttribute("mate_num", mate_num);
		   model.addAttribute("mateapplist", sqlSession.selectList("mateapplist", mate_num));
		   return "mate_applist";
	   }
	   
	   @RequestMapping("/mateappNo")  // 메이트멤버 신청 거절
	   public String mateappNo(HttpServletRequest request, Model model, HttpSession session){
		   System.out.println("mateappNo()");
		   String mate_num = request.getParameter("mate_num");
		   String mem_id = request.getParameter("mem_id");
		   String writer_id = (String) session.getAttribute("mem_id");
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("mate_num", mate_num);
		   map.put("mem_id", mem_id);
		   map.put("writer_id", writer_id);
		   map.put("title", mate_num+"번 메이트글에서 거절당하셨습니다.");
		   map.put("content", mate_num+"번 메이트글에서 거절당하셨습니다.");
		   sqlSession.insert("memoSendsorry", map);
		   sqlSession.delete("mateappNo", map);
		   model.addAttribute("mate_num", mate_num);
		   
		   return "redirect:mateapplist";
	   }
	   
	   @RequestMapping("/matedrop") // 메이트 탈퇴
	   public String matedrop(HttpServletRequest request, Model model){
		   System.out.println("matedrop()");
		   String mate_num = request.getParameter("mate_num");
		   String mem_id = request.getParameter("mem_id");
		   String writer_id= request.getParameter("writer_id");
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("mate_num", mate_num);
		   map.put("mem_id", mem_id);
		   sqlSession.delete("mateappNo", map);
		   sqlSession.update("matecountDown", map);
		   model.addAttribute("mem_id", writer_id);
		   model.addAttribute("mate_num", mate_num);
		   
		   return "redirect:matelist";
	   }
	   
	   @RequestMapping("/mateexile") // 메이트 추방
	   public String mateexile(HttpServletRequest request, Model model){
		   System.out.println("mateexile()");
		   String mate_num = request.getParameter("mate_num");
		   String mem_id = request.getParameter("mem_id");
		   String writer_id= request.getParameter("writer_id");
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("mate_num", mate_num);
		   map.put("mem_id", mem_id);
		   map.put("writer_id", writer_id);
		   map.put("title", mate_num+"번 메이트글에서 추방당하셨습니다.");
		   map.put("content", mate_num+"번 메이트글에서 추방당하셨습니다.");
		   sqlSession.insert("memoSendsorry", map);
		   sqlSession.delete("mateappNo", map);
		   sqlSession.update("matecountDown", map);
		   model.addAttribute("mem_id", writer_id);
		   model.addAttribute("mate_num", mate_num);
		   
		   return "redirect:matecontentview";
	   }
	   
	   @RequestMapping("/matesearchlist")   //게시판 검색 리스트
	   public String mate_searchlist(HttpServletRequest request, Model model) {
	      System.out.println("matesearchlist()");
	      
	      /*페이징*/
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
	         model.addAttribute("mate_list",   sqlSession.selectList("mate_title_searchlist", map));
	         System.out.println("title" + mate_title);
	      }
	      if (mate_content.length() > 0) {
	         map2.put("mate_content", mate_content);
	         count = sqlSession.selectOne("mate_content_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("mate_content", mate_content);
	         model.addAttribute("mate_list",   sqlSession.selectList("mate_content_searchlist", map));
	         System.out.println("content" + mate_content);
	      }
	      if (mem_id.length() > 0) {
	         map2.put("mem_id", mem_id);
	         count = sqlSession.selectOne("mate_mem_id_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("mem_id", mem_id);
	         model.addAttribute("mate_list",   sqlSession.selectList("mate_mem_id_searchlist", map));
	         System.out.println("id" + mem_id);
	      }

	      model.addAttribute("currentPage", currentPage);
	      model.addAttribute("startRow", startRow);
	      model.addAttribute("endRow", endRow);
	      model.addAttribute("pageSize", pageSize);
	      model.addAttribute("number", number);
	      model.addAttribute("count", count);
	      model.addAttribute("mate_title", mate_title);
	      return "matesearchlist";
	   }
	   
	   @RequestMapping("/mateinfo")
	   public String mateinfo(HttpServletRequest request, Model model){
		   System.out.println("mateinfo()");
		   String mem_id = request.getParameter("mem_id");
		 
		   MemberDTO dto = sqlSession.selectOne("mateinfo", mem_id);
		   
		   model.addAttribute("mateinfo", dto);
		   return "mate_info";
	   }
}
