package com.definesys.bees.test.HotDeploy;

import java.io.File;

public class HotDeployDemo {
    private static final String CLASS_NAME="com.definesys.bees.test.HotDeploy.IHelloImpl";
//    private static final String FILE_NAME="C:\\Users\\98077\\Desktop\\新技术\\Bees\\springBoot\\bees\\target\\classes\\"
//            +CLASS_NAME.replace("\\.","\\")+".class";
    private static final String FILE_NAME="C:\\Users\\98077\\Desktop\\新技术\\Bees\\springBoot\\bees\\target\\classes\\com\\definesys\\bees\\test\\HotDeploy\\IHelloImpl.class";
    private static volatile IHelloService helloService;

    public static IHelloService getHelloService(){
        if(helloService !=null){
            return helloService;
        }
        synchronized (HotDeployDemo.class){
            if(helloService==null){
                helloService=createHelloService();
            }
            return helloService;
        }
    }

    private static IHelloService createHelloService(){
        try {
            MyClassLoader c1=new MyClassLoader();
            Class<?> cls=c1.loadClass(CLASS_NAME);
            if(cls!=null){
                System.out.println("bbbbbbbbbbbbbbbbbbbbbb");
                return (IHelloService)cls.newInstance();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void client(){
        Thread t=new Thread(){
            @Override
            public void run(){
                try {
                    while (true) {
                        IHelloService helloService = getHelloService();
                        helloService.sayHello();
                        Thread.sleep(1000);
                    }
                }catch (InterruptedException e){

                }
            }
        };
        t.start();
    }

    public static void monitor(){

        Thread t=new Thread(){
            private long lastModified=new File(FILE_NAME).lastModified();
            @Override
            public void run(){
                try{
                    while (true){
                        Thread.sleep(100);
                        long now=new File(FILE_NAME).lastModified();
                        if(now!=lastModified){
                            System.out.println("--------------------------");
                            lastModified=now;
                            reloadHelloService();
                        }
                    }
                }catch (InterruptedException e){

                }
            }
        };
        t.start();
    }

    public static void reloadHelloService(){
        helloService=createHelloService();
    }


    public static void main(String[] args) {
        monitor();
       client();
    }

}
