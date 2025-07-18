package com.cognizant.loan.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

// { number: "H00987987972342", type: "car", loan: 400000, emi: 3258, tenure: 
// 18 }
@Entity
@Data
public class Loan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String number;
    private String type;
    private float loan;
    private float emi;
    private int tenure;

}
