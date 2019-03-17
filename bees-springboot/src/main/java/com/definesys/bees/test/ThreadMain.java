package com.definesys.bees.test;

public class ThreadMain extends Thread {
    public volatile boolean key = false;

    @Override
    public void run() {
//        try {
//            synchronized (this) {
//                while (key) {
//                    wait();
//                }
//            }
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
        System.out.println(1);
    }

    public synchronized void notifyNow() {
        this.key = true;
        notify();

    }


    public static void main(String[] args) throws InterruptedException {
        Thread thread = new ThreadMain();
        thread.start();
        thread.wait(1000);

    }
}
