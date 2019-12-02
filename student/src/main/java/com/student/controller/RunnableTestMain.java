package com.student.controller;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class RunnableTestMain {

    static ExecutorService service = Executors.newFixedThreadPool(3);

    public static void main(String[] args) {
        service.execute(new RunnableTest("Task1"));

        Future<?> future = service.submit(new RunnableTest("Task2"));
        try {
            if (future.get() == null) {
                System.out.println("执行完成");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            System.out.println(e.getCause().getMessage());
        }
    }
}

class RunnableTest implements Runnable {
    private String taskName;

    public RunnableTest(final String taskName) {
        this.taskName = taskName;
    }

    @Override
    public void run() {
        System.out.println("Inside " + taskName);
        // throw new RuntimeException("RuntimeException from inside " +
        // taskName);
    }

}
