package com.definesys.bees.test;

import java.util.HashMap;

public class RequestMap extends HashMap {

    public <T>T getRequest(T obj){
    return obj;
//        if(obj==null){
//            return null;
//        }
//        if(obj instanceof String){
//            return (T)obj.toString();
//        }else if(obj instanceof Integer){
//            return (T)obj ;
//        }
//        return (T)obj;
    }

    public static void main(String[] args) {
        RequestMap requestMap=new RequestMap();

       String name= requestMap.getRequest("name");
        int age=requestMap.getRequest(1 );

        System.out.println(name+age);
    }



}
