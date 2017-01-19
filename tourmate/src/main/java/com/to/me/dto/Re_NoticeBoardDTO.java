package com.to.me.dto;

import java.sql.Timestamp;

public class Re_NoticeBoardDTO {
   int re_num, re_noticenum;
   String re_content, mem_id;
   Timestamp re_writedate;
   int mem_grade;
   
   

   public int getMem_grade() {
	return mem_grade;
}
public void setMem_grade(int mem_grade) {
	this.mem_grade = mem_grade;
}
public Re_NoticeBoardDTO() {
   }
   public Re_NoticeBoardDTO(int re_num, int re_noticenum, String re_content,
         String mem_id, Timestamp re_writedate) {
      this.re_num = re_num;
      this.re_noticenum = re_noticenum;
      this.re_content = re_content;
      this.mem_id = mem_id;
      this.re_writedate = re_writedate;
   }
   public int getRe_num() {
      return re_num;
   }
   public void setRe_num(int re_num) {
      this.re_num = re_num;
   }
   public int getRe_noticenum() {
      return re_noticenum;
   }
   public void setRe_noticenum(int re_noticenum) {
      this.re_noticenum = re_noticenum;
   }
   public String getRe_content() {
      return re_content;
   }
   public void setRe_content(String re_content) {
      this.re_content = re_content;
   }
   public String getMem_id() {
      return mem_id;
   }
   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }
   public Timestamp getRe_writedate() {
      return re_writedate;
   }
   public void setRe_writedate(Timestamp re_writedate) {
      this.re_writedate = re_writedate;
   }
   
}