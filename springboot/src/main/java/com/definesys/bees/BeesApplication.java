package com.definesys.bees;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ComponentScan(basePackages = {"com.definesys.mpaas","com.definesys.bees"})
@EnableCaching//开启缓存
@EnableScheduling//开启定时调度
public class BeesApplication {

	public static void main(String[] args) {
		SpringApplication.run(BeesApplication.class, args);
	}

}

