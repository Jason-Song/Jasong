package com.good.utils;

import java.util.List;

public class StringUtil {

    public static boolean isBlank(String val) {
        return (val == null || "".equals(val.trim()) || "null".equals(val.trim().toLowerCase()));
    }

    public static boolean isNotBlank(String val) {
        return !isBlank(val);
    }

    public static boolean isEmpty(CharSequence cs) {
        return (cs == null) || (cs.length() == 0);
    }

    /**
     * null -> ""
     * notNull -> trim()
     * @param val
     * @return
     */
    public static String nullToEmpty(String val) {
        return isBlank(val) ? "" : val.trim();
    }

    /**
     * 字符串若为空则转换成指定字符
     * @param val
     * @param tran
     * @return
     */
    public static String tranVal(String val, String tran) {
        return isBlank(val) ? tranVal(tran, "") : nullToEmpty(val);
    }

    public static boolean isNumeric(CharSequence cs) {
        if (isEmpty(cs)) {
            return false;
        }
        int sz = cs.length();
        for (int i = 0; i < sz; i++) {
            if (!Character.isDigit(cs.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static String leftFillZero(String accno, int strLen) {
        if (accno == null) {
            return null;
        }
        int tempLen = accno.length();
        StringBuffer retVal = new StringBuffer(accno);
        if (tempLen == 0) {
            for (int i = 0; i < strLen; i++) {
                retVal.insert(0, "0");
            }
            return retVal.toString();
        }
        if (accno.charAt(0) == '-') {
            if (tempLen > strLen) {
                return accno;
            }
            for (int i = 0; i <= strLen - tempLen; i++)
                retVal.insert(1, "0");
        } else {
            if (tempLen >= strLen) {
                return accno;
            }
            for (int i = 0; i < strLen - tempLen; i++) {
                retVal.insert(0, "0");
            }
        }
        return retVal.toString();
    }

    public static String utf8ToRTFUnicode(String inStr) {
        char[] myBuffer = inStr.toCharArray();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < inStr.length(); i++) {
            Character.UnicodeBlock ub = Character.UnicodeBlock.of(myBuffer[i]);
            if (ub == Character.UnicodeBlock.BASIC_LATIN) {
                sb.append(myBuffer[i]);
            } else if (ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
                int j = myBuffer[i] - 65248;
                sb.append((char) j);
            } else {
                short s = (short) myBuffer[i];
                String hexS = Integer.toString(s);
                String unicode = "\\u" + hexS + " ? ";
                sb.append(unicode.toLowerCase());
            }
        }
        return sb.toString();
    }

    public static String listToString(List<String> list, String br) {
        StringBuilder retSb = new StringBuilder("");
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                if (isNotBlank(list.get(i))) {
                    retSb.append(list.get(i));
                    retSb.append(br);
                }
            }
        }
        String ret = retSb.toString();
        ret = "".equals(ret) ? "" : ret.substring(0, ret.length() - br.length());
        return ret;
    }

    public static String listToStringForHyperlinks(List<String> list) {
        StringBuilder retSb = new StringBuilder("");
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                if (isNotBlank(list.get(i))) {
                    retSb.append("<a href='");
                    retSb.append(list.get(i));
                    retSb.append("' target='_blank' title='");
                    retSb.append(list.get(i));
                    retSb.append("'>");
                    retSb.append(list.get(i));
                    retSb.append("</a><br/>");
                }
            }
        }
        String ret = retSb.toString();
        ret = "".equals(ret) ? "" : ret.substring(0, ret.length() - 5);
        return ret;
    }

}
