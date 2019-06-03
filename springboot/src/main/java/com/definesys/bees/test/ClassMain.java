package com.definesys.bees.test;

import com.definesys.bees.test.impl.IServiceImpl;

import java.io.FileInputStream;
import java.util.Properties;

public class ClassMain {
    public static IServiceImpl createService(){
        try {
            Properties prop = new Properties();
            String fileName = "C:\\Users\\98077\\Desktop\\新技术\\Bees\\springBoot\\bees\\src\\main\\java\\com\\definesys\\bees\\test\\config.properties";
            prop.load(new FileInputStream(fileName));
            String className=prop.getProperty("service");
            Class<?> cls=Class.forName(className);
            return (IServiceImpl) cls.newInstance();
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        IServiceImpl service=createService();
        service.action();
    }
}
