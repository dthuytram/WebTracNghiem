package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.codegym.model.Classes;

public interface ClassesRepository extends JpaRepository<Classes, Integer> {
}
