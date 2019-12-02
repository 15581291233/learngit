package com.student.controller;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class CallableImpl implements Callable<String> {

    public CallableImpl(String acceptStr) {
        this.acceptStr = acceptStr;
    }

    private String acceptStr;

    @Override
    public String call() throws Exception {
        Thread.sleep(2000);
        return this.acceptStr + " append some chars and return it!";
    }

    // 定长线程池，可控制线程最大并发数，超出的线程会在队列中等待，当某个线程发生错误结束时会补充新的线程
    static ExecutorService fixedExecutor = Executors.newFixedThreadPool(3);
    // 可缓存线程池，当线程池容量超过任务书，可自动回收空闲线程，新增任务时可自动添加新线程，线程池容量不限制
    static ExecutorService cachedExecutor = Executors.newCachedThreadPool();
    // 定长线程池，可执行周期性任务
    static ScheduledExecutorService scheduledExecutor = Executors.newScheduledThreadPool(3);
    // 单线程线程池，线程异常结束时会创建一个新的线程，保证所有任务指定顺序执行
    static ExecutorService singleExecutor = Executors.newSingleThreadExecutor();
    // 单线程线程池，可执行周期性任务
    static ScheduledExecutorService singleScheduledExecutor = Executors.newSingleThreadScheduledExecutor();
    // 任务窃取线程池，不保证执行顺序，适合任务耗时差异较大
    static ExecutorService workStealingExecutor = Executors.newWorkStealingPool();

    static ThreadLocal<Integer> THREAD_LOCAL_NUM = new ThreadLocal<Integer>() {
        @Override
        protected Integer initialValue() {
            return 0;
        }
    };

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        // Callable<String> callable = new CallableImpl("my callable test!");
        // FutureTask<String> task = new FutureTask<>(callable);
        // long beginTime = System.currentTimeMillis();
        // new Thread(task).start();
        // String result = task.get();
        // long endTime = System.currentTimeMillis();
        // System.out.println("hello : " + result);
        // System.out.println("cast : " + (endTime - beginTime) / 1000 + "
        // second!");
        // fixedExecutor();
        // cachedExecutor();
        // scheduledExecutor();
        // singleExecutor();
        // singleScheduledExecutor();
        // workStealingExecutor();
        // System.out.println(Runtime.getRuntime().availableProcessors());
        for (int i = 0; i < 3; i++) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    for (int j = 0; j < args.length; j++) {
                        Integer n = THREAD_LOCAL_NUM.get();
                        n++;
                        THREAD_LOCAL_NUM.set(n);
                        System.out.println(Thread.currentThread().getName() + ": ThreadLocal num=" + n);
                    }
                }
            }).start();
        }
    }

    /**
     * 定长线程池,线程错误结束时，会自动补充新的线程
     */
    public static void fixedExecutor() {
        for (int i = 0; i < 6; i++) {
            final int index = i;
            fixedExecutor.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        Thread.sleep(2000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName() + "" + index);
                }
            });
        }
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("3秒后...");
        fixedExecutor.shutdown();
    }

    /**
     * 可缓存线程池,如果线程池的容量超过了任务数，自动回收空闲线程，任务增加时可以自动添加新线程，线程池的容量不限制
     */
    public static void cachedExecutor() {
        for (int i = 0; i < 200; i++) {
            int index = i;
            cachedExecutor.execute(new Runnable() {
                @Override
                public void run() {
                    System.out.println(Thread.currentThread().getName() + "index：" + index);
                }
            });
        }
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("5秒后...");
        cachedExecutor.shutdown();
    }

    /**
     * 定长线程池，可执行周期性任务
     */
    public static void scheduledExecutor() {
        for (int i = 0; i < 3; i++) {
            final int index = i;
            // scheduleWithFixedDelay 固定的延迟时间执行任务； scheduleAtFixedRate 固定的频率执行任务
            scheduledExecutor.scheduleWithFixedDelay(new Runnable() {
                @Override
                public void run() {
                    System.out.println(Thread.currentThread().getName() + "index：" + index);
                }
            }, 0, 3, TimeUnit.SECONDS);
        }
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("4秒后...");
        scheduledExecutor.shutdown();
    }

    /**
     * 单线程的线程池，线程异常结束，会创建一个新的线程，能确保任务按提交顺序执行
     */
    public static void singleExecutor() {
        for (int i = 0; i < 5; i++) {
            final int index = i;
            singleExecutor.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName() + "index: " + index);
                }
            });
        }
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("3秒后...");
        singleExecutor.shutdown();
    }

    /**
     * 单线程线程池，可执行周期性任务
     */
    public static void singleScheduledExecutor() {
        for (int i = 0; i < 3; i++) {
            final int index = i;
            // scheduleWithFixedDelay 固定的延迟时间执行任务； scheduleAtFixedRate 固定的频率执行任务
            singleScheduledExecutor.scheduleAtFixedRate(new Runnable() {
                @Override
                public void run() {
                    System.out.println(Thread.currentThread().getName() + "index: " + index);
                }
            }, 3, 3, TimeUnit.SECONDS);
        }
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("4秒后...");
        singleScheduledExecutor.shutdown();
    }

    /**
     * 任务窃取线程池，不保证执行顺序，适合任务耗时差异较大
     */
    public static void workStealingExecutor() {
        for (int i = 0; i < 10; i++) {
            final int index = i;
            workStealingExecutor.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println(Thread.currentThread().getName() + "index: " + index);
                }
            });
        }
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("4秒后...");
        // workStealingExecutor.shutdown();
    }

}
