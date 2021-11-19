package vn.codegym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.codegym.model.Sign;
import vn.codegym.repository.SignRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class SignService {
    @Autowired
    SignRepository signRepository;

    public List<Sign> findSignByPhoto(String name) {
        List<Sign> result = new ArrayList<Sign>();
        signRepository.findSignByName(name).forEach(result::add);
        return result;
    }

}
