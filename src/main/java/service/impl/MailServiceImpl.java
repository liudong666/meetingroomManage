package service.impl;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import service.MailService;

@Service
public class MailServiceImpl implements MailService {
	// TODO 用IOC的方法简化代码（或考虑单例模式？）
	// 理论上要有返回值，但是相关方法都是void，因此目前无返回值
	// 正文内容预计会有修改，如补充预订人、预定会议室号码等，之后可通过修改参数列表对正文内容进行修改

	/**
	 * 发送预定【成功】的邮件
	 * 
	 * @param mailAddress
	 * @return
	 * @throws MessagingException
	 */
	public void bookedOK(String mailAddress, String msg) throws MessagingException {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.163.com");
		props.put("mail.smtp.auth", "true");
		// 基本的邮件会话
		Session session = Session.getInstance(props);
		// 构造信息体
		MimeMessage message = new MimeMessage(session);
		// 发件地址
		Address address = new InternetAddress("zizhao1996@163.com");
		message.setFrom(address);
		// 收件地址
		Address toAddress = new InternetAddress(mailAddress);
		message.setRecipient(MimeMessage.RecipientType.TO, toAddress);

		// 主题
		message.setSubject(msg);
		// 正文
		message.setText(msg);

		message.saveChanges(); // implicit with send()
		// Exception in thread "main" javax.mail.NoSuchProviderException: smtp
		session.setDebug(true);
		Transport transport = session.getTransport("smtp");
		transport.connect("smtp.163.com", "zizhao1996@163.com", "aptx4869");
		// 发送
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();
	}

	/**
	 * 发送预定【取消】的邮件
	 * 
	 * @param mailAddress
	 * @return
	 */
	@Override
	public void bookedCancel(String mailAddress, String msg) throws MessagingException {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.163.com");
		props.put("mail.smtp.auth", "true");
		// 基本的邮件会话
		Session session = Session.getInstance(props);
		// 构造信息体
		MimeMessage message = new MimeMessage(session);
		// 发件地址
		Address address = new InternetAddress("zizhao1996@163.com");
		message.setFrom(address);
		// 收件地址
		Address toAddress = new InternetAddress(mailAddress);
		message.setRecipient(MimeMessage.RecipientType.TO, toAddress);

		// 主题
		message.setSubject(msg);
		// 正文
		message.setText(msg);

		message.saveChanges(); // implicit with send()
		// Exception in thread "main" javax.mail.NoSuchProviderException: smtp
		session.setDebug(true);
		Transport transport = session.getTransport("smtp");
		transport.connect("smtp.163.com", "zizhao1996@163.com", "aptx4869");
		// 发送
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();
	}
}
