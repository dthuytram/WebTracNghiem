package vn.codegym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.codegym.model.*;
import vn.codegym.repository.SignRepository;
import vn.codegym.service.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class MainController {
    private boolean status = true;
    private Date timer = null;
    @Autowired
    Result result;
    @Autowired
    QuizService qService;

    Boolean submitted = false;

    @Autowired
    UserService userService;

    @Autowired
    ResultService rService;

    @Autowired
    ExamService examService;

    @Autowired
    private SignService signService;

    private String objectLink = "";

    private static String UPLOADED_FOLDER = System.getProperty("java.io.tmpdir");

//    public static String uploadDirectory = System.getProperty("sign.dir") + "/src/main/resources/static/img/";
    @GetMapping("/upload")
    public String index() {
        return "upload";
    }

//    @PostMapping("/upload-detail") // //new annotation since 4.3
//    public String singleFileUpload(@RequestParam("file") MultipartFile file,
//                                   RedirectAttributes redirectAttributes) {
//
//        if (file.isEmpty()) {
//            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
//            return "/uploadStatus";
//        }
//
//        try {
//
//            // Get the file and save it somewhere
//            byte[] bytes = file.getBytes();
//            Path path = Paths.get(file.getOriginalFilename());
//            Files.write(path, bytes);
//
//            redirectAttributes.addFlashAttribute("message",
//                    "You successfully uploaded '" + file.getOriginalFilename() + "'");
////            List<Sign> sign =signRepository.getSignByPhoto(file.getOriginalFilename());
////            redirectAttributes.addFlashAttribute("message1",
////                    "Image:  '" + sign.get(0).getPhoto()+ "'");
////
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        return "redirect:/uploadStatus";
//    }
//
//    @GetMapping("/")
//    public String index() {
//        return "upload";
//    }

    @PostMapping("/upload") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes, Map<String, Object> map) {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return "redirect:uploadStatus";
        }

        try {

            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message",
                    "You successfully uploaded '" + file.getOriginalFilename() + "'");
            objectLink = file.getOriginalFilename();
            System.out.println(objectLink);
            System.out.println(objectLink.length());

            List<Sign> sign = signService.findSignByPhoto(objectLink);
            if (sign.isEmpty()) {
                ResponseEntity.badRequest().build();
            }

            System.out.println("SIGN: " + sign.get(0));
            redirectAttributes.addFlashAttribute("sign", sign.get(0));

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/uploadStatus";
    }


