package com.definesys.bees;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.definesys.mpaas","com.definesys.bees"})
public class BeesApplication {

	public static void main(String[] args) {
		SpringApplication.run(BeesApplication.class, args);
	}

}
