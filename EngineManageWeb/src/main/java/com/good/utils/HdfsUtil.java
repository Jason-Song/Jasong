package com.good.utils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.util.Progressable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HdfsUtil {
    private static Logger logger = LoggerFactory.getLogger(HdfsUtil.class);

	/**
	 * 新建文件 
	 * @param dsta
	 * @param conf
	 * @return
	*/
	public static boolean CreatDir(String dst , Configuration conf){
		Path dstPath = new Path(dst) ;
		try{
			FileSystem dhfs = FileSystem.get(conf);
		    dhfs.mkdirs(dstPath);
		}
		catch(IOException ie){
			ie.printStackTrace() ;
			return false ;
		}
		return true ;
	}
	 
	/**
	 * 文件上传
	 * @param src 
	 * @param dst
	 * @param conf
	 * @return
	*/
	public static boolean putToHDFS(InputStream src , String dst , Configuration conf){
		Path dstPath = new Path(dst) ;

		try {
			InputStream in = new BufferedInputStream(src);
			
			FileSystem fs = dstPath.getFileSystem(conf);
			OutputStream out = fs.create(dstPath, new Progressable() {
				public void progress() {
					logger.info(".");
				}
			});
			IOUtils.copyBytes(in, out, 4096, true);
			logger.info("上传到HDFS成功！HDFS文件路径："+dst);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false ;
		}
		return true ;
	}

	/**
	 * 文件下载
	 * @param src
	 * @param dst
	 * @param conf
	 * @return
	*/
	public static InputStream getFromHDFS(String dst , Configuration conf){
		Path dstPath = new Path(dst) ;
		InputStream in = null;
		try{
			FileSystem dhfs = dstPath.getFileSystem(conf) ;
			//dhfs.copyToLocalFile(false, new Path(src), dstPath) ;
			in = dhfs.open(dstPath);
		}catch(IOException ie){
			ie.printStackTrace();		
		}
		return in ;
	}

	 
	/**
	 * @author dcx by 2015.11.19
	 * 文件删除
	 * @param path
	 * @param conf
	 * @return
	*/
	public static boolean checkAndDel(final String path , Configuration conf){
		Path dstPath = new Path(path) ;
		try{
			FileSystem dhfs = dstPath.getFileSystem(conf) ;
			if(dhfs.exists(dstPath)){
				dhfs.delete(dstPath, true) ;
			}else{
				return false ;
			}
		}catch(IOException ie ){
			ie.printStackTrace() ;
			return false ;
		}
		return true ;
	}
}
