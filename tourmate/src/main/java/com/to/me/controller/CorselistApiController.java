package com.to.me.controller;

import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.me.dto.CorselistApiDTO;
import com.to.me.dto.TourlistApiDto;


@Controller
public class CorselistApiController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/corse")
	public String corse(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("corse()");

		ArrayList<CorselistApiDTO> corselist = new ArrayList<CorselistApiDTO>();
		
		String areaCode = request.getParameter("areaCode");
		String pageNo = request.getParameter("pageNo");
		String areaName = null;
		
		if(areaCode == null) areaName = "서울";
		else if(areaCode.equals("1")) areaName="서울";
		else if(areaCode.equals("2") ) areaName="인천";
		else if(areaCode.equals("3") ) areaName="대전";
		else if(areaCode.equals("4") ) areaName="대구";
		else if(areaCode.equals("5") ) areaName="광주";
		else if(areaCode.equals("6") ) areaName="부산";
		else if(areaCode.equals("7") ) areaName="울산";
		else if(areaCode.equals("8") ) areaName="세종특별자치시";
		else if(areaCode.equals("31") ) areaName="경기도";
		else if(areaCode.equals("32") ) areaName="강원도";
		else if(areaCode.equals("33") ) areaName="충청북도";
		else if(areaCode.equals("34") ) areaName="충정남도";
		else if(areaCode.equals("35") ) areaName="경상북도";
		else if(areaCode.equals("36") ) areaName="경상남도";
		else if(areaCode.equals("37") ) areaName="전라북도";
		else if(areaCode.equals("38") ) areaName="전라남도";
		else if(areaCode.equals("39") ) areaName="제주도";

		System.out.println("areaCode : " + areaCode);
		System.out.println("pageNo : " + pageNo);
		

		String queryUrl = null;
		
		if (areaCode == null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=acVUDTozqIan1T%2F%2FIESGv6YNzLKA7rgLuNxBEhOPfOmz1hLFWCYyWrF4Y3tMYr6sXTyIdy6JBSpWzmv0dtEySA%3D%3D&contentTypeId=25&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json";
		} else if (areaCode != null && pageNo != null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=acVUDTozqIan1T%2F%2FIESGv6YNzLKA7rgLuNxBEhOPfOmz1hLFWCYyWrF4Y3tMYr6sXTyIdy6JBSpWzmv0dtEySA%3D%3D&contentTypeId=25&areaCode="+areaCode+"&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo="+pageNo+"&_type=json";
		} else if (areaCode != null && pageNo == null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=acVUDTozqIan1T%2F%2FIESGv6YNzLKA7rgLuNxBEhOPfOmz1hLFWCYyWrF4Y3tMYr6sXTyIdy6JBSpWzmv0dtEySA%3D%3D&contentTypeId=25&areaCode="+areaCode+"&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json";
		}

		URL url = new URL(queryUrl);
		System.out.println("url : " + url);

		InputStreamReader isr = new InputStreamReader(url.openConnection()
				.getInputStream(), "utf-8");

		JSONObject recommandObject = (JSONObject) JSONValue
				.parseWithException(isr);
		// json
		JSONObject responses = (JSONObject) recommandObject.get("response");
		System.out.println("response : " + responses);

		JSONObject body = (JSONObject) responses.get("body");
		System.out.println("body : " + body);

		JSONObject items = (JSONObject) body.get("items");
		System.out.println("items : " + items);
		JSONArray item = (JSONArray) items.get("item");
		System.out.println("item : " + item);

		try {
			for (int i = 0; i < item.size(); i++) {
				CorselistApiDTO cd = new CorselistApiDTO();
				JSONObject obj = (JSONObject) item.get(i);

			
				if (obj.get("areacode") != null) {
					cd.setAreacode(obj.get("areacode").toString());
				}

				if (obj.get("contenttypeid") != null) {
					cd.setContenttypeid(obj.get("contenttypeid").toString());
				}

				if (obj.get("contentid") != null) {
					cd.setContentid(obj.get("contentid").toString());
				}

				if (obj.get("firstimage") != null) {
					cd.setFirstimage(obj.get("firstimage").toString());
				} else {
					cd.setFirstimage("/resources/corlate/images/noimage.jpg");
				}
				
				

				if (obj.get("title") != null) {
					cd.setTitle(obj.get("title").toString());
				}

				corselist.add(cd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("areaName", areaName);
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("corselist", corselist);
		model.addAttribute("chosenAreaCode", areaCode);

		return "corse";
	}
	
	@RequestMapping("/corseDetail")
	public String corseDetail(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("corseDetail()");

		ArrayList<CorselistApiDTO> corseDetaillist = new ArrayList<CorselistApiDTO>();
		
		String contentId = request.getParameter("contentId");
		System.out.println("contentId:" + contentId);

		String queryUrl = null; // 占쏙옙占쏙옙占쏙옙占쏙옙
		String queryUrl2 = null; //占쌀곤옙占쏙옙占쏙옙
		String queryUrl3 = null; //占쌘쏙옙占쏙옙占쏙옙
		
		if (contentId != null) {
			
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=25&contentId="
						+contentId
						+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
			
			queryUrl2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=25&contentId="
						+contentId
						+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
			
			queryUrl3 =	"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=25&contentId="
						+contentId
						+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&_type=json";
		}
		
		URL url = new URL(queryUrl);
		URL url2 = new URL(queryUrl2);
		URL url3 = new URL(queryUrl3);
		System.out.println("url : " + url);
		System.out.println("url2 : " + url2);
		System.out.println("url3 : " + url3);

		InputStreamReader isr = new InputStreamReader(url.openConnection()
				.getInputStream(), "utf-8");
		InputStreamReader isr2 = new InputStreamReader(url2.openConnection()
				.getInputStream(), "utf-8");
		InputStreamReader isr3 = new InputStreamReader(url3.openConnection()
				.getInputStream(), "utf-8");


		JSONObject recommandObject = (JSONObject) JSONValue
				.parseWithException(isr);
		JSONObject recommandObject2 = (JSONObject) JSONValue
				.parseWithException(isr2);
		JSONObject recommandObject3 = (JSONObject) JSONValue
				.parseWithException(isr3);

		// json
		JSONObject responses = (JSONObject) recommandObject.get("response");
		System.out.println("response : " + responses);

		JSONObject body = (JSONObject) responses.get("body");
		System.out.println("body: " + body);

		JSONObject items = (JSONObject) body.get("items");
		System.out.println("items : " + items);
		JSONObject item = (JSONObject) items.get("item");
		System.out.println("item : " + item);
		
		//json2
		JSONObject responses2 = (JSONObject) recommandObject2.get("response");
		System.out.println("response2 : " + responses2);

		JSONObject body2 = (JSONObject) responses2.get("body");
		System.out.println("body2: " + body2);

		JSONObject items2 = (JSONObject) body2.get("items");
		System.out.println("items2 : " + items2);
		JSONObject item2 = (JSONObject) items2.get("item");
		System.out.println("item2 : " + item2);
		
		//json3 -占쌘쏙옙占쏙옙占쏙옙
		JSONObject responses3 = (JSONObject) recommandObject3.get("response");
		System.out.println("response3 : " + responses3);

		JSONObject body3 = (JSONObject) responses3.get("body");
		System.out.println("body3: " + body3);
		
		CorselistApiDTO csd = new CorselistApiDTO();
		//System.out.println("items:"+body3.get("items"));
		
		try {
			
				JSONObject items3 = (JSONObject) body3.get("items");
				System.out.println("items3 : " + items3);
			
				JSONArray item3 = (JSONArray) items3.get("item");
				System.out.println("item3 : " + item3);
				
				ArrayList<CorselistApiDTO> csublist = new ArrayList<CorselistApiDTO>();
				
				for (int i = 0; i < item3.size(); i++) {
					JSONObject obj = (JSONObject) item3.get(i);
					CorselistApiDTO scsd = new CorselistApiDTO();
					if(obj.get("subdetailimg") != null){
						scsd.setSubdetailimg(obj.get("subdetailimg").toString());
						System.out.println("subdetailimg:"+obj.get("subdetailimg").toString());
					} else {
						scsd.setSubdetailimg("/resources/corlate/images/noimage.jpg"); //占쌘쏙옙占싱뱄옙占쏙옙
					}
					
					if(obj.get("subname") != null){
						scsd.setSubname(obj.get("subname").toString());
						System.out.println("subname:"+obj.get("subname").toString());
						
					} else {
						scsd.setSubname("없음");
					}
					
					if(obj.get("subdetailoverview") != null){
						scsd.setSubdetailoverview(obj.get("subdetailoverview").toString());
						System.out.println("subdetailoverview:"+obj.get("subdetailoverview").toString());
					} else {
						scsd.setSubdetailoverview("없음");
					}
					
					csublist.add(scsd);
					System.out.println("subna = " +scsd.getSubname());
				}
				
				model.addAttribute("csublist", csublist);
				System.out.println("csublist:" + csublist);
			
			
			
			if(item.get("overview") != null){
				csd.setOverview(item.get("overview").toString());	
				System.out.println("overview:"+item.get("overview").toString());
			}else{
				csd.setOverview("없음");
			}
			
			if(item.get("title")!= null){
				csd.setTitle(item.get("title").toString());
				System.out.println("title:"+item.get("title").toString());
			}else{
				csd.setTitle("없음");
			}
			
			
			if(item.get("firstimage") != null){
				csd.setFirstimage(item.get("firstimage").toString());
				System.out.println("firstimage:"+item.get("firstimage").toString());
			} else {
				csd.setFirstimage("/resources/corlate/images/noimage.jpg");
			}
		
			if (item.get("mapx") != null) {
				csd.setMapx(item.get("mapx").toString());
				csd.setMapy(item.get("mapy").toString());
			}else{
				csd.setMapx("");
				csd.setMapy("");
			}
			
			if(item2.get("distance")!= null){
				csd.setDistance(item2.get("distance").toString());
				System.out.println("distance:"+item2.get("distance").toString());
			}else{
				csd.setDistance("없음");
			}
			
			if(item2.get("taketime")!= null){
				csd.setTaketime(item2.get("taketime").toString());
				System.out.println("taketime:"+item2.get("taketime").toString());
			}else{
				csd.setTaketime("없음");
			}
			
			
			corseDetaillist.add(csd);
					
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		model.addAttribute("corseDetaillist", corseDetaillist);
	
		
		
		return "corseDetail";
	}
}
