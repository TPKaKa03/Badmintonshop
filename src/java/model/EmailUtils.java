package model;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtils {
   
    public static void send(Email email)
            throws Exception {
        Properties prop = new Properties();

        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email.getFrom(), email.getFromPassword());
            }
        });
        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(email.getFrom()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getTo()));
            message.setSubject(email.getSubject());
            message.setContent(email.getContent(), "text/html; charset=utf-8");

            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();

            throw e;
        }
    }

//    public static void main(String[] args) {
//
//        try {
//            // Example usage for testing
//            Email email = new Email();
//            email.setFrom(
//                 
//            "apache");
//            email.setFromPassword(
//                 
//            "uqqq dtli lgnm lkei");
//            email.setTo("thangkaka317@gmail.com");
//            email.setSubject(
//                   
//            "Test Email");
//            email.setContent(
//                   
//            "This is a test email content.");
//
//            send(email);
//
//            System.out.println("Email sent successfully!");
//        } catch (Exception e) {
//            System.err.println("Error sending email: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
}


