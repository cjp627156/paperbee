package pers.kerry.paperbee.common;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import pers.kerry.paperbee.pojo.EmailBean;

import javax.mail.internet.MimeMessage;
import java.util.Map;

@Component
public class EmailClient {
    @Value("${sys.mail.sender}")
    private String MAIL_SENDER; //邮件发送者

    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private Configuration configuration;

    public void sendSimpleMail(EmailBean mailBean) throws Exception{
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //邮件发送人
        simpleMailMessage.setFrom(MAIL_SENDER);
        //邮件接收人
        simpleMailMessage.setTo(mailBean.getRecipient());
        //邮件主题
        simpleMailMessage.setSubject(mailBean.getSubject());
        //邮件内容
        simpleMailMessage.setText(mailBean.getContent());
        javaMailSender.send(simpleMailMessage);
    }

    /**
     * 通过 freemarker 模板发送
     * @param emailBean
     * @param model
     * @throws Exception
     */
    public void sendTemplateMail(EmailBean emailBean, Map<String,Object> model) throws Exception {
        MimeMessage mimeMailMessage = null;

        mimeMailMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMailMessage, true);
        mimeMessageHelper.setFrom(MAIL_SENDER);
        mimeMessageHelper.setTo(emailBean.getRecipient());
        mimeMessageHelper.setSubject(emailBean.getSubject());

        Template template = configuration.getTemplate("email.ftl");
        String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);
        mimeMessageHelper.setText(text, true);

        javaMailSender.send(mimeMailMessage);

    }

}