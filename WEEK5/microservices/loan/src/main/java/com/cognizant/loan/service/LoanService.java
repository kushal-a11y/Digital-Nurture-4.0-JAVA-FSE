package com.cognizant.loan.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.loan.entity.Loan;
import com.cognizant.loan.repository.LoanRepository;

@Service
public class LoanService {
    @Autowired
    private LoanRepository loanRepository;

    public void addLoan(Loan loan) {
        loanRepository.save(loan);
    }

    public Loan getByNumber(String number) throws Exception {
        Optional<Loan> loan = loanRepository.findByNumber(number);
        if (!loan.isPresent())
            throw new Exception("Loan does not exist");
        return loan.get();
    }
}
