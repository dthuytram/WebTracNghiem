package vn.codegym.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.codegym.model.Sign;


@Repository
public
interface SignRepository extends CrudRepository<Sign, Long> {

    @Query(value="select * from sign u where u.photo LIKE %:photo%",nativeQuery=true)
    List<Sign> findSignByName(@Param("photo") String photo);

}