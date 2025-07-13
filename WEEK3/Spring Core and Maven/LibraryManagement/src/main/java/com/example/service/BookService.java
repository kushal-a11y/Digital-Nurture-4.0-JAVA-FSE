package com.example.service;
import com.example.repository.BookRepository;
public class BookService {
    private String name;//constructor injected rpoperty
    private BookRepository bookRepository;//setter property
    // constructor Injection
    public BookService(String name){
        this.name = name;
    }
    // setter Injection
    public void setBookRepository(BookRepository bookRepository){
        this.bookRepository = bookRepository;
    }
    public void addBook(String title){
        System.out.println("Saving book into ["+name+"] library");
        bookRepository.saveBook(title);
    } 

}
