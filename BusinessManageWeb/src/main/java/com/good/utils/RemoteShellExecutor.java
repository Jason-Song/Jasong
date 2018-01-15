package com.good.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ethz.ssh2.ChannelCondition;
import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

/**
 * 远程调用shell公共类.
 * @author zmyu
 *
 */
public class RemoteShellExecutor {
    
    private static Logger logger = LoggerFactory.getLogger(RemoteShellExecutor.class);
     
     private Connection conn;
     
     /** 远程机器IP */
     private String ip;
     
     /** 用户名 */
     private String osUsername;
     
     /** 密码 */
     private String password;
     
     private String charset = Charset.defaultCharset().toString();

     private static final int TIME_OUT = 1000 * 5 * 60;

     /**
      * 构造函数
      * @param ip       IP地址
      * @param usr      登陆用户名
      * @param pasword  登陆密码
      */
     public RemoteShellExecutor(String ip, String usr, String pasword) {
         this.ip = ip;
         this.osUsername = usr;
         this.password = pasword;
     }


     /**
     * 登录
     * @return
     * @throws IOException
     */
     private boolean login() throws IOException {
         conn = new Connection(ip);
         conn.connect();
         return conn.authenticateWithPassword(osUsername, password);
     }

     /**
     * 执行脚本
     * 
     * @param cmds
     * @return
     * @throws Exception
     */
     public int exec(String cmds) throws Exception {
         InputStream stdOut = null;
         InputStream stdErr = null;
         int ret = -1;
         try {
         if (login()) {
             Session session = conn.openSession();
             session.execCommand(cmds);
             stdOut = new StreamGobbler(session.getStdout());
             processStream(stdOut, charset);
             stdErr = new StreamGobbler(session.getStderr());
             processStream(stdErr, charset);
             session.waitForCondition(ChannelCondition.EXIT_STATUS, TIME_OUT);
             ret = session.getExitStatus();
         } else {
             logger.error("登录远程机器失败" + ip);
             throw new Exception("登录远程机器失败" + ip); 
         }
         } finally {
             if (conn != null) {
                 conn.close();
             }
             IOUtils.closeQuietly(stdOut);
             IOUtils.closeQuietly(stdErr);
         }
         return ret;
     }

     /**
     * @param in
     * @param charset
     * @return
     * @throws IOException
     * @throws UnsupportedEncodingException
     */
     private String processStream(InputStream in, String charset) throws Exception {
         byte[] buf = new byte[1024];
         StringBuilder sb = new StringBuilder();
         while (in.read(buf) != -1) {
             sb.append(new String(buf, charset));
         }
         return sb.toString();
     }
}