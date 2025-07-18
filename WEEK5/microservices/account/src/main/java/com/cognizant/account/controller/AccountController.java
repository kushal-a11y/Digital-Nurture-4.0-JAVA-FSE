package com.cognizant.account.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.account.entity.Account;
import com.cognizant.account.service.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/accounts")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @PostMapping
    public void addAccount(@RequestBody Account account) {
        accountService.addAccount(account);
    }

    @GetMapping("/{number}")
    public Account getByNumber(@PathVariable String number) throws Exception {
        return accountService.getByNumber(number);
    }

}
