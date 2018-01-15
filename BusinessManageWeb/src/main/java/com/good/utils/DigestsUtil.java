package com.good.utils;

import java.security.GeneralSecurityException;
import java.security.MessageDigest;

import org.apache.commons.codec.binary.Hex;



public class DigestsUtil {
	
	public static byte[] sha1(byte[] input) throws Exception{
		return digest(input,"SHA-1",null,1);
	}
	
	public static String sha1(String input){
		return Hex.encodeHexString(input.getBytes());
	}
	
	private static byte[] digest(byte[] input,String algorithm,byte[] salt, int iterations) throws Exception {
		byte[] result = null;
		try{
			MessageDigest digest = MessageDigest.getInstance(algorithm);
			
			if(salt != null)digest.update(salt);
			
			result = digest.digest(input);
			
			for(int i = 1;i < iterations; i++){
				digest.reset();
				result = digest.digest();
			}
		}catch(GeneralSecurityException e){
			e.printStackTrace();;
		}
		return result;
	}
}
