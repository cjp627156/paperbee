package com.definesys.bees.test;

import com.definesys.bees.test.impl.PojoImpl;
import com.definesys.bees.test.impl.SortImpl;

import java.util.*;

public class TestMain implements SortImpl<Integer>{

    public static void main(String[] args) {
        TestMain testMain=new TestMain();
        testMain.MapTest();
    }

    public  List<Integer> toAsc(List<Integer> list){
         list.sort(new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                return o2.intValue()-o1.intValue();
            }
        });
         return list;
    }

    @Override
    public String toString(){
        String str="";
        if(this instanceof List){
            for(int i=0;i<((List) this).size();i++){
                str=((List) this).get(i).toString()+",";
            }
            return str.substring(0,((List) this).size());
        }
        return getClass().getName() + "@" + Integer.toHexString(hashCode());

    }
    public void sortTest(){
        List<Integer> list=new ArrayList<>(Arrays.asList(new Integer[] {1,3,6,2}));
        TestMain testMain=new TestMain();
        List listSort=testMain.toAsc(list);
        System.out.println(listSort.toString());
    }

    public void MapTest(){

        String objType="";
//        Map<String,Object> map=new HashMap<>();
        Map<String,Object> map=new RequestMap();
        map.put("good","good1");
        map.put("age",1);
//        Set<Map.Entry<String,Object>> mapSet= map.entrySet();
//        for(Map.Entry<String,Object> entry:mapSet){
//
//            if(entry.getValue() instanceof Integer){
//                objType="int";
//            }else if(entry.getValue() instanceof String){
//                objType="String";
//            }
//            System.out.println(entry.getKey()+":"+entry.getValue()+":"+objType);
//        }
    }







}
