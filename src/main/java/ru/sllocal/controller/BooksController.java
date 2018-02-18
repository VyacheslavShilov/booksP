package ru.sllocal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.sllocal.model.Book;
import ru.sllocal.service.BookService;

@Controller
public class BooksController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {

        this.bookService = bookService;
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(Model model, Integer offset, Integer maxResults){
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", bookService.listBooks(offset, maxResults));
        model.addAttribute("count", bookService.count());
        model.addAttribute("offset", offset);

        return "books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book){
        if(book.getId() == 0){
            this.bookService.addBook(book);
        }else {
            this.bookService.updateBook(book);
        }
        return "redirect:/books";
    }

    @RequestMapping(value = "/read/{id}")
    public String readBook(@PathVariable("id") int id){
        this.bookService.readBook(id);
        return "redirect:/books";
    }

   @RequestMapping(value = "search", method = RequestMethod.POST)
   public String search(@RequestParam("searchTitle") String searchBookTitle, Model model, Integer offset, Integer maxResults){
       model.addAttribute("book", new Book());
       model.addAttribute("listBooks", bookService.listBooksWithQuery(offset, maxResults, searchBookTitle));
       model.addAttribute("count", bookService.count());
       model.addAttribute("offset", offset);

       return "books";
   }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id){
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model, Integer offset, Integer maxResults){
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("listBooks", this.bookService.listBooks(offset, maxResults));
        model.addAttribute("count", bookService.count());
        model.addAttribute("offset", offset);
        return "books";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model){
        model.addAttribute("book", this.bookService.getBookById(id));

        return "bookdata";
    }
}
