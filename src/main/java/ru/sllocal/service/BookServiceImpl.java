package ru.sllocal.service;

import org.springframework.stereotype.Service;
import ru.sllocal.dao.BookDao;
import ru.sllocal.model.Book;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void readBook(int id) {
        this.bookDao.readBook(id);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }

    @Override
    @Transactional
    public List<Book> listBooks(Integer offset, Integer maxResults) {
        return this.bookDao.listBooks(offset, maxResults);
    }

    @Override
    @Transactional
    public List<Book> listBooksWithQuery(Integer offset, Integer maxResults, String queryString) {
        return this.bookDao.listBooksWithQuery(offset, maxResults, queryString);
    }

    @Override
    @Transactional
    public Long count() {
        return bookDao.count();
    }


}

