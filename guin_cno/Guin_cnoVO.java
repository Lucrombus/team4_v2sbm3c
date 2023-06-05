package guin_cno;

import org.springframework.web.multipart.MultipartFile;

public class Guin_cnoVO {
  
    private int guin_cno;
    private int memberno;
    private String name;
    private String brand;
    private String title;
    private String content;
    private int date;
    private String address;
    private int wage;
    private String day;
    private String period;
    private String tel;
    private String file1;
    private String file1saved;
    private String thumb1;
    private int size1;
    
    public int getguin_cno() {
      return guin_cno;
    }
    public void setguin_cno(int guin_cno) {
      this.guin_cno = guin_cno;
    }
    
    public int getmemberno() {
      return memberno;
    }
    public void memberno(int memberno) {
      this.memberno = memberno;
    }
    
    public String getbrand() {
      return brand;
    }
    public void setbrand(String brand) {
      this.brand = brand;
    }
    
    public String gettitle() {
      return title;
    }
    public void setName(String title) {
      this.title = title;
    }
    
    public String getcontent() {
      return content;
    }
    public void setcontent(String content) {
      this.content = content;
    }
    
    public int getdate() {
      return date;
    }
    public void setdate(int date) {
      this.date = date;
    }
  
    public String getaddress() {
      return title;
    }
    public void setaddress(String address) {
      this.address = address;
    }
    
    public int getwage() {
      return wage;
    }
    public void setwage(int wage) {
      this.date = wage;
    }
    
    public String getday() {
      return day;
    }
    public void setday(String day) {
      this.day = day;
    }
    
    public String getperiod() {
      return period;
    }
    public void setperiod(String period) {
      this.period = period;
    }
    
    public String gettel() {
      return tel;
    }
    public void settel(String tel) {
      this.tel = tel;
    }
    
    public String getfile1() {
      return file1;
    }
    public void setfile1(String file1) {
      this.file1 = file1;
      
    }public String getfile1saved() {
      return file1saved;
    }
    public void setfile1saved(String file1saved) {
      this.file1saved = file1saved;
    }

    public String getthumb1() {
      return thumb1;
    }
    public void setthumb1(String thumb1) {
      this.thumb1 = thumb1;
    }
    
    public int getsize1() {
      return size1;
    }
    public void setsize1(int size1) {
      this.size1 = size1;
    }
    
    
  }