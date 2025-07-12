package com.example.controller;
import com.example.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication{
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BookService service = (BookService)context.getBean("bookService");
        service.addBook("\"Secret History of Mongols\"");
        ((ClassPathXmlApplicationContext) context).close();
    }
}
