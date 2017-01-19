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

import com.to.me.dto.TourlistApiDto;

@Controller
public class TourlistApiController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/recommand")
	public String recommand(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		ArrayList<TourlistApiDto> recommandlist = new ArrayList<TourlistApiDto>();
		// 筌ｌ꼷�벉揶쏉옙
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
		

		String queryUrl = null;
		if (areaCode == null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json";
		} else if (areaCode != null && pageNo != null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&areaCode="
					+ areaCode
					+ "&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo="
					+ pageNo + "&_type=json";
		} else if (areaCode != null && pageNo == null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&areaCode="
					+ areaCode
					+ "&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json";
		}

		URL url = new URL(queryUrl);

		InputStreamReader isr = new InputStreamReader(url.openConnection()
				.getInputStream(), "utf-8");

		JSONObject recommandObject = (JSONObject) JSONValue
				.parseWithException(isr);
		// json
		JSONObject responses = (JSONObject) recommandObject.get("response");

		JSONObject body = (JSONObject) responses.get("body");

		JSONObject items = (JSONObject) body.get("items");
		JSONArray item = (JSONArray) items.get("item");

		try {
			for (int i = 0; i < item.size(); i++) {
				TourlistApiDto ad = new TourlistApiDto();
				JSONObject obj = (JSONObject) item.get(i);

				if (obj.get("addr1") != null) {
					ad.setAddr1(obj.get("addr1").toString());
				}

				if (obj.get("addr2") != null) {
					ad.setAddr2(obj.get("addr2").toString());
				}

				if (obj.get("areacode") != null) {
					ad.setAreacode(obj.get("areacode").toString());
				}

				if (obj.get("cat1") != null) {
					ad.setCat1(obj.get("cat1").toString());
				}

				if (obj.get("cat2") != null) {
					ad.setCat2(obj.get("cat2").toString());
				}

				if (obj.get("cat3") != null) {
					ad.setCat3(obj.get("cat3").toString());
				}

				if (obj.get("contentid") != null) {
					ad.setContentid(obj.get("contentid").toString());
				}

				if (obj.get("contenttypeid") != null) {
					ad.setContenttypeid(obj.get("contenttypeid").toString());
				}

				if (obj.get("createdtime") != null) {
					ad.setCreatedtime(obj.get("createdtime").toString());
				}

				if (obj.get("firstimage") != null) {
					ad.setFirstimage(obj.get("firstimage").toString());
					ad.setFirstimage2(obj.get("firstimage2").toString());
				} else {
					ad.setFirstimage("/resources/corlate/images/noimage.jpg");
					ad.setFirstimage2("/resources/corlate/images/noimage.jpg");
				}

				if (obj.get("mapx") != null) {
					ad.setMapx(obj.get("mapx").toString());
					ad.setMapy(obj.get("mapy").toString());

				}

				if (obj.get("mlevel") != null) {
					ad.setMlevel(obj.get("mlevel").toString());
				}

				if (obj.get("modifiedtime") != null) {
					ad.setMlevel(obj.get("modifiedtime").toString());
				}

				if (obj.get("readcount") != null) {
					ad.setMlevel(obj.get("readcount").toString());
				}

				if (obj.get("sigungucode") != null) {
					ad.setMlevel(obj.get("sigungucode").toString());
				}

				if (obj.get("title") != null) {
					ad.setTitle(obj.get("title").toString());
				}

				if (obj.get("zipcode") != null) {
					ad.setZipcode(obj.get("zipcode").toString());
				}

				recommandlist.add(ad);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("areaName", areaName);
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("recommandlist", recommandlist);

		return "recommand";
	}

	// 占쎄맒占쎄쉭占쎈읂占쎌뵠筌욑옙

	@RequestMapping("/recommandDetail")
	public String recommandDetail(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		request.setCharacterEncoding("utf-8");

		ArrayList<TourlistApiDto> recommandDetaillist = new ArrayList<TourlistApiDto>();

		// request
		String contentId = request.getParameter("contentId");
		String pageNo = request.getParameter("pageNo");
		String areaCode = request.getParameter("areaCode");


		// 由ъ뒪�듃url
		//String queryUrl1 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&_type=json";
		// �냼媛쐕rl
		//String queryUrl2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&contentId=1116925&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
		// �꽭遺��궗吏꼞rl
		//String queryUrl3 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId=1116925&imageYN=Y&_type=json";

		String queryUrl = null; // 怨듯넻�젙蹂�
		String queryUrl2 = null; //�냼媛쒖젙蹂�
		String queryUrl3 = null; //�궗吏꾩젙蹂�
		
		if (contentId != null) {
			queryUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&contentId="
					+ contentId
					+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
			
			queryUrl2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&contentId="
					+contentId
					+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
			
			queryUrl3 =	"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=M1NUoihSSsZ9%2BQvM3vTtuZznst%2BRwH37Q%2BF4%2F1FsYHLq%2F9cuXRYsInAnEMjNxqVU8Y4SsXvmqkgxUSGtjF5%2BtA%3D%3D&contentTypeId=12&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId="
					+contentId+
					"&imageYN=Y&_type=json";
		}

		URL url = new URL(queryUrl);
		URL url2 = new URL(queryUrl2);
		URL url3 = new URL(queryUrl3);

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

		JSONObject body = (JSONObject) responses.get("body");

		JSONObject items = (JSONObject) body.get("items");
		JSONObject item = (JSONObject) items.get("item");
		
		//json2
		JSONObject responses2 = (JSONObject) recommandObject2.get("response");

		JSONObject body2 = (JSONObject) responses2.get("body");

		JSONObject items2 = (JSONObject) body2.get("items");
		JSONObject item2 = (JSONObject) items2.get("item");
		
		//json3
		JSONObject responses3 = (JSONObject) recommandObject3.get("response");

		JSONObject body3 = (JSONObject) responses3.get("body");
		
		
		
		TourlistApiDto dto = new TourlistApiDto();
		try {
			if(!body3.get("totalCount").toString().equals("0")){
				JSONObject items3 = (JSONObject) body3.get("items");
			
				JSONArray item3 = (JSONArray) items3.get("item");
				
				List<String> list = new ArrayList<String>();
				for (int i = 0; i < item3.size(); i++) {
					JSONObject obj = (JSONObject) item3.get(i);
					
					if(obj.get("smallimageurl") != null){
						list.add(obj.get("smallimageurl").toString());
					} else {
						list.add("/resources/corlate/images/noimage.jpg");
					}
				}
				//dto.setSmallimageurl(list);
				model.addAttribute("sublist", list);
			}
			
			
			if(item.get("overview") != null){
				dto.setOverview(item.get("overview").toString());	
				System.out.println("overview:"+item.get("overview").toString());
			}else{
				dto.setOverview("정보없음");
			}
			
			if(item.get("title")!= null){
				dto.setTitle(item.get("title").toString());
				System.out.println("title:"+item.get("title").toString());
			}else{
				dto.setTitle("미정");
			}
			
			if(item.get("addr1") != null){
				dto.setAddr1(item.get("addr1").toString());
				System.out.println("overview:"+item.get("addr1").toString());
			}else{
				dto.setAddr1("없음");
			}
			
			if(item.get("addr2")!= null){
				dto.setAddr2(item.get("addr2").toString());
				System.out.println("addr2:"+item.get("addr2").toString());
			}else{
				dto.setAddr2("없음");
			}
			
			if(item.get("zipcode") != null){
				dto.setZipcode(item.get("zipcode").toString());
				System.out.println("zipcode:"+item.get("zipcode").toString());
			}else {
				dto.setZipcode("없음");
			}
			
		
			if(item.get("homepage") != null){
				dto.setHomepage(item.get("homepage").toString());
				System.out.println("homepage:"+item.get("homepage").toString());
			}else{
				dto.setHomepage("없음");
			}

			if(item.get("firstimage") != null){
				dto.setFirstimage(item.get("firstimage").toString());
				System.out.println("firstimage:"+item.get("firstimage").toString());
			} else {
				dto.setFirstimage("/resources/corlate/images/noimage.jpg");
			}
			
			if(item2.get("chkbabycarriage") != null){
				dto.setChkbabycarriage(item2.get("chkbabycarriage").toString());
				System.out.println("chkbabycarriage:"+item2.get("chkbabycarriage").toString());
			} else {
				dto.setChkbabycarriage("없음");
			}
			
			if(item2.get("chkcreditcard") != null){
				dto.setChkcreditcard(item2.get("chkcreditcard").toString());
				System.out.println("chkcreditcard:"+item2.get("chkcreditcard").toString());
			} else {
				dto.setChkcreditcard("없음");
			}
			
			if(item2.get("chkpet") != null){
				dto.setChkpet(item2.get("chkpet").toString());
				System.out.println("chkpet:"+item2.get("chkpet").toString());
			} else {
				dto.setChkpet("없음");
			}
			if(item2.get("expguide") != null){
				dto.setExpguide(item2.get("expguide").toString());
				System.out.println("expguide:"+item2.get("expguide").toString());
			} else {
				dto.setExpguide("없음");
			}
			
			if(item2.get("infocenter") != null){
				dto.setInfocenter(item2.get("infocenter").toString());
				System.out.println("infocenter:"+item2.get("infocenter").toString());
			} else {
				dto.setInfocenter("없음");
			}
			
			if(item2.get("parking") != null){
				dto.setParking(item2.get("parking").toString());
				System.out.println("parking:"+item2.get("parking").toString());
			} else {
				dto.setParking("없음");
			}
			
			if(item2.get("restdate") != null){
				dto.setRestdate(item2.get("restdate").toString());
				System.out.println("restdate:"+item2.get("restdate").toString());
			} else {
				dto.setRestdate("없음");
			}
			if (item.get("mapx") != null) {
				dto.setMapx(item.get("mapx").toString());
				System.out.println("mapx===============================" + item.get("mapx"));
				
			} else {
				
			}
			
			if (item.get("mapy") != null) {
				dto.setMapy(item.get("mapy").toString());
				System.out.println("mapy===============================" + item.get("mapy"));
				
			}
			
			
			
			recommandDetaillist.add(dto);
					
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		model.addAttribute("recommandDetaillist", recommandDetaillist);
		model.addAttribute("twoareaCode", areaCode);
		model.addAttribute("twopageNo", pageNo);
		model.addAttribute("mapx", dto.getMapx());
		model.addAttribute("mapy", dto.getMapy());	
		
		return "recommandDetail";
	
	}
}

