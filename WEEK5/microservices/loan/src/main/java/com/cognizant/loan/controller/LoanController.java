package com.cognizant.loan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.loan.entity.Loan;
import com.cognizant.loan.service.LoanService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("/loans")
public class LoanController {
    @Autowired
    private LoanService loanService;

    @PostMapping
    public void addLoan(@RequestBody Loan loan) {
        loanService.addLoan(loan);
    }

    @GetMapping("/{number}")
    public Loan getMethodName(@PathVariable String number) throws Exception {
        return loanService.getByNumber(number);
    }

}
