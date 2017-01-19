package com.to.me.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.me.dto.FreeBoardDTO;
import com.to.me.dto.Re_FreeBoardDTO;


@Controller
public class FreeBoardController {
   
   @Autowired
   private SqlSession sqlSession;   

   @RequestMapping("/freelist")   //게시판 리스트
   public String free_list(HttpServletRequest request, Model model) {
      System.out.println("freelist()");
      
      /*페이징*/
      String pageNum = request.getParameter("pageNum");  
      if(pageNum ==null) pageNum ="1";
      int pageSize = 7;
      int currentPage = Integer.parseInt(pageNum);
      int startRow = (currentPage * pageSize) -6;
      int endRow = currentPage * pageSize;
      int count = 0, number = 0;
      count = sqlSession.selectOne("free_count");
      number = count - (currentPage -1) * pageSize;
   
      /*페이징끝*/
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("startRow", startRow);
      map.put("endRow", endRow);
      
      List<FreeBoardDTO> free_list = sqlSession.selectList("free_list", map);
      for(int i=0; i<free_list.size();i++){
    	  String mem_id=free_list.get(i).getMem_id();
    	  if(sqlSession.selectOne("selectGrade", mem_id)!=null){
    	  free_list.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
    	  } else {
    		  free_list.get(i).setMem_grade(-1);
    	  }
      }
      
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("startRow", startRow);
      model.addAttribute("endRow", endRow);
      model.addAttribute("pageSize", pageSize);
      model.addAttribute("number", number);
      model.addAttribute("count", count);
      model.addAttribute("free_list", free_list);
      return "freelist";
   }
   
  @RequestMapping("/freewriteview")   //게시글 작성 폼
   public String write_view(Model model) {
      System.out.println("write_view()");   
      
      return "freewrite";
   }
   
   @RequestMapping("/freewrite")   //게시글 작성
   public String write(HttpServletRequest request, Model model, FreeBoardDTO bDto) {
      System.out.println("write()");
    
      bDto.setMem_id(request.getParameter("mem_id"));
      sqlSession.insert("free_write", bDto);
      sqlSession.update("gradeUp10", request.getParameter("mem_id"));
      return "redirect:freelist"; //controller를 redirect
   }
       
   @RequestMapping("/freecontentview")   //게시글 상세보기
   public String content_view(HttpServletRequest request, Model model, FreeBoardDTO bDto) {
      System.out.println("free_content_view()");
      String free_num = request.getParameter("free_num");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("free_num", free_num);
      sqlSession.update("free_upHit", map);
      
      List<Re_FreeBoardDTO> free_reply_view = sqlSession.selectList("free_reply_view", map);
      for(int i=0; i<free_reply_view.size();i++){
    	  String mem_id=free_reply_view.get(i).getMem_id();
    	  if(sqlSession.selectOne("selectGrade", mem_id)!=null){
    	  free_reply_view.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
    	  } else {
        	  free_reply_view.get(i).setMem_grade(-1);
    	  }
      }
      
      model.addAttribute("reply_view", free_reply_view);
      model.addAttribute("content_view", sqlSession.selectOne("free_content_view", map));
      
      return "free_content_view";
   }
   
   @RequestMapping("/freedelete")   //게시글 삭제
   public String delete(HttpServletRequest request, Model model) {
      System.out.println("delete()");
      
      String free_num = request.getParameter("free_num");
      sqlSession.delete("free_delete", free_num);
      sqlSession.delete("free_reply_deleteAll", free_num);
      return "redirect:freelist";
   }
   
   
   @RequestMapping("/freemodifyview")   //게시글 수정 폼
   public String modify_view(HttpServletRequest request, Model model) {
      System.out.println("modify_view()");

      String free_num = request.getParameter("free_num");
      FreeBoardDTO bDto = sqlSession.selectOne("free_content_view", free_num);
      
      model.addAttribute("content_view", bDto);
      
      return "free_modify_view";
   }
   
   @RequestMapping("/freemodify")   //게시글 수정완료
   public String modify(HttpServletRequest request, Model model) {
      System.out.println("modify()");
      
      String free_num = request.getParameter("free_num");
      String free_title = request.getParameter("free_title");
      String free_content = request.getParameter("free_content");
      
      Map<String, Object> map = new HashMap<String, Object>();
      
      map.put("free_num", free_num);
      map.put("free_title", free_title);
      map.put("free_content", free_content);
      
      sqlSession.update("free_modify", map);
      
      return "redirect:freelist";
   }
   
   
   
   
   @RequestMapping("/freereplywrite")   //댓글작성
   public String reply_write(HttpServletRequest request, Model model) {
      System.out.println("reply_write()");
      
      String re_freenum = request.getParameter("re_freenum");
      String re_content = request.getParameter("re_content");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("re_content", re_content);
      map.put("re_freenum", re_freenum);
      map.put("mem_id", request.getParameter("mem_id"));
      sqlSession.insert("free_reply_write", map);
      sqlSession.update("free_reply_write_num", map);
      sqlSession.update("gradeUp2", request.getParameter("mem_id"));
      model.addAttribute("free_num", re_freenum);
      return "redirect:freecontentview";
   }
   
   
   @RequestMapping("/freereplydelete")   //댓글삭제
   public String reply_delete(HttpServletRequest request, Model model) {
      System.out.println("freereplydelete()");
      
      String re_num = request.getParameter("re_num");
      String free_num = request.getParameter("free_num");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("free_num", free_num);
      map.put("re_num", re_num);
      sqlSession.delete("free_reply_delete", map);
      sqlSession.delete("free_reply_delete_num", map);
      model.addAttribute("free_num", free_num);
      
      return "redirect:freecontentview";      
   }
   
   
   @RequestMapping("/freesearchlist")   //게시판 검색 리스트
   public String free_searchlist(HttpServletRequest request, Model model) {
	   System.out.println("freesearchlist()");
	      
	      /*페이징*/
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
	         model.addAttribute("free_list",   sqlSession.selectList("free_title_searchlist", map));
	         System.out.println("title" + free_title);
	      }
	      if (free_content.length() > 0) {
	         map2.put("free_content", free_content);
	         count = sqlSession.selectOne("free_content_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("free_content", free_content);
	         model.addAttribute("free_list",   sqlSession.selectList("free_content_searchlist", map));
	         System.out.println("content" + free_content);
	      }
	      if (mem_id.length() > 0) {
	         map2.put("mem_id", mem_id);
	         count = sqlSession.selectOne("free_mem_id_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("mem_id", mem_id);
	         model.addAttribute("free_list",   sqlSession.selectList("free_mem_id_searchlist", map));
	         System.out.println("id" + mem_id);
	      }

	      model.addAttribute("currentPage", currentPage);
	      model.addAttribute("startRow", startRow);
	      model.addAttribute("endRow", endRow);
	      model.addAttribute("pageSize", pageSize);
	      model.addAttribute("number", number);
	      model.addAttribute("count", count);
	      model.addAttribute("free_title", free_title);
	      return "freesearchlist";
   }

}