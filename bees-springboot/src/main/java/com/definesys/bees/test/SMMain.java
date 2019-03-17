package com.definesys.bees.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SMMain {
    public static void main(String[] args) {
        String str="SM0003";

        if(isSmMatcher(str)){
            System.out.println(str);
        }else{
            System.out.println("不匹配");
        }
    }

    public static Boolean isSmMatcher(String str){
        String regEx="^SM\\d{4}$";
        Pattern pattern=Pattern.compile(regEx);
        Matcher matcher=pattern.matcher(str);
        return matcher.matches();
    }
}


