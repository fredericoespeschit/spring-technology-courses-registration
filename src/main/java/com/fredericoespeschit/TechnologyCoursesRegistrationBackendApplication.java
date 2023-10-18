package com.fredericoespeschit;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.fredericoespeschit.model.Course;
import com.fredericoespeschit.repository.CourseRepository;

@SpringBootApplication
public class TechnologyCoursesRegistrationBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(TechnologyCoursesRegistrationBackendApplication.class, args);
	}


  @Bean
  CommandLineRunner initDatabase(CourseRepository courseRepository){
    return args -> {
			courseRepository.deleteAll();

			Course c = new Course();
			c.setName("Angular");
			c.setCategory("Front-end");

			courseRepository.save(c);
    };
  }

}
