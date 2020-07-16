package com.renhouse.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class EmailUtils {
	private String t_to;
	private String t_message;
	private String t_title;
	static boolean debugmodel=false;
	
	
	private String hostemail;
	private String author;
	public void LoginEmail(String email,String auth)
	{
		hostemail=email;
		author=auth;
	}
	public void setdebugmodel(boolean dbg)
	{
		debugmodel=dbg;
	}
    public void SendEmail() throws MessagingException, GeneralSecurityException {
        //����һ�������ļ�������
        Properties properties = new Properties();

        properties.setProperty("mail.host","smtp.qq.com");

        properties.setProperty("mail.transport.protocol","smtp");

        properties.setProperty("mail.smtp.auth","true");


        //QQ����һ����������SSL����
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);

        //����һ��session����
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(hostemail,author);
            }
        });

        //����debugģʽ
        session.setDebug(debugmodel);

        //��ȡ���Ӷ���
        Transport transport = session.getTransport();

        //���ӷ�����
        transport.connect("smtp.qq.com",hostemail,author);

        //�����ʼ�����
        MimeMessage mimeMessage = new MimeMessage(session);

        //�ʼ�������
        mimeMessage.setFrom(new InternetAddress(hostemail));

        //�ʼ�������
        mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(t_to));

        //�ʼ�����
        mimeMessage.setSubject(t_title);

        //�ʼ�����
        mimeMessage.setContent(t_message,"text/html;charset=UTF-8");

        //�����ʼ�
        transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());

        //�ر�����
        transport.close();
    }
	public void SendEmail(String to,String title,String message) throws MessagingException, GeneralSecurityException
	{
		t_to=to;
		t_title=title;
		t_message=message;
		SendEmail();
	}
}