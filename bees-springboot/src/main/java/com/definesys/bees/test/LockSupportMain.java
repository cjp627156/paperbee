package com.definesys.bees.test;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.LockSupport;
import java.util.concurrent.locks.ReentrantLock;

public class LockSupportMain {

    public static void main(String[] args) throws InterruptedException{
        Lock lock=new ReentrantLock();
        Thread thread=new Thread(){
          public void run(){
              LockSupport.park();
              System.out.println("exit");
          }
        };
        thread.start();
        Thread.sleep(5000);
        LockSupport.unpark(thread);

    }
}
