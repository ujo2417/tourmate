package com.to.me.dto;

import java.sql.Timestamp;

public class NoticeBoardDTO {
   int notice_num, notice_readcount, notice_replynum;
   String mem_id, notice_content, notice_title;
   Timestamp notice_date;
   int mem_grade;
   
   
   public int getMem_grade() {
	return mem_grade;
}

public void setMem_grade(int mem_grade) {
	this.mem_grade = mem_grade;
}

public NoticeBoardDTO() {
   }

   public NoticeBoardDTO(int notice_num, int notice_readcount, int notice_replynum,
         String mem_id, String notice_content, String notice_title,
         Timestamp notice_date) {
      this.notice_num = notice_num;
      this.notice_readcount = notice_readcount;
      this.notice_replynum = notice_replynum;
      this.mem_id = mem_id;
      this.notice_content = notice_content;
      this.notice_title = notice_title;
      this.notice_date = notice_date;
   }

   public int getnotice_num() {
      return notice_num;
   }

   public void setnotice_num(int notice_num) {
      this.notice_num = notice_num;
   }

   public int getnotice_readcount() {
      return notice_readcount;
   }

   public void setnotice_readcount(int notice_readcount) {
      this.notice_readcount = notice_readcount;
   }

   public int getnotice_replynum() {
      return notice_replynum;
   }

   public void setnotice_replynum(int notice_replynum) {
      this.notice_replynum = notice_replynum;
   }

   public String getMem_id() {
      return mem_id;
   }

   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }

   public String getnotice_content() {
      return notice_content;
   }

   public void setnotice_content(String notice_content) {
      this.notice_content = notice_content;
   }

   public String getnotice_title() {
      return notice_title;
   }

   public void setnotice_title(String notice_title) {
      this.notice_title = notice_title;
   }

   public Timestamp getnotice_date() {
      return notice_date;
   }

   public void setnotice_date(Timestamp notice_date) {
      this.notice_date = notice_date;
   }
   
}