package com.good.utils;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileUtil {

    private static void writeListToTxt(List<String> lists, String filename) {
        BufferedWriter output = null;
        try {
            File file = new File(filename);
            if (!file.exists()) {
                file.createNewFile();
            }
            output = new BufferedWriter(new FileWriter(file));
            for (int i = 0; i < lists.size(); i++) {
                output.write(lists.get(i));
                output.write("\r\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                output.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static String exportToTxt(HttpServletRequest request, HttpServletResponse response, List<String> list) {
        String exportFileName = TimeTool.paserString(new Date(), "yyyyMMddHHmmssS") + ".txt";
        String realPath = request.getServletContext().getRealPath("/upload") + "/exportFiles/" + exportFileName;
        writeListToTxt(list, realPath);
        return realPath;
    }

    /**
     * 读取黑名单二进制文件.
     * 
     * @param datas
     * @return
     * @throws IOException
     * @throws ClassNotFoundException
     */
    public static String unzipHitDetails(Byte[] datas) throws IOException, ClassNotFoundException {
        byte[] data = new byte[datas.length];
        for (int i = 0; i < datas.length; i++) {
            data[i] = datas[i].byteValue();
        }
        ByteArrayInputStream bis = new ByteArrayInputStream(data);
        ZipInputStream zis = new ZipInputStream(bis);
        ZipEntry entry = zis.getNextEntry();
        byte[] buffer = new byte[2048];
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int count;
        while ((count = zis.read(buffer)) != -1) {
            out.write(buffer, 0, count);
            out.flush();
        }
        out.close();
        return new String(out.toByteArray());
    }

    public static int createZip(String sourcePath, String zipPath) {
        if (StringUtil.isEmpty(sourcePath) || StringUtil.isEmpty(zipPath))
            return 1;

        int result = 0;
        FileOutputStream fos = null;
        ZipOutputStream zos = null;
        try {
            fos = new FileOutputStream(zipPath);
            zos = new ZipOutputStream(fos);
            writeZip(new File(sourcePath), "", zos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.out.println("创建ZIP文件失败！" + e.getMessage());
            return 2;
        } finally {
            try {
                if (zos != null) {
                    zos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("创建ZIP文件失败！" + e.getMessage());
                return 2;
            }
        }

        return result;
    }

    private static void writeZip(File file, String parentPath, ZipOutputStream zos) {
        if (file.exists()) {
            if (file.isDirectory()) {
                parentPath += file.getName() + File.separator;
                File[] files = file.listFiles();
                for (File f : files) {
                    writeZip(f, parentPath, zos);
                }
            } else {
                FileInputStream fis = null;
                try {
                    fis = new FileInputStream(file);
                    ZipEntry ze = new ZipEntry(parentPath + file.getName());
                    zos.putNextEntry(ze);
                    byte[] con = new byte[1024];
                    int len;
                    while ((len = fis.read(con)) != -1) {
                        zos.write(con, 0, len);
                        zos.flush();
                    }
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                    System.out.println("创建ZIP文件失败！" + e.getMessage());
                } catch (IOException e) {
                    e.printStackTrace();
                    System.out.println("创建ZIP文件失败！" + e.getMessage());
                } finally {
                    try {
                        if (fis != null) {
                            fis.close();
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                        System.out.println("创建ZIP文件失败！" + e.getMessage());
                    }
                }
            }
        }
    }

}
