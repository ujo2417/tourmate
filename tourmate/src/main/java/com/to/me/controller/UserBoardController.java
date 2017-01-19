package com.to.me.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.to.me.dto.Re_UserBoardDTO;
import com.to.me.dto.UserBoardDTO;


@Controller
public class UserBoardController {
   
   @Autowired
   private SqlSession sqlSession;   

   @RequestMapping("/userlist")   //게시판 리스트
   public String user_list(HttpServletRequest request, Model model) {
      System.out.println("userlist()");
      
      /*페이징*/
      String pageNum = request.getParameter("pageNum");  
      if(pageNum ==null) pageNum ="1";
      int pageSize = 8;
      int currentPage = Integer.parseInt(pageNum);
      int startRow = (currentPage * pageSize) -7;
      int endRow = currentPage * pageSize;
      int count = 0, number = 0;
      count = sqlSession.selectOne("user_count");
      number = count - (currentPage -1) * pageSize;
   
      /*페이징끝*/
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("startRow", startRow);
      map.put("endRow", endRow);
   
      List<UserBoardDTO> user_list = sqlSession.selectList("user_list", map);
      for(int i=0; i<user_list.size();i++){
    	  String mem_id=user_list.get(i).getMem_id();
    	  if(sqlSession.selectOne("selectGrade", mem_id)!=null){
    	  user_list.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
    	  } else{
        	  user_list.get(i).setMem_grade(-1);

    	  }
    	  //user_list.get(i).setMem_pic((String) sqlSession.selectOne("selectpic", mem_id));
    	  
    	  int pindex = 0;
    	  int[] arr = new int[10];
    	  int min = 10000;
    	  
    	  	arr[0] = user_list.get(i).getUser_content().indexOf(".jpg")+4;
	    	arr[1] = user_list.get(i).getUser_content().indexOf(".png")+4;
	    	arr[2] = user_list.get(i).getUser_content().indexOf(".bmp")+4;
	    	arr[3] = user_list.get(i).getUser_content().indexOf(".gif")+4;
	    	arr[4] = user_list.get(i).getUser_content().indexOf(".jpeg")+5;
	    	  arr[5] = user_list.get(i).getUser_content().indexOf(".JPG")+4;
	    	  arr[6] = user_list.get(i).getUser_content().indexOf(".PNG")+4;
	    	  arr[7] = user_list.get(i).getUser_content().indexOf(".BMP")+4;
	    	  arr[8] = user_list.get(i).getUser_content().indexOf(".GIF")+4;
	    	  arr[9] = user_list.get(i).getUser_content().indexOf(".JPEG")+5;
    	  for(int j=0;j<10;j++) {
    		  if(min > arr[j] && arr[j] > 10) {
    			  min = arr[j];
    			//  System.out.println("min = " + min);
    		  }
    	  }
    	  pindex = min;
    	  if(min != 10000) {
    		 user_list.get(i).setMem_pic(user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
    	 // System.out.println("result : " + user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
    	  }else {
    		 user_list.get(i).setMem_pic("/resources/corlate/images/noimage.jpg");
    	  }
      }
      
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("startRow", startRow);
      model.addAttribute("endRow", endRow);
      model.addAttribute("pageSize", pageSize);
      model.addAttribute("number", number);
      model.addAttribute("count", count);
      model.addAttribute("user_list", user_list);
      return "userlist";
   }
   
  @RequestMapping("/userwriteview")   //게시글 작성 폼
   public String write_view(Model model) {
      System.out.println("write_view()");   
      
      return "userwrite";
   }
   
   @RequestMapping("/userwrite")   //게시글 작성
   public String write(HttpServletRequest request, Model model, UserBoardDTO bDto) {
      System.out.println("write()");
    
      bDto.setMem_id(request.getParameter("mem_id"));
      sqlSession.insert("user_write", bDto);
      sqlSession.update("gradeUp20", request.getParameter("mem_id"));
      return "redirect:userlist";
   }
       
   @RequestMapping("/usercontentview")   //게시글 상세보기
   public String content_view(HttpServletRequest request, Model model, UserBoardDTO bDto) {
      System.out.println("user_content_view()");
      String user_num = request.getParameter("user_num");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("user_num", user_num);
      sqlSession.update("user_upHit", map);
      
      List<Re_UserBoardDTO> user_reply_view = sqlSession.selectList("user_reply_view", map);
      for(int i=0; i<user_reply_view.size();i++){
    	  String mem_id=user_reply_view.get(i).getMem_id();
    	  if(sqlSession.selectOne("selectGrade", mem_id)!=null){
    	  user_reply_view.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
    	  } else {
        	  user_reply_view.get(i).setMem_grade(-1);

    	  }
      }
     
      model.addAttribute("reply_view", user_reply_view);
      model.addAttribute("content_view", sqlSession.selectOne("user_content_view", map));
      
      return "user_content_view";
   }
   
   @RequestMapping("/userdelete")   //게시글 삭제
   public String delete(HttpServletRequest request, Model model) {
      System.out.println("delete()");
      
      String user_num = request.getParameter("user_num");
      sqlSession.delete("user_delete", user_num);
      sqlSession.delete("user_reply_deleteAll", user_num);
      return "redirect:userlist";
   }
   
   
   @RequestMapping("/usermodifyview")   //게시글 수정 폼
   public String modify_view(HttpServletRequest request, Model model) {
      System.out.println("modify_view()");

      String user_num = request.getParameter("user_num");
      UserBoardDTO bDto = sqlSession.selectOne("user_content_view", user_num);
      
      model.addAttribute("content_view", bDto);
      
      return "user_modify_view";
   }
   
   @RequestMapping("/usermodify")   //게시글 수정완료
   public String modify(HttpServletRequest request, Model model) {
      System.out.println("modify()");
      
      String user_num = request.getParameter("user_num");
      String user_title = request.getParameter("user_title");
      String user_content = request.getParameter("user_content");
      
      Map<String, Object> map = new HashMap<String, Object>();
      
      map.put("user_num", user_num);
      map.put("user_title", user_title);
      map.put("user_content", user_content);
      
      sqlSession.update("user_modify", map);
      
      return "redirect:userlist";
   }
   
   
   
   
   @RequestMapping("/userreplywrite")   //댓글작성
   public String reply_write(HttpServletRequest request, Model model) {
      System.out.println("reply_write()");
      
      String re_usernum = request.getParameter("re_usernum");
      String re_content = request.getParameter("re_content");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("re_content", re_content);
      map.put("re_usernum", re_usernum);
      map.put("mem_id", request.getParameter("mem_id"));
      sqlSession.insert("user_reply_write", map);
      sqlSession.update("user_reply_write_num", map);
      sqlSession.update("gradeUp2", request.getParameter("mem_id"));
      model.addAttribute("user_num", re_usernum);
      return "redirect:usercontentview";
   }
   
   
   @RequestMapping("/userreplydelete")   //댓글삭제
   public String reply_delete(HttpServletRequest request, Model model) {
      System.out.println("user_reply_delete()");
      
      String re_num = request.getParameter("re_num");
      String user_num = request.getParameter("user_num");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("user_num", user_num);
      map.put("re_num", re_num);
      sqlSession.delete("user_reply_delete", map);
      sqlSession.delete("user_reply_delete_num", map);
      model.addAttribute("user_num", user_num);
      
      return "redirect:usercontentview";      
   }
   
   @RequestMapping("/usersearchlist")   //게시판 검색 리스트
   public String user_searchlist(HttpServletRequest request, Model model) {
 
	   /*페이징*/
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
	      List<UserBoardDTO> user_list = null;///////
	      
	      if (user_title.length() > 0) {//제목으로 검색
	         map2.put("user_title", user_title);
	         count = sqlSession.selectOne("user_title_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("user_title", user_title);
	         user_list = sqlSession.selectList("user_title_searchlist", map);///////
	         
	         for(int i=0; i<user_list.size();i++){ // 텍스트 사진 꺼내기
	       	  String mem_id2=user_list.get(i).getMem_id();
	       	  user_list.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id2)));
	       	  
	       	  int pindex = 0;
	       	  int[] arr = new int[10];
	       	  int min = 10000;

	       	  arr[0] = user_list.get(i).getUser_content().indexOf(".jpg")+4;
	       	  arr[1] = user_list.get(i).getUser_content().indexOf(".png")+4;
	       	  arr[2] = user_list.get(i).getUser_content().indexOf(".bmp")+4;
	       	  arr[3] = user_list.get(i).getUser_content().indexOf(".gif")+4;
	       	  arr[4] = user_list.get(i).getUser_content().indexOf(".jpeg")+5;
	       	 arr[5] = user_list.get(i).getUser_content().indexOf(".JPG")+4;
	    	  arr[6] = user_list.get(i).getUser_content().indexOf(".PNG")+4;
	    	  arr[7] = user_list.get(i).getUser_content().indexOf(".BMP")+4;
	    	  arr[8] = user_list.get(i).getUser_content().indexOf(".GIF")+4;
	    	  arr[9] = user_list.get(i).getUser_content().indexOf(".JPEG")+5;
	       	  for(int j=0;j<10;j++) {
	       		  if(min > arr[j] && arr[j] > 10) {
	       			  min = arr[j];
	       			  System.out.println("min = " + min);
	       		  }
	       	  }
	       	  pindex = min;
	       	if(min != 10000) {
	       	  user_list.get(i).setMem_pic(user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
	       	 // System.out.println("result : " + user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
	       	}else {
	       		user_list.get(i).setMem_pic("/resources/corlate/images/noimage.jpg");
	       	}
	         } // for end
	         
	         model.addAttribute("user_list", user_list);///////
	         System.out.println("title" + user_title);
	      }
	      if (user_content.length() > 0) {
	         map2.put("user_content", user_content);
	         count = sqlSession.selectOne("user_content_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("user_content", user_content);
	         user_list = sqlSession.selectList("user_content_searchlist", map);///////
	         
	         for(int i=0; i<user_list.size();i++){ // 텍스트 사진 꺼내기
		       	  String mem_id2=user_list.get(i).getMem_id();
		       	  user_list.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id2)));
		       	  
		       	  int pindex = 0;
		       	  int[] arr = new int[10];
		       	  int min = 10000;

		       	  arr[0] = user_list.get(i).getUser_content().indexOf(".jpg")+4;
		       	  arr[1] = user_list.get(i).getUser_content().indexOf(".png")+4;
		       	  arr[2] = user_list.get(i).getUser_content().indexOf(".bmp")+4;
		       	  arr[3] = user_list.get(i).getUser_content().indexOf(".gif")+4;
		       	  arr[4] = user_list.get(i).getUser_content().indexOf(".jpeg")+5;
		       	  arr[5] = user_list.get(i).getUser_content().indexOf(".JPG")+4;
		    	  arr[6] = user_list.get(i).getUser_content().indexOf(".PNG")+4;
		    	  arr[7] = user_list.get(i).getUser_content().indexOf(".BMP")+4;
		    	  arr[8] = user_list.get(i).getUser_content().indexOf(".GIF")+4;
		    	  arr[9] = user_list.get(i).getUser_content().indexOf(".JPEG")+5;
		       	  for(int j=0;j<10;j++) {
		       		  if(min > arr[j] && arr[j] > 10) {
		       			  min = arr[j];
		       			  System.out.println("min = " + min);
		       		  }
		       	  }
		       	  pindex = min;
		       	if(min != 10000) {
		       	  user_list.get(i).setMem_pic(user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
		       	//  System.out.println("result : " + user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
		       	} else {
		       		user_list.get(i).setMem_pic("/resources/corlate/images/noimage.jpg");
		       	}
		       	} // for end
	         
	         model.addAttribute("user_list", user_list);
	         System.out.println("content" + user_content);
	      }
	      if (mem_id.length() > 0) { //작성자로 검색
	         map2.put("mem_id", mem_id);
	         count = sqlSession.selectOne("user_mem_id_searchcount", map2);
	         number = count - (currentPage - 1) * pageSize;
	         map.put("mem_id", mem_id);
	         user_list = sqlSession.selectList("user_mem_id_searchlist", map);///////
	         
	         for(int i=0; i<user_list.size();i++){ // 텍스트 사진 꺼내기
		       	  String mem_id2=user_list.get(i).getMem_id();
		       	  user_list.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id2)));
		       	  
		       	  int pindex = 0;
		       	  int[] arr = new int[10];
		       	  int min = 10000;
		       	  arr[0] = user_list.get(i).getUser_content().indexOf(".jpg")+4;
		       	  arr[1] = user_list.get(i).getUser_content().indexOf(".png")+4;
		       	  arr[2] = user_list.get(i).getUser_content().indexOf(".bmp")+4;
		       	  arr[3] = user_list.get(i).getUser_content().indexOf(".gif")+4;
		       	  arr[4] = user_list.get(i).getUser_content().indexOf(".jpeg")+5;
		       	 arr[5] = user_list.get(i).getUser_content().indexOf(".JPG")+4;
		    	  arr[6] = user_list.get(i).getUser_content().indexOf(".PNG")+4;
		    	  arr[7] = user_list.get(i).getUser_content().indexOf(".BMP")+4;
		    	  arr[8] = user_list.get(i).getUser_content().indexOf(".GIF")+4;
		    	  arr[9] = user_list.get(i).getUser_content().indexOf(".JPEG")+5;
		       	  for(int j=0;j<10;j++) {
		       		  if(min > arr[j] && arr[j] > 10) {
		       			  min = arr[j];
		       			  System.out.println("min = " + min);
		       		  }
		       	  }
		       	  pindex = min;
		       	if(min != 10000) {
		       	  user_list.get(i).setMem_pic(user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
		       	//  System.out.println("result : " + user_list.get(i).getUser_content().substring(user_list.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
		       	} else {
		       		user_list.get(i).setMem_pic("/resources/corlate/images/noimage.jpg");
		       	}
		       	} // for end
	         
	         model.addAttribute("user_list", user_list);
	         System.out.println("id" + mem_id);
	      }

	      model.addAttribute("currentPage", currentPage);
	      model.addAttribute("startRow", startRow);
	      model.addAttribute("endRow", endRow);
	      model.addAttribute("pageSize", pageSize);
	      model.addAttribute("number", number);
	      model.addAttribute("count", count);
	      model.addAttribute("user_title", user_title);
      return "usersearchlist";
   }
 
   @RequestMapping("/usergood")
   public String usergood(HttpServletRequest request, HttpServletResponse response , HttpSession session ,Model model) throws IOException{
	   System.out.println("usergood()");
	   String user_num = request.getParameter("user_num");
	   response.setContentType("text/html;charset=UTF-8");
	   String mem_id = (String) session.getAttribute("mem_id");
	   Map<String, Object> map = new HashMap<String, Object>();
	   map.put("user_num", user_num);
	   map.put("mem_id", mem_id);
	   JSONObject obj = new JSONObject();
		JSONArray ja = new JSONArray();
	   if(sqlSession.selectOne("usergoodconfirm", map)!=null){
		   ja.add("이미 추천되었습니다");
		   return "usergood_fail";
	   } else {
		   sqlSession.insert("usergood", map);
		   sqlSession.update("usergoodup", map);
		   ja.add("추천되었습니다");
	   }
	   PrintWriter out = response.getWriter();
		out.print(ja.toString());
		return "usergood_success";
   }

}