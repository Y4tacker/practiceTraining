package Send;

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
        //创建一个配置文件并保存
        Properties properties = new Properties();

        properties.setProperty("mail.host","smtp.qq.com");

        properties.setProperty("mail.transport.protocol","smtp");

        properties.setProperty("mail.smtp.auth","true");


        //QQ存在一个特性设置SSL加密
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);

        //创建一个session对象
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(hostemail,author);
            }
        });

        //开启debug模式
        session.setDebug(debugmodel);

        //获取连接对象
        Transport transport = session.getTransport();

        //连接服务器
        transport.connect("smtp.qq.com",hostemail,author);

        //创建邮件对象
        MimeMessage mimeMessage = new MimeMessage(session);

        //邮件发送人
        mimeMessage.setFrom(new InternetAddress(hostemail));

        //邮件接收人
        mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(t_to));

        //邮件标题
        mimeMessage.setSubject(t_title);

        //邮件内容
        mimeMessage.setContent(t_message,"text/html;charset=UTF-8");

        //发送邮件
        transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());

        //关闭连接
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