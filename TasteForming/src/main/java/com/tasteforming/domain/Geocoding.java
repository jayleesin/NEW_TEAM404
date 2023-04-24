package com.tasteforming.domain;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

/*
 * 1. VO 에서 address 값을 가져온다. 그 값을 여기에 있는 API 에 넣고 위도와 경도를 가져온다
 * 2. 위도와 경도를 넣은 객체를 jsp 내가 정한 페이지가 실행될 때, Model 객체를 이용해서 넘겨준다.
 * 3. 넘겨준 객체를 js 에서 들어갈 수 있도록 만든다.
 * 결론. 그러면 내가 만들어야 하는 로직을 생각했을 때, 검색을 해서 search 페이지가 열릴 때, Controller 단에서  
 * */
public class Geocoding {
	public static void main(String[] args) {
		// 주소 입력 -> 위도, 경도 좌표 추출.
		BufferedReader io = new BufferedReader(new InputStreamReader(System.in));	
		String clientId = "tskz2tj6ms";
		String clientSecret = "Yyf8XOIdmwJ5Icj2PFa11zdaAEaQ0Yc4j4aghPtf";
		
		try {
			System.out.println("주소를 입력해주세요 : ");
			
			String address = io.readLine();
			String addr = URLEncoder.encode(address, "UTF-8");
			
			// Geocoding 개요에 나와있는 API URL 입력.
			String apiURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + addr;	// JSON
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			
			// Geocoding 개요에 나와있는 요청 헤더 입력.
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			
			// 요청 결과 확인. 정상 호출인 경우 200
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			
			StringBuffer response = new StringBuffer();
			
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			
			br.close();
			
			JSONTokener tokener = new JSONTokener(response.toString());
			JSONObject object = new JSONObject(tokener);			
			JSONArray arr = object.getJSONArray("addresses");
			
			for (int i = 0; i < arr.length(); i++) {
				JSONObject temp = (JSONObject) arr.get(i);
				System.out.println("address : " + temp.get("roadAddress"));
				System.out.println("jibunAddress : " + temp.get("jibunAddress"));
				System.out.println("위도 : " + temp.get("y"));
				System.out.println("경도 : " + temp.get("x"));
			}
			
		} catch (Exception  e) {
			System.out.println(e);
		}
	}
}