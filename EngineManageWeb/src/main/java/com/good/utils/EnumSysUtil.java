package com.good.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.good.sys.bean.SysEnumPo;
import com.good.sys.service.EnumService;

public class EnumSysUtil {

    private EnumService enumService;

    public EnumSysUtil(EnumService enumService) {
        this.enumService = enumService;
    }

    public Map<String, String> enumParams(String enumName) {
        Map<String, String> mapEnum = new HashMap<String, String>();
        List<SysEnumPo> listEnum = enumService.getEnum(enumName);
        if (listEnum != null && listEnum.size() > 0) {
            for (SysEnumPo po : listEnum) {
                if (po != null && StringUtil.isNotBlank(po.getItemId()) && StringUtil.isNotBlank(po.getItemValue())) {
                    mapEnum.put(po.getItemId(), po.getItemValue());
                }
            }
        }
        return mapEnum;
    }

    public static String itemValue(Map<String, String> mapEnum, String itemId) {
        String itemValue = "";
        if (mapEnum != null && mapEnum.size() > 0 && StringUtil.isNotBlank(itemId) && StringUtil.isNotBlank(mapEnum.get(itemId))) {
            itemValue = mapEnum.get(itemId);
        }
        return itemValue;
    }

    public static String itemValue(Map<Integer, String> mapEnum, Integer itemId) {
        String itemValue = "";
        if (mapEnum != null && mapEnum.size() > 0 && itemId != null && mapEnum.get(itemId) != null) {
            itemValue = mapEnum.get(itemId);
        }
        return itemValue;
    }

}
