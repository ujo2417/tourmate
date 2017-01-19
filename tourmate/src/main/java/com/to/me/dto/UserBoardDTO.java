package com.to.me.dto;

import java.sql.Timestamp;

public class UserBoardDTO {
   int user_num, user_readcount, user_replynum;
   String mem_id, user_content, user_title;
   Timestamp user_date;
   int mem_grade;
   String mem_pic;
   int user_good;
   
   public int getUser_good() {
	return user_good;
}

public void setUser_good(int user_good) {
	this.user_good = user_good;
}

public String getMem_pic() {
	return mem_pic;
}

public void setMem_pic(String mem_pic) {
	this.mem_pic = mem_pic;
}

public UserBoardDTO() {
   }

   public UserBoardDTO(int user_num, int user_readcount, int user_replynum,
         String mem_id, String user_content, String user_title,
         Timestamp user_date) {
      this.user_num = user_num;
      this.user_readcount = user_readcount;
      this.user_replynum = user_replynum;
      this.mem_id = mem_id;
      this.user_content = user_content;
      this.user_title = user_title;
      this.user_date = user_date;
   }

public int getUser_num() {
	return user_num;
}

public void setUser_num(int user_num) {
	this.user_num = user_num;
}

public int getUser_readcount() {
	return user_readcount;
}

public void setUser_readcount(int user_readcount) {
	this.user_readcount = user_readcount;
}

public int getUser_replynum() {
	return user_replynum;
}

public void setUser_replynum(int user_replynum) {
	this.user_replynum = user_replynum;
}

public String getMem_id() {
	return mem_id;
}

public void setMem_id(String mem_id) {
	this.mem_id = mem_id;
}

public String getUser_content() {
	return user_content;
}

public void setUser_content(String user_content) {
	this.user_content = user_content;
}

public String getUser_title() {
	return user_title;
}

public void setUser_title(String user_title) {
	this.user_title = user_title;
}

public Timestamp getUser_date() {
	return user_date;
}

public void setUser_date(Timestamp user_date) {
	this.user_date = user_date;
}

public int getMem_grade() {
	return mem_grade;
}

public void setMem_grade(int mem_grade) {
	this.mem_grade = mem_grade;
}

   
   
}