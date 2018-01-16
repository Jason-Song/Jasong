package com.good.utils;

import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Random;  
  
public class RandomUtil {  
  
    /** 
     * 生成随机文件名：当前年月日时分秒+五位随机数 
     *  
     * @return 
     */  
    public static String getRandomFileName() {  
        SimpleDateFormat simpleDateFormat;  
        simpleDateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");  
        Date date = new Date();  
        String str = simpleDateFormat.format(date);  
        Random random = new Random();  
        int rannum = (int) (random.nextDouble() * (999999 - 100000 + 1)) + 100000;// 获取5位随机数  
        return rannum + "-" + str;// 当前时间  
    }
}  