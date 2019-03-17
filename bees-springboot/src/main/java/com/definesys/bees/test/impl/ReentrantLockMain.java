package com.definesys.bees.test.impl;

import java.util.ArrayList;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Lock只有是全局变量，才能保证不同线程中获取的是同一个锁
 *  如果定义的是局部变量，每个线程获取的都是各自的锁，无法达到效果
 */
public class ReentrantLockMain {
    private static  int count=0;
    private static final int THREAD_SIZE=200;
    Lock lock=new ReentrantLock();

    public static void main(String[] args) throws InterruptedException {
        final ReentrantLockMain test = new ReentrantLockMain();

        Thread[] threads=new Thread[THREAD_SIZE];
        for(int i=0;i<THREAD_SIZE;i++){
            threads[i]=new Thread(){
                public void run() {
                    test.insert();
                };
            };
            threads[i].start();
        }
        for(int i=0;i<THREAD_SIZE;i++){
            threads[i].join();
        }
        System.out.println(count);
    }

    public void insert() {
//        Lock lock=new ReentrantLock();
       lock.lock();
        try {
            for(int i=0;i<5000;i++) {
                count++;
            }
//            System.out.println(thread.getName()+"得到了锁");
//            for(int i=0;i<500;i++) {
//                arrayList.add(i);
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
          //  System.out.println(thread.getName()+"释放了锁");
           lock.unlock();
        }
    }
}
