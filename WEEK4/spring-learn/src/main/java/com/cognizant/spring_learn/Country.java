package com.cognizant.spring_learn;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.NoArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Country {
    private String code;
    private String name;

    private static final Logger LOGGER = LoggerFactory.getLogger(Country.class);

    {
        LOGGER.debug("Inside Country Constructor.");
    }

    public void setCode(String code) {
        LOGGER.debug("Inside setCode()");
        this.code = code;
    }

    public void setName(String name) {
        LOGGER.debug("Inside setName()");
        this.name = name;
    }

    public String getCode() {
        LOGGER.debug("Inside getCode()");
        return code;
    }

    public String getName() {
        LOGGER.debug("Inside getName()");
        return name;
    }
}
