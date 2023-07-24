package com.dojo.bookclubproject.controllers;
import com.dojo.bookclubproject.models.Book;
import com.dojo.bookclubproject.models.Login;
import com.dojo.bookclubproject.models.User;
import com.dojo.bookclubproject.services.BookService;
import com.dojo.bookclubproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;


@Controller
public class MainController {

    @Autowired
    UserService userService;
    @Autowired
    BookService bookService;

    @GetMapping("/")
    public String index(@ModelAttribute("newUser") User user,
                        @ModelAttribute("newLogin") Login loginUser,
                        HttpSession session) {
        session.setAttribute("loggedInUserID", null);
        return "index";
    }

    //REGISTERING THE USER
    @PostMapping("/register")
    public String registerIndex(@Valid @ModelAttribute("newUser") User user,
                                BindingResult result, Model model, HttpSession session) {
        userService.register(user, result);

        if (result.hasErrors()) {
            model.addAttribute("newLogin", new Login());
            return "index";
        }
        session.setAttribute("loggedInUserID", user.getId());

        return "redirect:/books";
    }

    //LOGGING IN THE USER
    @PostMapping("/login")
    public String loginIndex(@Valid @ModelAttribute("newLogin") Login loginUser,
                             BindingResult result, Model model, HttpSession session) {
        User user = userService.login(loginUser, result);

        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index";
        }

        session.setAttribute("loggedInUserID", user.getId());

        return "redirect:/books";
    }

    @GetMapping("/books")
    public String dashboard(Model model, HttpSession session, @ModelAttribute("newBook") Book book) {
        Long id = (Long) session.getAttribute("loggedInUserID");
        User user = userService.findUser(id);
        model.addAttribute("user", user);

        List<Book> books = bookService.allBooks();
        model.addAttribute("allBooks", books);

        return "dashboard";

    }

    @PostMapping("/books/new")
    public String newBook(@Valid @ModelAttribute("newBook") Book book, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            System.out.println(result.getAllErrors().toString());
            return "dashboard";
        }
        Long id = (Long) session.getAttribute("loggedInUserID");
        User user = userService.findUser(id);

        book.setUser(user);
        bookService.saveBook(book);

        return "redirect:/books";
    }

    @GetMapping("/books/{id}")
    public String viewBook(@PathVariable Long id, Model model, HttpSession session){
        Book book = bookService.findById(id);
        model.addAttribute("book", book);
        Long userID = (Long) session.getAttribute("loggedInUserID");
//        User user = userService.findUser(userID);
//        model.addAttribute("user", user);

        if(book.getUser().getId() == userID) {
            return "edit";
        }else {
            return "details";
        }
    }
    @PutMapping("/books/{id}")
    public String editPut(@Valid @ModelAttribute("book") Book book, Model model, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            System.out.println(result.getAllErrors().toString());
            model.addAttribute("book", book);
            return "edit";
        }

        Long userID = (Long) session.getAttribute("loggedInUserID");
        User user = userService.findUser(userID);
        book.setUser(user);
        bookService.saveBook(book);


        return "redirect:/books";
    }


    @DeleteMapping("/books/{id}")
    public String delete(@PathVariable("id") Long id){
        bookService.deleteBook(id);
        return "redirect:/books";
    }
}