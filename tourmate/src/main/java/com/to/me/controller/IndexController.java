package com.to.me.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.me.dto.InvestigationDTO;
import com.to.me.dto.UserBoardDTO;

@Controller
public class IndexController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/index")
	public String process(Model model, HttpSession session) {
		System.out.println("process()");
		
		
		InvestigationDTO Investigation_list = sqlSession.selectOne("investigationResult");
		int total = Investigation_list.getCol1() + Investigation_list.getCol2() + Investigation_list.getCol3() + Investigation_list.getCol4();
		String format = "#.#";
		java.text.DecimalFormat df = new java.text.DecimalFormat(format);
		String col1rate, col2rate, col3rate,col4rate;
		if(Investigation_list.getCol1()==0){
			col1rate = "0";
		} else{
			float col1 = ((float)Investigation_list.getCol1() /(float) total) * 100;
			col1rate = df.format(col1);
		}
		if(Investigation_list.getCol2()==0){
			col2rate = "0";
		} else{
			float col2 = ((float)Investigation_list.getCol2() /(float) total) * 100;
			col2rate = df.format(col2);
		}
		if(Investigation_list.getCol3()==0){
			col3rate = "0";
		} else{
			float col3 = ((float)Investigation_list.getCol3() /(float) total) * 100;
			col3rate = df.format(col3);
		}
		if(Investigation_list.getCol4()==0){
			col4rate = "0";
		} else{
			float col4 = ((float)Investigation_list.getCol4() /(float) total) * 100;
			col4rate = df.format(col4);
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("col1rate", col1rate);
		map.put("col2rate", col2rate);
		map.put("col3rate", col3rate);
		map.put("col4rate", col4rate);
		
		
		
		 List<UserBoardDTO> user_list_main = sqlSession.selectList("user_list_main");
	      for(int i=0; i<user_list_main.size();i++){
	    	  String mem_id=user_list_main.get(i).getMem_id();
	    	  if(sqlSession.selectOne("selectGrade", mem_id)!=null){
	    		  user_list_main.get(i).setMem_grade(Integer.parseInt((String) sqlSession.selectOne("selectGrade", mem_id)));
	        	  } else{
	        		  user_list_main.get(i).setMem_grade(-1);
	        	  }
	    	  //user_list_main.get(i).setMem_pic((String) sqlSession.selectOne("selectpic", mem_id));
	    	  
	    	  int pindex = 0;
	    	  int[] arr = new int[10];
	    	  int min = 10000;
	    	  arr[0] = user_list_main.get(i).getUser_content().indexOf(".jpg")+4;
	    	  arr[1] = user_list_main.get(i).getUser_content().indexOf(".png")+4;
	    	  arr[2] = user_list_main.get(i).getUser_content().indexOf(".bmp")+4;
	    	  arr[3] = user_list_main.get(i).getUser_content().indexOf(".gif")+4;
	    	  arr[4] = user_list_main.get(i).getUser_content().indexOf(".jpeg")+5;
	    	  arr[5] = user_list_main.get(i).getUser_content().indexOf(".JPG")+4;
	    	  arr[6] = user_list_main.get(i).getUser_content().indexOf(".PNG")+4;
	    	  arr[7] = user_list_main.get(i).getUser_content().indexOf(".BMP")+4;
	    	  arr[8] = user_list_main.get(i).getUser_content().indexOf(".GIF")+4;
	    	  arr[9] = user_list_main.get(i).getUser_content().indexOf(".JPEG")+5;
	    	 	    	  
	    	  for(int j=0;j<10;j++) {
	    		  if(min > arr[j] && arr[j] > 10) {
	    			  min = arr[j];
	    			  System.out.println("min = " + min);
	    		  }
	    	  }
	    	  pindex = min;
	    	  	if(min != 10000) {
		    	  user_list_main.get(i).setMem_pic(user_list_main.get(i).getUser_content().substring(user_list_main.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
		    	  System.out.println("result : " + user_list_main.get(i).getUser_content().substring(user_list_main.get(i).getUser_content().indexOf("/resources/editor/multiupload/"), pindex));
		     		}else {
		    		  user_list_main.get(i).setMem_pic("/resources/corlate/images/noimage.jpg");
		    	  } //if end
	     }//for end
		
	    if(session.getAttribute("mem_id") != null) {
	    	System.out.println((String)session.getAttribute("mem_id"));
	    	
	    	model.addAttribute("investigationConfirm",  sqlSession.selectOne("investigationConfirm", (String)session.getAttribute("mem_id")));
	    } else {
	    	model.addAttribute("investigationConfirm", null);
	    }
	    model.addAttribute("investigationResult", map);
		model.addAttribute("notice_main1", sqlSession.selectOne("notice_main1"));
		model.addAttribute("notice_main2", sqlSession.selectOne("notice_main2"));
		model.addAttribute("notice_main3", sqlSession.selectOne("notice_main3"));
		model.addAttribute("mate_list", sqlSession.selectList("mate_list_main"));
		model.addAttribute("user_list_main", user_list_main);
		
		return "index";
	}






	@RequestMapping("/investigate")
	public String investigate(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("investigate()");
		
		int num = Integer.parseInt(request.getParameter("radio"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", session.getAttribute("mem_id"));
		map.put("num", num);
		sqlSession.update("investigateMember", map);
		switch(num) {
			case 1:
				System.out.println("investigate1");
				sqlSession.update("investigate1");break;
			case 2:
				System.out.println("investigate2");
				sqlSession.update("investigate2");break;
			case 3:
				System.out.println("investigate3");
				sqlSession.update("investigate3");break;
			case 4:
				System.out.println("investigate4");
				sqlSession.update("investigate4");break;
		}
		
		return "redirect:index";
	}
}

