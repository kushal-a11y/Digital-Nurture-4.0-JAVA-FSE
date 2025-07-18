package com.cognizant.loan.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cognizant.loan.entity.Loan;

@Repository
public interface LoanRepository extends JpaRepository<Loan, Long> {
    Optional<Loan> findByNumber(String number);
}
