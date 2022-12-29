package com.pomaden.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class KakaoPayService {

	public String getResult(HashMap<String, HashMap<String, Object>> data, HttpSession session) {
		String item_name = "";
		String quantity = "";
		String total_amount = "";
		List<HashMap<String, Object>> insertList = new ArrayList<HashMap<String, Object>>(); 
		// 카카오페이 결제 정보 추출
		for(String key : data.keySet()) {
			if("kakaopay".equals(key)) {
				item_name = (String) data.get(key).get("item_name");
				quantity = (String) data.get(key).get("quantity");
				total_amount = (String) data.get(key).get("total_amount");
			}
			else { // 결제 성공시 주문내역에 insert 할 객체를 list에 담습니다
				insertList.add(data.get(key));
			}
		}
		session.setAttribute("list", insertList);
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST"); // POST방식 요청 필수
			conn.setRequestProperty("Authorization", "KakaoAK 25e0cab6e55456b673945b02af08b5bd"); // 기본정보
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");// 기본정보
			conn.setDoOutput(true); // 서버에 보낼 데이터가 있으면 true 기본값은 false
			String param = "cid=TC0ONETIME"
						 + "&partner_order_id=partner_order_id"
						 + "&partner_user_id=partner_user_id"
						 + "&item_name=" + URLEncoder.encode(item_name,"utf-8")
						 + "&quantity=" + quantity
						 + "&total_amount=" + total_amount
						 + "&tax_free_amount=0"
						 + "&approval_url=http://localhost:8080/controller/kakaopay/success" 
						 + "&cancel_url=http://localhost:8080/controller/kakaopay/fail"
						 + "&fail_url=http://localhost:8080/controller/kakaopay/cancel";
			
			OutputStream output = conn.getOutputStream();
			DataOutputStream dataOutput = new DataOutputStream(output);
			dataOutput.writeBytes(param); 
			dataOutput.close(); // close와 동시에 flush 즉, 데이터 전송
			
			int resultCode = conn.getResponseCode();
			InputStream input;
			if(resultCode == 200) {
				input = conn.getInputStream();
			}
			else {
				input = conn.getErrorStream();
			}
			
			InputStreamReader reader = new InputStreamReader(input);
			BufferedReader result = new BufferedReader(reader);
			return result.readLine(); // 실제론 json 객체 
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "test";
	}

}
