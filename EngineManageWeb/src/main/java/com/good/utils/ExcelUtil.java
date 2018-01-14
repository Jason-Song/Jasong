package com.good.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtil {
    public static List<Map<String,Object>> upload(InputStream ios){
        List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
        try {
            XSSFWorkbook workbook = new XSSFWorkbook(ios);
            XSSFSheet sheet = workbook.getSheetAt(0);
            XSSFRow rowHead = sheet.getRow(1);
            short cellNum = rowHead.getLastCellNum();
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                Map<String,Object> map = new HashMap<String, Object>();
                XSSFRow row = sheet.getRow(i);
                for (int j = 0; j < cellNum; j++) {
                    XSSFCell cellHead = rowHead.getCell(j);
                    XSSFCell cell = row.getCell(j);
                    if (cell != null && cellHead != null) {
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        map.put(String.valueOf(j), cell.getStringCellValue());
                    }
                }
                if(map.size() != 0){
                    lists.add(map);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lists;
    }
}
