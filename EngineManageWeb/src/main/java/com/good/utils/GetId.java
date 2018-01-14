package com.good.utils;

import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

public class GetId {
	
	public static String getUUID(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString(); 
        String uuidStr=str.replace("-", "");
        return uuidStr;
      }   
	
	private static final AtomicInteger integer = new AtomicInteger(0);
	public static long getid() {
	  long time = System.currentTimeMillis();
	  StringBuilder str = new StringBuilder(20);
	  str.append(time);
	  int intValue = integer.getAndIncrement();
	  if (integer.get() >= 10000) {
	   integer.set(0);
	  }
	  if (intValue < 10) {
	   str.append("000");
	  } else if (intValue < 100) {
	   str.append("00");
	  } else if (intValue < 1000) {
	   str.append("0");
	  }
	  str.append(intValue);
	  return Long.parseLong(str.toString());
	 }

	
	}

