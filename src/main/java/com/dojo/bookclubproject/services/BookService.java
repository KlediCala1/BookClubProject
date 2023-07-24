package com.dojo.bookclubproject.services;

import com.dojo.bookclubproject.models.Book;
import com.dojo.bookclubproject.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    @Autowired
    BookRepository bookRepository;

    public List<Book> allBooks() {
        return bookRepository.findAll();
    }

    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }

    public Book saveBook(Book book) {
        return bookRepository.save(book);
    }

    public Book findById(Long id) {
        Optional<Book> result = bookRepository.findById(id);
        if (result.isPresent()) {
            return result.get();
        }
        return null;
    }
}