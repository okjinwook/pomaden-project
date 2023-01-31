package com.pomaden.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pomaden.service.ReplyService;
 
@Controller
public class ReplyController {

	@Autowired private ReplyService rs;
	
	
	@ResponseBody
	@PostMapping("/reply/insert")
	public HashMap<String, String> insert(@RequestBody HashMap<String, Object> map) {
		HashMap<String, String> resp = new HashMap<String, String>();
		int row = rs.insert(map);
		if(row == 1) {
			resp.put("msg", "댓글이 작성되었습니다.");
		}
		else{
			resp.put("msg", "댓글 작성 실패하였습니다..");
		}
		return resp;
	}
	
	@ResponseBody
	@PostMapping("/reply/update")
	public HashMap<String, String> delete(int reply_idx, String reply_content) {
		HashMap<String, String> resp = new HashMap<String, String>();
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("reply_idx", reply_idx + "");
		data.put("reply_content", reply_content);
		int row = rs.update(data);
		if(row == 1) {
			resp.put("msg", "댓글이 수정되었습니다.");
		}
		else{
			resp.put("msg", "댓글수정 실패하였습니다..");
		}
		return resp; 
	}
	
	@ResponseBody
	@PostMapping("/reply/delete")
	public HashMap<String, String> delete(int reply_idx) {
		HashMap<String, String> resp = new HashMap<String, String>();
		int row = rs.delete(reply_idx);
		if(row == 1) {
			resp.put("msg", "댓글이 삭제되었습니다.");
		}
		else{
			resp.put("msg", "댓글삭제 실패하였습니다..");
		}
		return resp; 
	}
	
}
