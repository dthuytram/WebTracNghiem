package vn.codegym.service;

import vn.codegym.model.Result;

import java.util.List;

public interface ResultService {
    List<Result> getTopFive();

    List<Result> findByHistory(String id);

    Object findSum(String id);

    Object findAvg(String id);
   List<Result> finResultByIdExam(int id);
}
