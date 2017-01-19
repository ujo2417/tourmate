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

import com.to.me.dto.FoodlistApiDTO;
import com.to.me.dto.TourlistApiDto;

@Controller
public class FoodlistApiController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/food")
	public String food(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("food()");

		ArrayList<FoodlistApiDTO> foodlist = new ArrayList<FoodlistApiDTO>();
		
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
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=39&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json";
		} else if (areaCode != null && pageNo != null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=39&areaCode="+areaCode+"&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo="+pageNo+"&_type=json";
		} else if (areaCode != null && pageNo == null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=39&areaCode="+areaCode+"&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json";
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
				FoodlistApiDTO fd = new FoodlistApiDTO();
				JSONObject obj = (JSONObject) item.get(i);

				if (obj.get("addr1") != null) {
					fd.setAddr1(obj.get("addr1").toString());
				}

				if (obj.get("addr2") != null) {
					fd.setAddr2(obj.get("addr2").toString());
				}

				if (obj.get("areacode") != null) {
					fd.setAreacode(obj.get("areacode").toString());
				}

				if (obj.get("contentid") != null) {
					fd.setContentid(obj.get("contentid").toString());
				}

				if (obj.get("contenttypeid") != null) {
					fd.setContenttypeid(obj.get("contenttypeid").toString());
				}

				
				if (obj.get("firstimage") != null) {
					fd.setFirstimage(obj.get("firstimage").toString());
				} else {
					fd.setFirstimage("/resources/corlate/images/noimage.jpg");
				}
				
				

			

	
				if (obj.get("title") != null) {
					fd.setTitle(obj.get("title").toString());
				}

				if (obj.get("zipcode") != null) {
					fd.setZipcode(obj.get("zipcode").toString());
				}

				foodlist.add(fd);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("areaName", areaName);
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("foodlist", foodlist);
		model.addAttribute("chosenAreaCode", areaCode);
		
		
		return "food";

	}

	@RequestMapping("/foodDetail")
	public String foodDetail(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("foodDetail()");

		ArrayList<FoodlistApiDTO> foodDetaillist = new ArrayList<FoodlistApiDTO>();
	
		// request
		String contentId = request.getParameter("contentId");
		System.out.println("contentId:" + contentId);
		
		String queryUrl = null; // 怨듯넻�젙蹂�
		String queryUrl2 = null; //�냼媛쒖젙蹂�
		String queryUrl3 = null; //硫붾돱�젙蹂�
		
		if (contentId != null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=39&contentId="
						+contentId
						+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
			
			queryUrl2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=39&contentId="
						+contentId
						+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
			
			queryUrl3 ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=39&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="
						+contentId
						+"&imageYN=N&_type=json";	
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
		
		//json3
		JSONObject responses3 = (JSONObject) recommandObject3.get("response");
		System.out.println("response3 : " + responses3);

		JSONObject body3 = (JSONObject) responses3.get("body");
		System.out.println("body3: " + body3);
		
		FoodlistApiDTO fd = new FoodlistApiDTO();
		System.out.println(body3.get("items"));
		
		try {
			if(!body3.get("totalCount").toString().equals("0")){
				JSONObject items3 = (JSONObject) body3.get("items");
				System.out.println("items3 : " + items3);
			
				JSONArray item3 = (JSONArray) items3.get("item");
				System.out.println("item3 : " + item3);
				
				List<String> flist = new ArrayList<String>();
				for (int i = 0; i < item3.size(); i++) {
					JSONObject obj = (JSONObject) item3.get(i);
					
					if(obj.get("smallimageurl") != null){
						flist.add(obj.get("smallimageurl").toString());
						System.out.println("flist:" +flist);
						System.out.println("smallimageurl:"+obj.get("smallimageurl").toString());
					} else {
						flist.add("/resources/corlate/images/noimage.jpg");
					}
				}
			
				model.addAttribute("fsublist", flist);
			}
			
			
			if(item.get("overview") != null){
				fd.setOverview(item.get("overview").toString());	
				System.out.println("overview:"+item.get("overview").toString());
			}else{
				fd.setOverview("없음");
			}
			
			if(item.get("title")!= null){
				fd.setTitle(item.get("title").toString());
				System.out.println("title:"+item.get("title").toString());
			}else{
				fd.setTitle("없음");
			}
			
			if(item.get("addr1") != null){
				fd.setAddr1(item.get("addr1").toString());
				System.out.println("overview:"+item.get("addr1").toString());
			}else{
				fd.setAddr1("없음");
			}
			
			if(item.get("addr2")!= null){
				fd.setAddr2(item.get("addr2").toString());
				System.out.println("addr2:"+item.get("addr2").toString());
			}else{
				fd.setAddr2("없음");
			}
			
			if (item.get("mapx") != null) {
				fd.setMapx(item.get("mapx").toString());
				fd.setMapy(item.get("mapy").toString());
			}
			
			if(item.get("zipcode") != null){
				fd.setZipcode(item.get("zipcode").toString());
				System.out.println("zipcode:"+item.get("zipcode").toString());
			}else {
				fd.setZipcode("없음");
			}
			
		
			if(item.get("tel") != null){
				fd.setTel(item.get("tel").toString());
				System.out.println("tel:"+item.get("tel").toString());
			}else{
				fd.setTel("없음");
			}

			if(item.get("firstimage") != null){
				fd.setFirstimage(item.get("firstimage").toString());
				System.out.println("firstimage:"+item.get("firstimage").toString());
			} else {
				fd.setFirstimage("/resources/corlate/images/noimage.jpg");
			}
			
			//�냼媛쒖젙蹂�
			
			if(item2.get("firstmenu") != null){
				fd.setFirstmenu(item2.get("firstmenu").toString());
				System.out.println("firstmenu:"+item2.get("firstmenu").toString());
			} else {
				fd.setFirstmenu("없음");
			}
			
			if(item2.get("chkcreditcardfood") != null){
				fd.setChkcreditcardfood(item2.get("chkcreditcardfood").toString());
				System.out.println("chkcreditcardfood:"+item2.get("chkcreditcardfood").toString());
			} else {
				fd.setChkcreditcardfood("없음");
			}
			
			if(item2.get("infocenterfood") != null){
				fd.setInfocenterfood(item2.get("infocenterfood").toString());
				System.out.println("infocenterfood:"+item2.get("infocenterfood").toString());
			} else {
				fd.setInfocenterfood("없음");
			}
			
			if(item2.get("kidsfacility") != null){
				fd.setKidsfacility(item2.get("kidsfacility").toString());
				System.out.println("kidsfacility:"+item2.get("kidsfacility").toString());
			} else {
				fd.setKidsfacility("없음");
			}
			
			if(item2.get("opentimefood") != null){
				fd.setOpentimefood(item2.get("opentimefood").toString());
				System.out.println("opentimefood:"+item2.get("opentimefood").toString());
			} else {
				fd.setOpentimefood("없음");
			}
			
			if(item2.get("packing") != null){
				fd.setPacking(item2.get("packing").toString());
				System.out.println("packing:"+item2.get("packing").toString());
			} else {
				fd.setPacking("없음");
			}
			
			if(item2.get("parkingfood") != null){
				fd.setParkingfood(item2.get("parkingfood").toString());
				System.out.println("parkingfood:"+item2.get("parkingfood").toString());
			} else {
				fd.setParkingfood("없음");
			}
			
			if(item2.get("reservationfood") != null){
				fd.setReservationfood(item2.get("reservationfood").toString());
				System.out.println("reservationfood:"+item2.get("reservationfood").toString());
			} else {
				fd.setReservationfood("없음");
			}
			
			if(item2.get("restdatefood") != null){
				fd.setRestdatefood(item2.get("restdatefood").toString());
				System.out.println("restdatefood:"+item2.get("restdatefood").toString());
			} else {
				fd.setRestdatefood("없음");
			}
			
			if(item2.get("seat") != null){
				fd.setSeat(item2.get("seat").toString());
				System.out.println("seat:"+item2.get("seat").toString());
			} else {
				fd.setSeat("없음");
			}
			
			if(item2.get("smoking") != null){
				fd.setSmoking(item2.get("smoking").toString());
				System.out.println("smoking:"+item2.get("smoking").toString());
			} else {
				fd.setSmoking("없음");
			}
			
			if(item2.get("treatmenu") != null){
				fd.setTreatmenu(item2.get("treatmenu").toString());
				System.out.println("treatmenu:"+item2.get("treatmenu").toString());
			} else {
				fd.setTreatmenu("없음");
			}
			
			
			foodDetaillist.add(fd);
					
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		model.addAttribute("foodDetaillist", foodDetaillist);
		model.addAttribute("mapx", fd.getMapx());
		model.addAttribute("mapy", fd.getMapy());
		
		return "foodDetail";
	}
}
