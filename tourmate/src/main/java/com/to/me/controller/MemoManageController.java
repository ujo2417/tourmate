package com.to.me.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.me.dto.MemoDTO;

@Controller
public class MemoManageController {

	@Autowired
	private SqlSession sqlSession;   
	
	//받은쪽지함
	@RequestMapping("/memoReceiveList")
	public String memoReceiveList(HttpSession session,Model model) {
		System.out.println("--- memoReceiveList ---");
		
		/*header에서 링크를 타고 오는 경우 session값을 request.getparmeter로 안가져와짐 그래서
		session.getAttribute("mem_id") 이걸 이용한다.. 젠장*/
		int memoReceiveCount = sqlSession.selectOne("memoReceiveCount",session.getAttribute("mem_id"));
		model.addAttribute("memoReceiveList", sqlSession.selectList("memoReceiveList",session.getAttribute("mem_id")));
		model.addAttribute("memoReceiveCount",memoReceiveCount);	
		return "memoReceiveList";
	}
	
	//보낸 쪽지함
	@RequestMapping("/memoSendList")
	public String memoSendList(HttpSession session,Model model) {
		System.out.println("memoSendList()");
		
		model.addAttribute("memoSendList", sqlSession.selectList("memoSendList",session.getAttribute("mem_id")));
		
		
		return "memoSendList";
	}
	
	
	//쪽지 작성
	@RequestMapping("/memoSend")
	public String memoSend(HttpSession session,HttpServletRequest request, Model model, MemoDTO dto) {
		System.out.println("memoSendmemoSend");	
		
		sqlSession.insert("memoSend",dto);
		session.setAttribute("memoReceiveCount", sqlSession.selectOne("memoReceiveCount", session.getAttribute("mem_id")));
		
		return "memoSendForm";
	}
	
	
	// 쪽지 작성 폼으로이동하기 위한
	@RequestMapping("/memoSendForm")
	public String memoSend() {
		
		return "memoSendForm";
	}

	
	
	//쪽지함 삭제
	@RequestMapping("/memoReceiveDel")
	public String memoReceiveDel(HttpServletRequest request,Model model,HttpSession session) {
		
		String memo_num = request.getParameter("memo_num");
	    sqlSession.delete("memoReceiveDel", memo_num);
	    session.setAttribute("memoReceiveCount", sqlSession.selectOne("memoReceiveCount", session.getAttribute("mem_id")));
		
		
		
		
		return "redirect:memoReceiveList";
	}
	
	
	//쪽지 내용 확인하기
	@RequestMapping("/memoReceiveContent")
	public String memoReceiveView(HttpSession session ,HttpServletRequest request,Model model,MemoDTO dto) {
		
		String memo_num = request.getParameter("memo_num");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memo_open_date", dto.getMemo_open_date());
		map.put("memo_num", memo_num);
		
		System.out.println("dto.getMemo_open_date()" + dto.getMemo_open_date());
		
		
		
	    sqlSession.update("memoReceiveOpen",map); //읽은 시간 체크 하기위한건데 왜 안돼냐 히밤...
	    session.setAttribute("memoReceiveCount", sqlSession.selectOne("memoReceiveCount", session.getAttribute("mem_id")));	    
	    model.addAttribute("memoReceiveContent", sqlSession.selectOne("memoReceiveContent",memo_num));
		
		
		
		
		return "memoReceiveContent";
	}
	
	// ///////////////////// id 중복확인 ajax 처리
	@RequestMapping("/memoConfirmId")
	public void memoConfirmId(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("memoConfirmId");
		response.setContentType("text/html;charset=UTF-8");
		String confirm_id = request.getParameter("confirm_id");

		String conId = sqlSession.selectOne("confirmId", confirm_id);
		JSONArray ja = new JSONArray();

		if (confirm_id != "") {

			if (conId == null) {

				ja.add("<font color='red' size='2'>" + confirm_id
						+ "는 존재하지 않는 아이디입니다." + "</font>");
			} else {

				ja.add("<font color='blue' size='2'>" + confirm_id
						+ "에게 메세지를 발송합니다." + "</font>");
			}
		} else {

			ja.add("<font color='red' size='2'>" + "아이디를 입력해주세요" + "<font>");
		}

		PrintWriter out = response.getWriter();
		out.print(ja.toString());

	}
	// ///////////////////// id 중복확인 ajax 처리
	
}
