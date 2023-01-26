package com.pomaden.service;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.pomaden.model.ReviewDAO;
import com.pomaden.model.ReviewDTO;

@Service
public class ReviewService {
	@Autowired private ReviewDAO dao;
	private final String serverIP = "pomadenimg.cafe24.com";
	private int serverPort = 3822;
	private final String serverUser = "pomadenimg";
	private final String serverPass = "ok584711@";
	private ChannelSftp chSftp = null;

	public int insert(ReviewDTO dto) throws Exception {
		dto.setReview_img("none");
		if(dto.getReview_upload().getOriginalFilename() != "") {
			File dest1 = null;
			if (dto.getReview_upload() != null) {
				MultipartFile file =  dto.getReview_upload();
				dest1 = new File(dto.getReview_member_id()  + "_" + file.getOriginalFilename());
				file.transferTo(dest1);
			}
			// 웹서버에 생성된 임시파일을 파일서버에 전송
			Session sess = null;
			Channel channel = null;
			JSch jsch = new JSch();

			sess = jsch.getSession(serverUser, serverIP, serverPort);
			sess.setPassword(serverPass);
			sess.setConfig("StrictHostKeyChecking", "no");
			sess.connect();
			System.out.println("sftp > connected");
			channel = sess.openChannel("sftp");
			channel.connect();

			chSftp = (ChannelSftp) channel;

			FileInputStream fis = new FileInputStream(dest1);
			chSftp.cd("/upload/review");
			chSftp.put(fis, dest1.getName());
			System.out.println("sftp> transfer complete");

			fis.close();
			chSftp.exit();

			String uploadFilePath = "";
			uploadFilePath += "https://";
			uploadFilePath += serverIP;
			uploadFilePath += "/upload/review/" + dto.getReview_member_id()  + "_" + dto.getReview_upload().getOriginalFilename();

			dto.setReview_img(uploadFilePath);
		}
		// textarea 컨텐트 개행처리 \n => <br>
		String content = dto.getReview_content();
		dto.setReview_content(content.replaceAll("\n", "<br>"));
		return dao.insert(dto);
	}

	public List<ReviewDTO> selectList(HashMap<String, String> map) {
		return dao.selectList(map);
	}

}
