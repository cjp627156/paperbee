package com.definesys.bees.test;

public class CounterThread implements Runnable{
   static CounterLocked counterLocked=new CounterLocked();

    @Override
    public void run(){
        for(int i=0;i<1000;i++){
            counterLocked.add();
        }
    }

    public static void main(String[] args)throws InterruptedException {
        int num=10000;

        Thread[] threads=new Thread[num];
        for(int i=0;i<num;i++){
            threads[i]=new Thread(new CounterThread());
            threads[i].start();
            threads[i].join();
        }
//        for(int i=0;i<num;i++){
//            threads[i].join();
//        }
        System.out.println(counterLocked.getCount());
    }

}
