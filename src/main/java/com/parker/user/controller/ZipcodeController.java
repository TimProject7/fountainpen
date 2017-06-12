package com.parker.user.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.parker.user.vo.ZipcodeSearchTO;
import com.parker.user.vo.ZipcodeVO;

@Controller
public class ZipcodeController {

	public static final String ZIPCODE_API_KEY = "e315c351313f17fe01496218323864";
	public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi"; // 요청
																								// URL

	/**
	 * 우편번호 화면
	 * 
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/zipcode")
	public String zipcode() throws Exception {

		return "zipcode/zipcode";
	}

	/**
	 * 우편번호 검색 결과
	 * 
	 * @param searchTO
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "zipcode/list", method = RequestMethod.POST, produces = "text/plain;charset=euc-kr")
	public @ResponseBody String list(@ModelAttribute ZipcodeSearchTO searchTO) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		// 요청 URL 생성
		StringBuilder queryUrl = new StringBuilder();

		// 받아온 인증키.
		queryUrl.append(ZIPCODE_API_URL);
		queryUrl.append("?regkey=");
		queryUrl.append(ZIPCODE_API_KEY);
		queryUrl.append("&target=");
		queryUrl.append(searchTO.getTarget()); // 서비스 종류 (지번/도로명, 새우편번호 지번/도로명)
		queryUrl.append("&query=");

		// ex) 세종로 17 로 입력하면 세종로와 17사이의 빈칸 때문에 에러가 발생하기 때문에 빈칸을 없앤다.
		queryUrl.append(URLEncoder.encode(searchTO.getQuery().replaceAll("", ""), "euc-kr")); // 검색어

		Document document = Jsoup.connect(queryUrl.toString()).get();
		System.out.println(" queryUrl : " + queryUrl.toString());

		String errorCode = document.select("error_code").text();
		System.out.println("document : " + document.select("error_code").text());
		System.out.println(" errorCode : " + errorCode);

		// 요청 결과가 정상일 경우 내용을 파싱하여 List 에 담는다.
		if (null == errorCode || "".equals(errorCode)) {
			Elements elements = document.select("item");

			List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
			ZipcodeVO zipcodeVO = null;

			for (Element element : elements) {
				zipcodeVO = new ZipcodeVO();
				zipcodeVO.setZipcode(element.select("postcd").text());

				// 도로명 검색일 경우
				if (searchTO.getTarget().indexOf("Road") > -1) {
					zipcodeVO.setAddress(element.select("rnaddress").text());
					zipcodeVO.setLnmAddress(element.select("lnmaddress").text());

					// 지번 검색일 경우
				} else {
					zipcodeVO.setAddress(element.select("address").text());
				}

				list.add(zipcodeVO);
			}

			paramMap.put("list", list);

			// 요청 결과가 정상이 아닐 경우 에러 내용을 담는다.
		} else {
			String errorMessage = document.select("message").text();

			paramMap.put("errorCode", errorCode);
			paramMap.put("errorMessage", errorMessage);
		}

		return (new Gson()).toJson(paramMap);
	}
}
