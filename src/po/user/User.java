package po.user;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
import po.integral.Integral;
import po.integral.IntegralRule;
import po.post.PostInformation;

import java.util.Date;
import java.util.List;

public class User {
    private int id;
    private String username;
    private String password;
    private String phonenum;
    private int mark;
    private String name;
    private String gender;
    private String speciality;
    private String photopath;
    private String birthday;
    private Integer integral;
    private List<PostInformation> postInformation;
    private Integral integrallist;
    private IntegralRule integralRule;

    public IntegralRule getIntegralRule() {
        return integralRule;
    }

    public void setIntegralRule(IntegralRule integralRule) {
        this.integralRule = integralRule;
    }

    public Integral getIntegrallist() {
        return integrallist;
    }

    public void setIntegrallist(Integral integrallist) {
        this.integrallist = integrallist;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getPhotopath() {
        return photopath;
    }

    public void setPhotopath(String photopath) {
        this.photopath = photopath;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getIntegral() {
        return integral;
    }

    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    public List<PostInformation> getPostInformation() {
        return postInformation;
    }

    public void setPostInformation(List<PostInformation> postInformation) {
        this.postInformation = postInformation;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", mark=" + mark +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", speciality='" + speciality + '\'' +
                ", photopath='" + photopath + '\'' +
                ", birthday='" + birthday + '\'' +
                ", integral=" + integral +
                ", postInformation=" + postInformation +
                ", integrallist=" + integrallist +
                '}';
    }
}
