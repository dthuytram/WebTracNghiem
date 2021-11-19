package vn.codegym.model;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
public class Sign{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    @Column(nullable = true, length = 64)
    private String photo;

    private String motahinhdang;

    private String quydinh;

    @ManyToOne(targetEntity = Subject.class)
    private Subject subject;

    public Sign() {
    }

    public Sign(int id, String name, String photo, String motahinhdang, String quydinh, Subject subject) {
        this.id = id;
        this.name = name;
        this.photo = photo;
        this.motahinhdang = motahinhdang;
        this.quydinh = quydinh;
        this.subject = subject;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getMotahinhdang() {
        return motahinhdang;
    }

    public void setMotahinhdang(String motahinhdang) {
        this.motahinhdang = motahinhdang;
    }

    public String getQuydinh() {
        return quydinh;
    }

    public void setQuydinh(String quydinh) {
        this.quydinh = quydinh;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
}