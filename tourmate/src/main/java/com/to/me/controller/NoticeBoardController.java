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

import com.to.me.dto.NoticeBoardDTO;
import com.to.me.dto.Re_NoticeBoardDTO;


@Controller
public class NoticeBoardController {
   
   @Autowired
   private SqlSession sqlSession;   

   @RequestMapping("/noticelist")   //게시판 리스트
   public String notice_list(HttpServletRequest request, Model model) {
      System.out.println("noticelist()");
      
      /*페이징*/
      String pageNum = request.getParameter("pageNum");  
      if(pageNum ==null) pageNum ="1";
      int pageSize = 7;
      int currentPage = Integer.parseInt(pageNum);
      int startRow = (currentPage * pageSize) -6;
      int endRow = currentPage * pageSize;
      int count = 0, number = 0;
      count = sqlSession.selectOne("notice_count");
      number = count - (currentPage -1) * pageSize;
   
      /*페이징끝*/
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("startRow", startRow);
      map.put("endRow", endRow);
      
      List<NoticeBoardDTO> notice_list = sqlSession.selectList("notice_list", map);
      for(int i=0; i<notice_list.size();i++){
    	  String mem_id=notice_list.get(i).getMem_id();
    	  notice_list.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
      }
      
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("startRow", startRow);
      model.addAttribute("endRow", endRow);
      model.addAttribute("pageSize", pageSize);
      model.addAttribute("number", number);
      model.addAttribute("count", count);
      model.addAttribute("notice_list", notice_list);
      return "noticelist";
   }
   
  @RequestMapping("/noticewriteview")   //게시글 작성 폼
   public String write_view(Model model) {
      System.out.println("write_view()");   
      
      return "noticewrite";
   }
   
   @RequestMapping("/noticewrite")   //게시글 작성
   public String write(HttpServletRequest request, Model model, NoticeBoardDTO bDto) {
      System.out.println("write()");
    
      bDto.setMem_id(request.getParameter("mem_id"));
      sqlSession.insert("notice_write", bDto);
      sqlSession.update("gradeUp10", request.getParameter("mem_id"));
      return "redirect:noticelist"; //controller를 redirect
   }
       
   @RequestMapping("/noticecontentview")   //게시글 상세보기
   public String content_view(HttpServletRequest request, Model model, NoticeBoardDTO bDto) {
      System.out.println("notice_content_view()");
      String notice_num = request.getParameter("notice_num");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("notice_num", notice_num);
      sqlSession.update("notice_upHit", map);
      
      List<Re_NoticeBoardDTO> notice_reply_view = sqlSession.selectList("notice_reply_view", map);
      for(int i=0; i<notice_reply_view.size();i++){
    	  String mem_id=notice_reply_view.get(i).getMem_id();
    	  notice_reply_view.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
      }
      
      model.addAttribute("reply_view", notice_reply_view);
      model.addAttribute("content_view", sqlSession.selectOne("notice_content_view", map));
      
      return "notice_content_view";
   }
   
   @RequestMapping("/noticedelete")   //게시글 삭제
   public String delete(HttpServletRequest request, Model model) {
      System.out.println("delete()");
      
      String notice_num = request.getParameter("notice_num");
      sqlSession.delete("notice_delete", notice_num);
      sqlSession.delete("notice_reply_deleteAll", notice_num);
      return "redirect:noticelist";
   }
   
   
   @RequestMapping("/noticemodifyview")   //게시글 수정 폼
   public String modify_view(HttpServletRequest request, Model model) {
      System.out.println("modify_view()");

      String notice_num = request.getParameter("notice_num");
      NoticeBoardDTO bDto = sqlSession.selectOne("notice_content_view", notice_num);
      
      model.addAttribute("content_view", bDto);
      
      return "notice_modify_view";
   }
   
