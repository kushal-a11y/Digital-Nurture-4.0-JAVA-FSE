package com.cognizant.account.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cognizant.account.entity.Account;
import com.cognizant.account.repository.AccountRepository;

import jakarta.transaction.Transactional;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public void addAccount(Account account) {
        accountRepository.save(account);
    }

    @Transactional
    public Account getByNumber(String number) throws Exception {
        Optional<Account> account = accountRepository.findByNumber(number);
        if (!account.isPresent())
            throw new Exception("Account Does not exists");
        return account.get();
    }
}
