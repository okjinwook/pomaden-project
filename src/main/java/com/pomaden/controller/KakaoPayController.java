package com.pomaden.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class KakaoPayController {
	@GetMapping("/kakaopay/success")
	public void success(String pg_token) {}
	@GetMapping("/kakaopay/fail")
	public void fail(String pg_token) {}
	@GetMapping("/kakaopay/cancle")
	public void cancle(String pg_token) {}
	
	
	@ResponseBody
	@PostMapping("/kakaopay/paymentReady")
	public String payment(@RequestBody HashMap<String, Object> data) {
		String item_name = (String) data.get("item_name");
		String quantity = (String) data.get("quantity");
		String total_amount = (String) data.get("total_amount");
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 25e0cab6e55456b673945b02af08b5bd");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			String param = "cid=TC0ONETIME"
						 + "&partner_order_id=partner_order_id"
						 + "&partner_user_id=partner_user_id"
						 + "&item_name=" + item_name
						 + "&quantity=" + quantity
						 + "&total_amount=" + total_amount
						 + "&tax_free_amount=0"
						 + "&approval_url=http://localhost:8080/controller/kakaopay/success"
						 + "&cancel_url=http://localhost:8080/controller/kakaopay/fail"
						 + "&fail_url=http://localhost:8080/controller/kakaopay/cancel";
			
			OutputStream output = conn.getOutputStream();
			DataOutputStream dataOutput = new DataOutputStream(output);
			dataOutput.writeBytes(param);
			dataOutput.close();
			
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
			return result.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "test";
	}
	
}
