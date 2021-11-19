package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.codegym.model.Result;

import java.util.List;

@Repository
public interface ResultRepository extends JpaRepository<Result, Integer> {
    @Query(value = "SELECT * FROM result order by total_Correct desc limit 5", nativeQuery = true)
    List<Result> findTopFive();

    @Query(value = "SELECT * FROM result where users_user = :id ", nativeQuery = true)
    List<Result> findByHistory(@Param("id") String id);

    @Query(value = "SELECT SUM(total_correct)\n" +
            "FROM result\n" +
            "WHERE users_user= :id ", nativeQuery = true)
    Object findSum(@Param("id") String id);

    @Query(value = "SELECT AVG (total_correct)\n" +
            "FROM result\n" +
            "WHERE users_user= :id ", nativeQuery = true)
    Object findAvg(@Param("id") String id);

    @Query(value = "SELECT * FROM web_thuc_tap.result where id_exam= :idExam order by total_correct desc", nativeQuery = true)
    List<Result> findTopByExam(@Param("idExam") int idExam);
    @Query(value = "SELECT * FROM result where id_exam = :id ", nativeQuery = true)
    List<Result> finResultByIdExam(@Param("id") int id);

}
