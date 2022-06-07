package service;

import javax.mail.MessagingException;

public interface MailService {
	/**
	 * 发送预定【成功】的邮件
	 * 
	 * @param mailAddress
	 * @return
	 * @throws MessagingException 
	 */
	public void bookedOK(String mailAddress, String msg) throws MessagingException;

	/**
	 * 发送预定【取消】的邮件
	 * 
	 * @param mailAddress
	 * @return
	 * @throws MessagingException 
	 */
	public void bookedCancel(String mailAddress, String msg) throws MessagingException;

}
