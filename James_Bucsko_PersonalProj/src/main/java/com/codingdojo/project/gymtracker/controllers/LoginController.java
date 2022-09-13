package com.codingdojo.project.gymtracker.controllers;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.project.gymtracker.models.GymDay;
import com.codingdojo.project.gymtracker.models.LoginUser;
import com.codingdojo.project.gymtracker.models.User;
import com.codingdojo.project.gymtracker.services.GymDayService;
import com.codingdojo.project.gymtracker.services.UserService;

@Controller
public class LoginController {
    
    // Add once service is implemented:
     @Autowired
     private UserService userServ;
     
     @Autowired
     private GymDayService gServ;
    
    @GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	User user = userServ.register(newUser, result);
    	
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
         User user = userServ.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
    	if(session.getAttribute("userId")==null)
    	{
    		return "redirect:/logout";
    		}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.findById(userId));
    	model.addAttribute("gymdays", gServ.allGymDays());
    	return "home.jsp";
    	}
    
    @RequestMapping("/workout")
    public String newWorkout(@ModelAttribute("gymday")GymDay gymday, Model model, HttpSession session) {
    	User user = userServ.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	return "createworkout.jsp";
    }
    
    @PostMapping("/create/workout")
    public String createWorkout(@Valid @ModelAttribute("gymday")GymDay gymday, BindingResult result) {
    	if(result.hasErrors()) {
    		return "createworkout.jsp";
    	}
    	gServ.create(gymday);
    	return"redirect:/home";
    }
    
    @GetMapping("/workout/{id}")
    public String showWorkout(@PathVariable("id")Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/logout";
    	}
    	GymDay gymday = gServ.findById(id);
    	model.addAttribute("gymday", gymday);
    	model.addAttribute("user",userServ.findById((Long)session.getAttribute("userId")));
    	return "showgymday.jsp";
    }
    
    
    @RequestMapping("/gymday/{id}/delete")
    public String deleteGymDay(@PathVariable("id") Long id) {
    	gServ.delete(id);
    	return "redirect:/home";
    }
    
    @RequestMapping("/gymday/{id}/edit")
    public String editGymDay(@PathVariable("id")Long id, Model model) {
    	GymDay gymday = gServ.findById(id);
    	model.addAttribute("gymday", gymday);
    	return "editgymday.jsp";
    }
    
    @PutMapping("/gymday/{id}/edit")
    public String update(@Valid @ModelAttribute("gymday") GymDay gymday, BindingResult result) {
    	if(result.hasErrors()) {
    		return "editgymday.jsp";
    	}
    	gServ.update(gymday);
    	return "redirect:/home";
    }
    
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.setAttribute("userId", null);
   return "redirect:/";
    }
    	
    }
    