   @RequestMapping("/noticemodify")   //게시글 수정완료
   public String modify(HttpServletRequest request, Model model) {
      System.out.println("modify()");
      
      String notice_num = request.getParameter("notice_num");
      String notice_title = request.getParameter("notice_title");
      String notice_content = request.getParameter("notice_content");
      
      Map<String, Object> map = new HashMap<String, Object>();
      
      map.put("notice_num", notice_num);
      map.put("notice_title", notice_title);
      map.put("notice_content", notice_content);
      
      sqlSession.update("notice_modify", map);
      
      return "redirect:noticelist";
   }
   
   
   
   
   @RequestMapping("/noticereplywrite")   //댓글작성
   public String reply_write(HttpServletRequest request, Model model) {
      System.out.println("reply_write()");
      
      String re_noticenum = request.getParameter("re_noticenum");
      String re_content = request.getParameter("re_content");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("re_content", re_content);
      map.put("re_noticenum", re_noticenum);
      map.put("mem_id", request.getParameter("mem_id"));
      sqlSession.insert("notice_reply_write", map);
      sqlSession.update("notice_reply_write_num", map);
      sqlSession.update("gradeUp2", request.getParameter("mem_id"));
      model.addAttribute("notice_num", re_noticenum);
      return "redirect:noticecontentview";
   }
   
   
   @RequestMapping("/noticereplydelete")   //댓글삭제
   public String reply_delete(HttpServletRequest request, Model model) {
      System.out.println("noticereplydelete()");
      
      String re_num = request.getParameter("re_num");
      String notice_num = request.getParameter("notice_num");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("notice_num", notice_num);
      map.put("re_num", re_num);
      sqlSession.delete("notice_reply_delete", map);
      sqlSession.delete("notice_reply_delete_num", map);
      model.addAttribute("notice_num", notice_num);
      
      return "redirect:noticecontentview";      
   }
   
   
   @RequestMapping("/noticesearchlist")   //게시판 검색 리스트
   public String notice_searchlist(HttpServletRequest request, Model model) {
	   System.out.println("noticesearchlist()");
	      
	      /*페이징*/
	      String pageNum = request.getParameter("pageNum");
	      if (pageNum == null)
	         pageNum = "1";
	      int pageSize = 7;
	      int currentPage = Integer.parseInt(pageNum);
	      int startRow = (currentPage * pageSize) - 6;
	      int endRow = currentPage * pageSize;
	      int count = 0, number = 0;
	      String notice_title = request.getParameter("notice_title");
	      String mem_id = request.getParameter("mem_id");
	      String notice_content = request.getParameter("notice_content");
	      
	      Map<String, Object> map2 = new HashMap<String, Object>();
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("startRow", startRow);
	      map.put("endRow", endRow);
	      
	      if (notice_title.length() > 0) {
	         map2.put("notice_title", notice_title);
	         count = sqlSession.selectOne("notice_title_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("notice_title", notice_title);
	         model.addAttribute("notice_list",   sqlSession.selectList("notice_title_searchlist", map));
	         System.out.println("title" + notice_title);
	      }
	      if (notice_content.length() > 0) {
	         map2.put("notice_content", notice_content);
	         count = sqlSession.selectOne("notice_content_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("notice_content", notice_content);
	         model.addAttribute("notice_list",   sqlSession.selectList("notice_content_searchlist", map));
	         System.out.println("content" + notice_content);
	      }
	      if (mem_id.length() > 0) {
	         map2.put("mem_id", mem_id);
	         count = sqlSession.selectOne("notice_mem_id_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("mem_id", mem_id);
	         model.addAttribute("notice_list",   sqlSession.selectList("notice_mem_id_searchlist", map));
	         System.out.println("id" + mem_id);
	      }

	      model.addAttribute("currentPage", currentPage);
	      model.addAttribute("startRow", startRow);
	      model.addAttribute("endRow", endRow);
	      model.addAttribute("pageSize", pageSize);
	      model.addAttribute("number", number);
	      model.addAttribute("count", count);
	      model.addAttribute("notice_title", notice_title);
	      return "noticesearchlist";
   }

}