/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



/**
 *
 * @author hungl
 */

public class EmailController {
     String d_email = "doquang938@gmail.com",
            d_password = "Quangzolo001",
            d_host = "smtp.gmail.com",
            d_port = "465",          
            m_subject = "Testing"
            ;

    // Those are the values that have the email information
     public void Send(String ToMail,String username,String name){
         String link = "http://localhost:8080/SWP_Team5/EZquizi/resetPass.jsp";
         String m_text = "<table style=\"width: 100% !important\" >\n" +
"            <tbody>\n" +
"                <tr>\n" +
"                    <td>\n" +
"                        <div>\n" +
"                            <h2>Hello, " + name +"</h2>\n" +
"                        </div>\n" +
"                        <div>\n" +
"                            You recently took steps to reset the password for your account. Click on the link below to reset your password.\n" +
"                        </div>\n" +
"                        <br>\n" +
"                        <a href=\""+link+"?username="+username+"\">Reset Password</a>\n" +
"                        <br>\n" +
"\n" +
"                        <div>\n" +
"                            This link will expire in 1 days after this email was sent.\n" +
"                        </div>\n" +
"\n" +
"                        <br>\n" +
"                        <div>\n" +
"                            Sincerely,\n" +
"                            <h4>EzQuizi</h4>\n" +
"                        </div>\n" +
"                    </td>\n" +
"                </tr>\n" +
"            </tbody>\n" +
"        </table>";
         send( d_email, d_host, d_port, ToMail, m_subject, m_text);
     }
    public void send(String from, String host, String port, String to, String subject, String text) {

        Properties props = new Properties();

        // Read properties file.

        props.put("mail.smtp.user", from);
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", port);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        SecurityManager security = System.getSecurityManager();

        try {
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getInstance(props, auth);
            Message msg = new MimeMessage(session);

            msg.setContent(text,  "text/html;charset=UTF-8");
            msg.setSubject("Reset Password");
            msg.setFrom(new InternetAddress(from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Transport.send(msg);
        } catch (Exception mex) {
            mex.printStackTrace();
        }
    }

    public class SMTPAuthenticator extends javax.mail.Authenticator {

        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(d_email, d_password);
        }
    }
}