package com.pomaden.mail;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailService {

	// 인증코드 생성
	public String getAuthNumber() {
		Random ran = new Random();
		String authNumber = "";
		for (int i = 0; i < 6; i++) {
			authNumber += ran.nextInt(9);
		}
		return authNumber;
	}

	public String sendMail(String email, String authNumber, String account) {
		// 네이버 smtp 서버명
		String host = "smtp.naver.com";
		// 네이버 smtp 포트
		int port = 465;
		final String username = account.split("/")[0];
		final String password = account.split("/")[1];

		// 메일 발송 서버에 대한 인증 및 속성을 설정
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host); // 메일을 보낼 서버 명
		props.put("mail.smtp.port", port); // 메일을 보낼 서버 포트
		props.put("mail.smtp.auth", "true"); // 메일 보낼때 인증이 필요한가
		props.put("mail.smtp.ssl.enable", "true"); // 메일 보낼때 암호화 처리 하는가
		props.put("mail.smtp.trust", host); // 메일 보내는 신뢰할 수 있는 서버가 어디인가

		// host mailer
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		mailSession.setDebug(true); // 메일 보내는 과정의 디버깅을 화면에 출력하기로 설정

		System.out.println(authNumber);

		// 메일 보낼 내용 - Message 를 구성한다
		Message mimeMessage = new MimeMessage(mailSession);

		String subject = "[POMADEN] 인증번호 안내";
		String tag = "<div style=\"font-size: 20px;\">"
				+ "[POMADEN]인증번호 : [<span style=\"font-size: 24px; font-weight: bold\">%s</span>] 입니다" + "</div>";
		String body = String.format(tag, authNumber);

		try {
			// 보내는 사람의 주소
			mimeMessage.setFrom(new InternetAddress(username + "@naver.com"));

			System.out.println(username);

			// 받는 사람 주소
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

			mimeMessage.setSubject(subject); // 제목
			mimeMessage.setContent(body, "text/html; charset=utf-8"); // 내용 (HTML)

			Transport.send(mimeMessage);

		} catch (MessagingException e) {
			System.err.println("주소가 잘못되었습니다");
			e.printStackTrace();
		}
		return authNumber;

	}
}
