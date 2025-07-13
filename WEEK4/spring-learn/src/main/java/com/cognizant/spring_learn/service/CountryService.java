package com.cognizant.spring_learn.service;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.cognizant.spring_learn.Country;

@Service
public class CountryService {
        public Country getCountryByCode(String code){
            ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
            List<Country> countrylist = (List<Country>)context.getBean("countryList");
            // ((ClassPathXmlApplicationContext)context).close();
            return countrylist.stream()
                   .filter(c -> c.getCode().equalsIgnoreCase(code))
                   .findFirst()
                   .orElse(null);
    }
}
