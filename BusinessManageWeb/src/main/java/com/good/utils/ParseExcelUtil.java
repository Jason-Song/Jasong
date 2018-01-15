package com.good.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ParseExcelUtil {
    private static Logger logger = LoggerFactory.getLogger(ParseExcelUtil.class);

    /**
      * 获取文件名后缀
      * get postfix of the path
      * @param path
      * @return
      */
     public static String getPostfix(String path) {
         if (path == null || "".equals(path.trim())) {
             return "";
         }
         if (path.contains(".")) {
             return path.substring(path.lastIndexOf(".") + 1, path.length());
         }
         return "";
     }
    
     /**
       * 解析excel为字节数组
       * read the Excel file
       * @param path the path of the Excel file
       * @return
       * @throws IOException
       */
      public static byte[] readExcel(String postfix ,InputStream is) throws IOException {
          if (postfix == null || "".equals(postfix)) {
              logger.error("未知的文件类型！");
              return null;
          } else {
              if ("xls".equals(postfix)) {
                  return readXls(is);
              } else if ("xlsx".equals(postfix)) {
                  return readXlsx(is);
              }
          }
          logger.error("excel文件解析失败！");
          return null;
      }
  
      /**
       * 解析2010版excel
       * Read the Excel 2010
       * @param InputStream is
       * @return byte[]
       * @throws IOException
       */
      public static byte[] readXlsx(InputStream is) throws IOException {
          XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
          StringBuilder sb = new StringBuilder();

          // 设置为解析第一个sheet表
          XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
          // Read the Row
          for (int rowNum = 2; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
              XSSFRow xssfRow = xssfSheet.getRow(rowNum);
              if (xssfRow != null) {
                  XSSFCell name1 = xssfRow.getCell(0);
                  XSSFCell name2 = xssfRow.getCell(1);
                  XSSFCell type = xssfRow.getCell(2);
                  XSSFCell personId = xssfRow.getCell(3);
                  XSSFCell passport = xssfRow.getCell(4);
                  XSSFCell BIC = xssfRow.getCell(5);
                  XSSFCell address = xssfRow.getCell(6);
                  XSSFCell city = xssfRow.getCell(7);
                  XSSFCell state = xssfRow.getCell(9);
                  XSSFCell country = xssfRow.getCell(8);
                  XSSFCell birthday = xssfRow.getCell(10);
                  XSSFCell sex = xssfRow.getCell(11);
                  XSSFCell keyCode = xssfRow.getCell(12);
                  XSSFCell memCode = xssfRow.getCell(13);
                  sb.append(getValue(name1)+"|");
                  sb.append(getValue(name2)+"|");
                  sb.append(getValue(type)+"|");
                  sb.append(getValue(personId)+"|");
                  sb.append(getValue(passport)+"|");
                  sb.append(getValue(BIC)+"|");
                  sb.append(getValue(address)+"|");
                  sb.append(getValue(city)+"|");
                  sb.append(getValue(state)+"|");
                  sb.append(getValue(country)+"|");
                  sb.append(getValue(birthday)+"|");
                  sb.append(getValue(sex)+"|");
                  sb.append(getValue(keyCode)+"|");
                  sb.append(getValue(memCode)+"\n");
              }
          }
          logger.info("excel文件解析成功！");          
          return sb.toString().getBytes("GBK");
      }
  
      /**
       * 解析2003-2007版excel
       * Read the Excel 2003-2007
       * @param InputStream is
       * @return
       * @throws IOException
       */
      public static byte[] readXls(InputStream is)throws IOException {

    	 HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
         StringBuilder sb = new StringBuilder();

         // 设置解析第一张表
         HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);

         // Read the Row
         for (int rowNum = 2; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
        	 HSSFRow hssfRow = hssfSheet.getRow(rowNum);
             if (hssfRow != null) {
            	 HSSFCell name1 = hssfRow.getCell(0);
            	 HSSFCell name2 = hssfRow.getCell(1);
            	 HSSFCell type = hssfRow.getCell(2);
            	 HSSFCell personId = hssfRow.getCell(3);
            	 HSSFCell passport = hssfRow.getCell(4);
            	 HSSFCell BIC = hssfRow.getCell(5);
            	 HSSFCell address = hssfRow.getCell(6);
            	 HSSFCell city = hssfRow.getCell(7);
            	 HSSFCell state = hssfRow.getCell(9);
            	 HSSFCell country = hssfRow.getCell(8);
            	 HSSFCell birthday = hssfRow.getCell(10);
            	 HSSFCell sex = hssfRow.getCell(11);
            	 HSSFCell keyCode = hssfRow.getCell(12);
            	 HSSFCell memCode = hssfRow.getCell(13);
                 sb.append(getValue(name1)+"|");
                 sb.append(getValue(name2)+"|");
                 sb.append(getValue(type)+"|");
                 sb.append(getValue(personId)+"|");
                 sb.append(getValue(passport)+"|");
                 sb.append(getValue(BIC)+"|");
                 sb.append(getValue(address)+"|");
                 sb.append(getValue(city)+"|");
                 sb.append(getValue(state)+"|");
                 sb.append(getValue(country)+"|");
                 sb.append(getValue(birthday)+"|");
                 sb.append(getValue(sex)+"|");
                 sb.append(getValue(keyCode)+"|");
                 sb.append(getValue(memCode)+"\n");
             }
         }
         logger.info("excel文件解析成功！");
         return sb.toString().getBytes("GBK");
     }
      
     public static String getValue(XSSFCell xssfCell) {
         if (xssfCell == null){
        	 return "";
         } else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN) {
             return Boolean.toString(xssfCell.getBooleanCellValue());
         } else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
             return Double.toString(xssfCell.getNumericCellValue());
         } else {
             return xssfCell.getStringCellValue();
         }
     }
     
     public static String getValue(HSSFCell hssfCell) {
    	 if (hssfCell == null){
        	 return "";
         } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
             return Boolean.toString(hssfCell.getBooleanCellValue());
         } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
             return Double.toString(hssfCell.getNumericCellValue());
         } else {
             return hssfCell.getStringCellValue();
         }
     }

}
