package ru.sllocal.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;
import ru.sllocal.model.Book;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {


    private SessionFactory sessionFactory;


    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);

    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        //По требованию обновленная книга не должна быть прочитана.
        book.setReadAlready(false);
        session.update(book);

    }

    @Override
    public void readBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (book.isReadAlready() == false) {
            book.setReadAlready(true);
            session.update(book);
        }

    }

    @Override
    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));

        if (book != null) {
            session.delete(book);
        }

    }

    @Override
    public Book getBookById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, new Integer(id));


        return book;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks(Integer offset, Integer maxResults) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").setFirstResult(offset != null ? offset : 0)
                .setMaxResults(maxResults != null ? maxResults : 10).list();
        return bookList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooksWithQuery(Integer offset, Integer maxResults, String queryString) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("FROM Book B WHERE B.title like :queryTitle")
                .setString("queryTitle", queryString).setFirstResult(offset != null ? offset : 0)
                .setMaxResults(maxResults != null ? maxResults : 10).list();
        return bookList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public Long count() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").list();
        /*return (Long)sessionFactory.openSession()
                .createCriteria(Book.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();*/
        return new Long(bookList.size());
    }
}