//    @RequestMapping(value="/upload-image/{photo}/",method=RequestMethod.POST)
//    public String upload(@PathVariable String photo, Map<String, Object> map, @RequestParam("files") MultipartFile[] files) {
//
//
////        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
////        map.put("adminname", auth.getName());
////        map.put("title", "Doktor Detayları");
//        List<Sign> users=signRepository.getSignByPhoto(photo);
////        if(users.size()>0) {
////            if(auth.getName().equals(users.get(0).getPhoto())) {
//                // upload image
//                StringBuilder fileNames = new StringBuilder();
//                for (MultipartFile file : files) {
//                    Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
//                    fileNames.append(file.getOriginalFilename()+" ");
//                    //fileNames.toString().replace(" ", "_");
////                    users.get(0).setPhoto(fileNames.toString());
////                    signRepository.save(users.get(0));
////                    try {
////                        Files.write(fileNameAndPath, file.getBytes());
////                    } catch (IOException e) {
////                        e.printStackTrace();
////                    }
//                    if(users.get(0).getPhoto().equals(file.getOriginalFilename())) {
//                        System.out.println("YESS");
//                }
//                    else {
//                        System.out.println("NOO");
//                    }
//                map.put("message", photo+" Hoşgeldiniz.");
//                //map.put("message_2", "Successfully uploaded files "+fileNames.toString());
//                map.put("message_2", "Resminiz Başarıyla Yüklenmiştir.");
//                map.put("user", users.get(0));
//            }
////                else {
////                map.put("message", photo+" email adresi size ait değildir.");
////            }
////        }else {
////
////            map.put("message", photo+" email adresine ait kayıt bulunamamıştır..");
////        }
//        return "/upload-detail";
//    }

    @GetMapping("/uploadStatus")
    public String uploadStatus() {
        return "uploadStatus";
    }

    @ModelAttribute("result")
    public Result getResult() {
        return result;
    }

    @GetMapping("/total")
    public String home1(Model model) {
        List<Result> sList = qService.getTopScore();
        model.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        model.addAttribute("total", total);
        return "";
    }

    @GetMapping("/")
    public String home(Model m){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String userName = ((UserDetails) principal).getUsername();
            m.addAttribute("userName", userName);
        }
        List<Result> sList = rService.getTopFive();
        m.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        String newUser = userService.findByNewUser();
        m.addAttribute("total", total);
        m.addAttribute("newUser",newUser);
        return "exam/index";
    }

    @GetMapping("/quiz1/{userName}")
    public String quiz (@PathVariable("userName") String username, Model m, RedirectAttributes ra) throws ParseException {
        status=true;
        if (username.equals("null") ) {
            ra.addFlashAttribute("warning", "Vui Lòng Đăng nhập ");
            return "redirect:/";
        }
        submitted = false;
        User user1 = userService.findById(username);
        result.setUsername(username);
        result.setUsers(user1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (this.status){
            timer = new Date(System.currentTimeMillis());
            timer.setMinutes(timer.getMinutes()+5);
            System.out.println(formatter.format(timer));
            this.status = false;
        }
        QuestionForm qForm = qService.getQuestions();
        m.addAttribute("qForm", qForm);
        List<Result> sList = qService.getTopScore();
        m.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        m.addAttribute("total", total);
        m.addAttribute("futureDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatter.format(timer)));
        return "exam/quiz";
    }


    @GetMapping("/quiz1/{userName}/{id}")
    public String quiz13(@PathVariable("userName") String username,@PathVariable("id") int id, Model m, RedirectAttributes ra) throws ParseException {
        if (username.equals("null")) {
            ra.addFlashAttribute("warning", "Bạn Phải Nhập Tên ");
            return "redirect:/";
        }
        submitted = false;
        Exam exam = examService.findById(id);
        User user1 = userService.findById(username);
        result.setUsername(username);
        result.setUsers(user1);
        result.setQuestions(exam);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (this.status){
            timer = new Date(System.currentTimeMillis());
            timer.setMinutes(timer.getMinutes()+2);
            this.status = false;
        }
        QuestionForm qForm = qService.getQuestionss(id);
        m.addAttribute("qForm", qForm);
        List<Result> sList = qService.getTopScore();
        m.addAttribute("sList", sList);
        int total = userService.findByTotalUser();
        m.addAttribute("total", total);
            m.addAttribute("idExam",id);
        m.addAttribute("futureDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatter.format(timer)));
        return "exam/quizTest";

    }


    @GetMapping("/quiz11/{userName}/{id}")
    public String beforeQuiz(@PathVariable("userName") String username,@PathVariable("id") int id, RedirectAttributes ra){
        if (username.equals("null")) {
            ra.addFlashAttribute("warning", "Vui Lòng Đăng nhập ");
            return "redirect:/default";
        }
        this.status = true;
        return "redirect:/quiz1/" + username + "/" + id;
    }

    @PostMapping("/submit")
    public String submit (@ModelAttribute QuestionForm qForm, Model m){
        this.status = true;
        if (!submitted) {
            result.setTotalCorrect(qService.getResult(qForm));
            qService.saveScore(result);
            m.addAttribute("qForm", qForm);
            submitted = true;
        }
        return "exam/result";
    }

    @PostMapping("/submit1")
    public String submit1quiz (@ModelAttribute QuestionForm qForm, Model m){
        this.status = true;
        if (!submitted) {
            result.setTotalCorrect(qService.getResult(qForm));
            qService.saveScore(result);
            m.addAttribute("qForm", qForm);
            submitted = true;
        }

        return "exam/result";
    }
@PostMapping("/submit1/{id}")
public String submit1 (@PathVariable(name = "id") int idExam,@ModelAttribute QuestionForm qForm, Model m){
    this.status = true;
    if (!submitted) {
        result.setTotalCorrect(qService.getResult(qForm));
        qService.saveScore(result);
        result = new Result();
        m.addAttribute("qForm", qForm);
        m.addAttribute("idExam", idExam); m.addAttribute("no",1);
        submitted = true;
    }
//    @PostMapping("/submit1")
//    public String submit1 (@ModelAttribute QuestionForm qForm, Model m){
//        this.status = true;
//        if (!submitted) {
//            result.setTotalCorrect(qService.getResult(qForm));
//            qService.saveScore(result);
//            result = new Result();
//            m.addAttribute("qForm", qForm);
//            submitted = true;
//        }
//
//        return "exam/result";
//
//    }

    return "exam/resultTest";
}

//    @GetMapping("/score")
//    public String score (Model m){
//        List<Result> sList = qService.getTopScore();
//        m.addAttribute("sList", sList);
//        return "exam/scoreboard";
//    }

    @GetMapping("/score/{id}")
    public String score (@PathVariable(name = "id") int idExam,Model m){
        List<Result> sList = qService.getTopScoreByExam(idExam);
        m.addAttribute("sList", sList);
        return "exam/scoreboard";
    }
    @GetMapping("/listInformation")
    public String listInformation (Model m){
        List<Result> sList = rService.getTopFive();
        m.addAttribute("sList", sList);

        return "Hau/ListInformation";
    }
    @GetMapping("/honorthegoldboard")
    public String honorthegoldboard (Model m){
        int total = userService.findByTotalUser();
        String newUser = userService.findByNewUser();
        m.addAttribute("total", total);
        m.addAttribute("newUser",newUser);
        return "Hau/HonorTheGoldBoard";
    }
    @GetMapping("/aboutus")
    public String aboutUS(){
        return "aboutAs";
    }

    @GetMapping("/viewSign")
    public String viewSign(){
        return "viewSign";
    }
}
