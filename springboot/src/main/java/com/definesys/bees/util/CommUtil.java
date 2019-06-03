package com.definesys.bees.util;

import com.definesys.bees.pojo.SystemConfig;

import java.util.UUID;

public class CommUtil {
    /**
     * 返回64位uuid
     * @return
     */
    public static String get64Uuid(){
        String uuid= UUID.randomUUID().toString()+UUID.randomUUID().toString();
        return uuid.replace("-","");
    }

    /**
     * 返回32位uuid
     * @return
     */
    public static String get32Uuid(){
        String uuid= UUID.randomUUID().toString();
        return uuid.replace("-","");
    }

    public static void main(String[] args) {
        System.out.println(get64Uuid());
    }
}

