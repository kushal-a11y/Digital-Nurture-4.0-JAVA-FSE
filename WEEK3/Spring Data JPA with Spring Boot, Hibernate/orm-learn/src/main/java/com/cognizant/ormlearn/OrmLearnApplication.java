package com.cognizant.ormlearn;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;


import com.cognizant.ormlearn.model.Country;
import com.cognizant.ormlearn.service.CountryService;
import com.cognizant.ormlearn.service.exception.CountryNotFoundException;

@SpringBootApplication
public class OrmLearnApplication{
	private static final Logger LOGGER = LoggerFactory.getLogger(OrmLearnApplication.class);

	@Autowired
	private static CountryService countryService;

	public static void main(String[] args) {
		
		ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
		countryService = context.getBean(CountryService.class);
		testGetAllCountries();
		testFindCountryByCode();
		testDeleteCountry();
		testAddCountry();   
		testUpdateCountry();
	}

	private static void testGetAllCountries() {
		LOGGER.info("Start ");
    	List<Country> countries = countryService.getAllCountries();
    	// countries.forEach(c -> System.out.println(c.getCode() + " - " + c.getName()));
		LOGGER.debug("countries={}", countries);
		LOGGER.info("End");
	}
	private static void testFindCountryByCode() {
    	LOGGER.info("Start");
 	   	try {
 	   	    Country country = countryService.findCountryByCode("IN");
 	   	    LOGGER.debug("Country: {}", country);
 	   	} catch (CountryNotFoundException e) {
 	   	    LOGGER.error("Error: {}", e.getMessage());
 	   	}
    	LOGGER.info("End");
	}
	private static void testAddCountry() {
		LOGGER.info("Start");
		Country country = new Country();
		country.setCode("JP");
		country.setName("Japan");
	
		countryService.addCountry(country);
	
		try {
			Country retrieved = countryService.findCountryByCode("JP");
			LOGGER.debug("Added Country: {}", retrieved);
		} catch (CountryNotFoundException e) {
			LOGGER.error("Error: {}", e.getMessage());
		}
	
		LOGGER.info("End");
	}
	private static void testUpdateCountry() {
		LOGGER.info("Start");
		try {
			countryService.updateCountry("JP", "Nippon");
			Country updated = countryService.findCountryByCode("JP");
			LOGGER.debug("Updated Country: {}", updated);
		} catch (CountryNotFoundException e) {
			LOGGER.error("Error: {}", e.getMessage());
		}
		LOGGER.info("End");
	}
	private static void testDeleteCountry() {
		LOGGER.info("Start");
		countryService.deleteCountry("JP");
	
		try {
			countryService.findCountryByCode("JP");
		} catch (CountryNotFoundException e) {
			LOGGER.debug("Country successfully deleted. Error: {}", e.getMessage());
		}
	
		LOGGER.info("End");
	}
	
}
