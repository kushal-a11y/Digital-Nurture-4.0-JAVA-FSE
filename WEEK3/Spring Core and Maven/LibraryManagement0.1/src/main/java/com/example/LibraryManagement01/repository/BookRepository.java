package com.example.LibraryManagement01.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.LibraryManagement01.entity.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
}

