package com.cognizant.account.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cognizant.account.entity.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {
    Optional<Account> findByNumber(String number);
}
