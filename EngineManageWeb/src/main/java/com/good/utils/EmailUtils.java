package com.good.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.PostMethod;

import com.alibaba.druid.support.json.JSONUtils;

/**
 * 邮件发送公共类.
 * @author zmyu
 *
 */
public class EmailUtils {
	
	private static String hexString ="0123456789ABCDEF";
	
	/**
	 * 发送邮件公共类，传入发送邮件URL和邮件内容map
	 * @param url
	 * @param map
	 *        emailAddresses   收件人列表，多个用半角逗号分割
	 *        templateId       邮件模板ID
	 *        ss               模板中的参数
	 *        attachments      附件列表，多个用半角逗号分割
	 *        bccAddresses     隐藏抄送人列表，多个用半角逗号分割
	 *        ccAddresses      抄送人列表，多个用半角逗号分割 
	 * @return
	 */
	public static String sendEmail(String url, Map<String, Object> map){
	    HttpClient client = new HttpClient();
	    PostMethod post = new PostMethod(url);
	    
	    String jsonMap = JSONUtils.toJSONString(map);
	    String s = encode(jsonMap);
	    post.addParameter(new NameValuePair("parameters", s));
	    String responseContent = null;
	    InputStream is = null;
	    try {
            int statusCode = client.executeMethod(post);
            if (statusCode == HttpStatus.SC_OK){
                is = post.getResponseBodyAsStream();
                responseContent = post.getResponseBodyAsString();
            } 
        } catch (HttpException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            ((SimpleHttpConnectionManager)client.getHttpConnectionManager()).shutdown();
        }
	    return responseContent;
	}
	
	private static String encode(String str){
		byte[] bytes = str.getBytes();
		StringBuilder sb = new StringBuilder(bytes.length*2);
		
		for(int i = 0; i < bytes.length; i++){
			sb.append(hexString.charAt((bytes[i] & 0xf0) >> 4));
			sb.append(hexString.charAt((bytes[i] & 0x0f) >> 0));
		}
		return sb.toString();
	}
	
	private static String decode(String bytes){
	   ByteArrayOutputStream baos = new ByteArrayOutputStream(bytes.length()/2);
	   for(int i = 0; i < bytes.length();i += 2){
		   baos.write((hexString.indexOf(bytes.charAt(i))<<4|hexString.indexOf(bytes.charAt(i+1))));
	   }
	   return new String(baos.toByteArray());
   }
}
