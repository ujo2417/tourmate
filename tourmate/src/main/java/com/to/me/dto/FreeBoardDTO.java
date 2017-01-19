package com.to.me.dto;

import java.sql.Timestamp;

public class FreeBoardDTO {
   int free_num, free_readcount, free_replynum;
   String mem_id, free_content, free_title;
   Timestamp free_date;
   int mem_grade;
   
   
   public int getMem_grade() {
	return mem_grade;
}

public void setMem_grade(int mem_grade) {
	this.mem_grade = mem_grade;
}

public FreeBoardDTO() {
   }

   public FreeBoardDTO(int free_num, int free_readcount, int free_replynum,
         String mem_id, String free_content, String free_title,
         Timestamp free_date) {
      this.free_num = free_num;
      this.free_readcount = free_readcount;
      this.free_replynum = free_replynum;
      this.mem_id = mem_id;
      this.free_content = free_content;
      this.free_title = free_title;
      this.free_date = free_date;
   }

   public int getFree_num() {
      return free_num;
   }

   public void setFree_num(int free_num) {
      this.free_num = free_num;
   }

   public int getFree_readcount() {
      return free_readcount;
   }

   public void setFree_readcount(int free_readcount) {
      this.free_readcount = free_readcount;
   }

   public int getFree_replynum() {
      return free_replynum;
   }

   public void setFree_replynum(int free_replynum) {
      this.free_replynum = free_replynum;
   }

   public String getMem_id() {
      return mem_id;
   }

   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }

   public String getFree_content() {
      return free_content;
   }

   public void setFree_content(String free_content) {
      this.free_content = free_content;
   }

   public String getFree_title() {
      return free_title;
   }

   public void setFree_title(String free_title) {
      this.free_title = free_title;
   }

   public Timestamp getFree_date() {
      return free_date;
   }

   public void setFree_date(Timestamp free_date) {
      this.free_date = free_date;
   }
   
}