package com.udacity.capstoneProject;

import com.udacity.controller.HelloWorldController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CapstoneProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(HelloWorldController.class, args);
	}

}
