package pers.kerry.paperbee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling//开启定时调度
@EnableCaching//开启缓存
public class PaperbeeApplication {

	public static void main(String[] args) {
		SpringApplication.run(PaperbeeApplication.class, args);
	}

}
