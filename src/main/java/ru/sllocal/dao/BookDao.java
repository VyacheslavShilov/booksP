package ru.sllocal.dao;

import ru.sllocal.model.Book;

import java.util.List;

public interface BookDao {
    public void addBook(Book book);

    public void updateBook(Book book);

    public void readBook(int id);

    public void removeBook(int id);

    public Book getBookById(int id);

    public List<Book> listBooks(Integer offset, Integer maxResults);

    public List<Book> listBooksWithQuery(Integer offset, Integer maxResults, String queryString);

    public Long count();
}
