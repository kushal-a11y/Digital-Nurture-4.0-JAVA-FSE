package com.example.LibraryManagement01.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.LibraryManagement01.entity.Book;
import com.example.LibraryManagement01.repository.BookRepository;

@RestController
@RequestMapping("/books")
public class BookController {

  @Autowired
  private BookRepository bookRepo;

  @PostMapping
  public Book createBook(@RequestBody Book book) {
    return bookRepo.save(book);
  }

  @GetMapping
  public List<Book> getAllBooks() {
    return bookRepo.findAll();
  }

  @GetMapping("/{id}")
  public ResponseEntity<Book> getBookById(@PathVariable Long id) {
    return bookRepo.findById(id)
      .map(ResponseEntity::ok)
      .orElse(ResponseEntity.notFound().build());
  }

  @DeleteMapping("/{id}")
  public void deleteBook(@PathVariable Long id) {
    bookRepo.deleteById(id);
  }
}
