package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vn.codegym.model.MyUserDetail;
import vn.codegym.model.Result;
import vn.codegym.model.Role;
import vn.codegym.service.QuizService;
import vn.codegym.service.ResultService;
import vn.codegym.service.UserService;
import org.springframework.security.core.userdetails.User;

import java.io.IOException;
import java.security.Principal;
import java.util.Collection;
import java.util.List;


@Controller
public class HomeController {
    @Autowired
    QuizService qService;
    @Autowired
    UserService userService;

    @Autowired
    ResultService rService;
    @GetMapping("/role")
    public String redirectRole(){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof MyUserDetail){
            MyUserDetail userDetail = (MyUserDetail)principal;
            for (GrantedAuthority role : userDetail.getAuthorities()){
                if (role.getAuthority().equals("ROLE_ADMIN")){
                    return "redirect:/user/list";
                }
            }
        }
        return "redirect:/default";
    }
    @GetMapping("/login")
    public String showLogin(){
        return "login";
    }

    @GetMapping("/default")
    public String show(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails){
            String userName = ((UserDetails) principal).getUsername();
            model.addAttribute("userName",userName);
        }
        List<Result> sList = rService.getTopFive();
        model.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        String newUser = userService.findByNewUser();
        model.addAttribute("total", total);
        model.addAttribute("newUser",newUser);
        model.addAttribute("toan",0);
        model.addAttribute("ly",1);
        model.addAttribute("hoa",2);
        model.addAttribute("anh",3);
        model.addAttribute("bienbao",4);
        return "default-page";
    }

    @GetMapping("/error")
    public String error(){
        return "error";
    }

//    @PostMapping("/uploadImage")
//    public String uploadImage(@RequestParam("imageFile")MultipartFile imageFile, Model model){
//        String returnValue = "trung/view";
//        try {
//            userService.saveImage(imageFile);
//            User user = new User();
//            model.addAttribute("users",user);
//            returnValue = "trung/view";
//        } catch (IOException e) {
//            e.printStackTrace();
//            returnValue = "error";
//        }
//        return returnValue;
//    }
}
