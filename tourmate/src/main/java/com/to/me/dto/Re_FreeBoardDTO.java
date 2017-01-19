package com.to.me.dto;

import java.sql.Timestamp;

public class Re_FreeBoardDTO {
   int re_num, re_freenum;
   String re_content, mem_id;
   Timestamp re_writedate;
   int mem_grade;
   
   

   public int getMem_grade() {
	return mem_grade;
}
public void setMem_grade(int mem_grade) {
	this.mem_grade = mem_grade;
}
public Re_FreeBoardDTO() {
   }
   public Re_FreeBoardDTO(int re_num, int re_freenum, String re_content,
         String mem_id, Timestamp re_writedate) {
      this.re_num = re_num;
      this.re_freenum = re_freenum;
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
   public int getRe_freenum() {
      return re_freenum;
   }
   public void setRe_freenum(int re_freenum) {
      this.re_freenum = re_freenum;
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