package com.good.utils;

import java.beans.PropertyDescriptor;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.web.util.HtmlUtils;

public class BeanEncodeUtil {

    public static int ENCODE_HTML = 1;
    public static int ENCODE_RTF = 2;

    public static void convert(Object obj, int encodeType, String[] excludes) {
        if (obj == null) {
            return;
        }
        if ((encodeType != ENCODE_HTML) && (encodeType != ENCODE_RTF)) {
            return;
        }
        if ((obj.getClass().equals(ArrayList.class)) || (obj.getClass().equals(List.class)) || (obj.getClass().equals(AbstractList.class)) || (obj.getClass().equals(LinkedList.class)) || (obj.getClass().equals(Vector.class))) {
            List lstObjs = (List) obj;
            for (Iterator localIterator = lstObjs.iterator(); localIterator.hasNext();) {
                Object des = localIterator.next();
                convert(des, encodeType, excludes);
            }
        } else {
            BeanWrapperImpl beanWrap = new BeanWrapperImpl(obj);
            for (PropertyDescriptor pd : beanWrap.getPropertyDescriptors())
                if ((pd.getPropertyType().equals(String.class)) && (!isInArrays(excludes, pd.getName()))) {
                    String src = (String) beanWrap.getPropertyValue(pd.getName());
                    if ((beanWrap.isWritableProperty(pd.getName())) && (!StringUtil.isEmpty(src)))
                        if (encodeType == ENCODE_HTML)
                            beanWrap.setPropertyValue(pd.getName(), HtmlUtils.htmlEscape(src));
                        else if (encodeType == ENCODE_RTF)
                            beanWrap.setPropertyValue(pd.getName(), StringUtil.utf8ToRTFUnicode(src.replace("\\", "\\\\").replace("{", "\\{").replace("}", "\\}").replace("\r", "").replace("\n", "\\par")));
                }
        }
    }

    public static String convert(String str, int encodeType) {
        if (StringUtil.isEmpty(str)) {
            return "";
        }
        if ((encodeType != ENCODE_HTML) && (encodeType != ENCODE_RTF)) {
            return str;
        }
        if (encodeType == ENCODE_HTML)
            return HtmlUtils.htmlEscape(str);
        if (encodeType == ENCODE_RTF) {
            return StringUtil.utf8ToRTFUnicode(str.replace("\\", "\\\\").replace("{", "\\{").replace("}", "\\}").replace("\r", "").replace("\n", "\\par"));
        }
        return str;
    }

    private static boolean isInArrays(String[] strs, String str) {
        if ((strs == null) || (strs.length == 0)) {
            return false;
        }
        String[] arrayOfString = strs;
        int j = strs.length;
        for (int i = 0; i < j; i++) {
            String s = arrayOfString[i];
            if ((s != null) && (s.equals(str))) {
                return true;
            }
        }
        return false;
    }

    public static byte[] copyArray(byte[] data, int offset, int len) throws IndexOutOfBoundsException {
        if ((data.length < len) || (data.length - 1 < offset)) {
            throw new IndexOutOfBoundsException("Util.copyArray out of bound[data.len=" + data.length + ",offset=" + offset + ",need len=" + len + "]");
        }
        if (data.length < offset + len) {
            len = data.length - offset;
        }
        byte[] obuf = new byte[len];
        int idx = 0;
        for (int i = offset; i < offset + len; i++) {
            obuf[idx] = data[i];
            idx++;
        }
        return obuf;
    }

}