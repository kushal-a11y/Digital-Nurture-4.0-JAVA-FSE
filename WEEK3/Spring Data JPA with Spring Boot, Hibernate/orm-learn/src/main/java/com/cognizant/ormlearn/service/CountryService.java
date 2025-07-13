package com.cognizant.ormlearn.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.ormlearn.model.Country;
import com.cognizant.ormlearn.repository.CountryRepository;
import com.cognizant.ormlearn.service.exception.CountryNotFoundException;

import jakarta.transaction.Transactional;

@Service
public class CountryService {
    @Autowired
    private CountryRepository countryRepository;

    @Transactional
    public List<Country> getAllCountries(){
        return countryRepository.findAll();
    }
    @Transactional
    public Country findCountryByCode(String code) throws CountryNotFoundException{
        Optional<Country> country = countryRepository.findById(code);
        if(!country.isPresent()){
            throw new CountryNotFoundException("Country not found for code: "+code);
        }
        return country.get();
    }
    @Transactional
    public void addCountry(Country country){
        countryRepository.save(country);
    }
    @Transactional
    public void updateCountry(String code, String name)throws CountryNotFoundException{
        Country existing = findCountryByCode(code);
        existing.setName(name);
        countryRepository.save(existing);
    }
    @Transactional
    public void deleteCountry(String code){
        countryRepository.deleteById(code);
    }
    @Transactional
    public List<Country> searchCountriesByName(String name){
        return countryRepository.findByNameContainingIgnoreCase(name);
    }
}
