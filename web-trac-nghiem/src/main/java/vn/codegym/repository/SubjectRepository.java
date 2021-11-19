package vn.codegym.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.codegym.model.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Integer> {
}
