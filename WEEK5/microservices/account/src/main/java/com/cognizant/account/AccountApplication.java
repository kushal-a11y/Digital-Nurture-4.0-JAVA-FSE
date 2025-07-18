package com.cognizant.account;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class AccountApplication {

	public static void main(String[] args) {
		SpringApplication.run(AccountApplication.class, args);
	}
	/*
	 * Single entry point for all clients(micro services)
	 * centralized all routings
	 * logging cross cutting concerns
	 * Authentication -> While invoking make sure the person accessing
	 * should be authentic or valid
	 */
}
