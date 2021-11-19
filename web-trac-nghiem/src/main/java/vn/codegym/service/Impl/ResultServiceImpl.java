package vn.codegym.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.codegym.model.Result;
import vn.codegym.repository.ResultRepository;
import vn.codegym.service.ResultService;

import java.util.Collections;
import java.util.List;

@Service
public class ResultServiceImpl implements ResultService {
    @Autowired
    ResultRepository resultRepository;

    @Override
    public List<Result> getTopFive() {
        return resultRepository.findTopFive();
    }

    @Override
    public List<Result> findByHistory(String id) {
        return resultRepository.findByHistory(id);
    }

    @Override
    public Object findSum(String id) {
        return resultRepository.findSum(id);
    }

    @Override
    public Object findAvg(String id) {
        return resultRepository.findAvg(id);
    }

    @Override
    public List<Result> finResultByIdExam(int id) {
        return resultRepository.finResultByIdExam(id);
    }




}
