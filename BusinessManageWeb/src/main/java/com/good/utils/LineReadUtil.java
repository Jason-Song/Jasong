package com.good.utils;

import java.io.File;  
import java.io.FileReader;  
import java.io.IOException;  
import java.io.LineNumberReader;  
import java.util.ArrayList;
import java.util.List;


public class LineReadUtil{  
    // 读取文件指定行。  
    public static List<String> readAppointedLineNumber(File sourceFile, int lineNumber)throws IOException {  
        FileReader in = new FileReader(sourceFile);  
        List<String> lineMsg = new ArrayList<String>();
        LineNumberReader reader = new LineNumberReader(in); 
        
        String s = "";  
        if (lineNumber <= 0 || lineNumber > getTotalLines(sourceFile)) { 
            reader.close();  
            in.close();  
            lineMsg.add("");
            return lineMsg;
        }  
        int lines = 0;  
        while ((s = reader.readLine()) != null) {  
            lines++;  
//            s = reader.readLine(); 
            if(lines >= lineNumber) {  
	            System.out.println(s);  
	            lineMsg.add(s);         
            }  
        }  
        reader.close();  
        in.close();  
        return lineMsg;
    }  
    
    // 文件内容的总行数。  
    public static int getTotalLines(File file) throws IOException {  
        FileReader in = new FileReader(file);  
        LineNumberReader reader = new LineNumberReader(in);  
        String s = reader.readLine();  
        int lines = 0;  
        while (s != null) {  
            lines++;  
            s = reader.readLine();  
        }  
        reader.close();  
        in.close();  
        return lines;  
    }  
     
}  