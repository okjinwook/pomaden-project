package com.pomaden.service;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.pomaden.model.CartDTO;
import com.pomaden.model.ProductDAO;
import com.pomaden.model.ProductDTO;

@Service
public class ProductService {
	@Autowired
	private ProductDAO dao;
	private final String serverIP = "192.168.1.100";
	private int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;

	public int insert(ProductDTO dto) throws Exception {
		File dest1 = null;
		if (dto.getProduct_upload() != null) {
			MultipartFile file = dto.getProduct_upload();
			dest1 = new File(file.getOriginalFilename());
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
		chSftp.cd("/var/www/html/product");
		chSftp.put(fis, dest1.getName());
		System.out.println("sftp> transfer complete");

		fis.close();
		chSftp.exit();

		String uploadFilePath = "";
		uploadFilePath += "http://";
		uploadFilePath += serverIP;
		uploadFilePath += ":80"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
		uploadFilePath += "/product/" + dto.getProduct_upload().getOriginalFilename();

		dto.setProduct_img(uploadFilePath);

		return dao.insert(dto);
	}

	public List<ProductDTO> selectAll() {
		return dao.selectAll();
	}

	public List<ProductDTO> selectList(HashMap<String, String> data) {
		return dao.selectList(data);
	}

	public List<ProductDTO> selectKind(String category) {
		return dao.selectKind(category);
	}

	public ProductDTO getProduct(String product_name) {
		return dao.selectOne(product_name);
	}

	public int update(HashMap<String, Object> map) {
		return dao.update(map);
	}

	public List<CartDTO> setPaymentSingle(String item_color, String item_name, String item_size, String count) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		ProductDTO dto = dao.selectOne(item_name);
		CartDTO setCart = new CartDTO();
		int price = Math.round((dto.getProduct_price() * (100 - dto.getProduct_sale()) / 100)/100);
		int total_price =  Integer.parseInt(count) * price * 100;
		setCart.setCart_color(item_color);
		setCart.setCart_count(Integer.parseInt(count));
		setCart.setCart_sale(dto.getProduct_sale());
		setCart.setCart_img(dto.getProduct_img());
		setCart.setCart_name(dto.getProduct_name());
		setCart.setCart_price(dto.getProduct_price());
		setCart.setCart_size(item_size);
		setCart.setCart_total(total_price);
		list.add(setCart);
		return list;
	}

	public int delete(String product_name) {
		return dao.delete(product_name);
	}

	public ProductDTO selectOne(String product_name) {
		return dao.selectOne(product_name);
	}



}
