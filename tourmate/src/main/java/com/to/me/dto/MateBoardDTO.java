package com.to.me.dto;

import java.sql.Timestamp;

public class MateBoardDTO {
	int mate_num, mate_readcount, mate_replynum, mate_max, mate_present;
	String mem_id, mate_content, mate_title, mate_date1, mate_date2;
	Timestamp mate_date;
	int mem_grade;
	
	public int getMem_grade() {
		return mem_grade;
	}
	

	public String getMate_date1() {
		return mate_date1;
	}


	public void setMate_date1(String mate_date1) {
		this.mate_date1 = mate_date1;
	}

	public String getMate_date2() {
		return mate_date2;
	}

	public void setMate_date2(String mate_date2) {
		this.mate_date2 = mate_date2;
	}

	public void setMem_grade(int mem_grade) {
		this.mem_grade = mem_grade;
	}

	public MateBoardDTO() {
		super();
	}
	
	public int getMate_present() {
		return mate_present;
	}

	public void setMate_present(int mate_present) {
		this.mate_present = mate_present;
	}

	public int getMate_num() {
		return mate_num;
	}
	public void setMate_num(int mate_num) {
		this.mate_num = mate_num;
	}
	public int getMate_readcount() {
		return mate_readcount;
	}
	public void setMate_readcount(int mate_readcount) {
		this.mate_readcount = mate_readcount;
	}
	public int getMate_replynum() {
		return mate_replynum;
	}
	public void setMate_replynum(int mate_replynum) {
		this.mate_replynum = mate_replynum;
	}
	public int getMate_max() {
		return mate_max;
	}
	public void setMate_max(int mate_max) {
		this.mate_max = mate_max;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMate_content() {
		return mate_content;
	}
	public void setMate_content(String mate_content) {
		this.mate_content = mate_content;
	}
	public String getMate_title() {
		return mate_title;
	}
	public void setMate_title(String mate_title) {
		this.mate_title = mate_title;
	}
	public Timestamp getMate_date() {
		return mate_date;
	}
	public void setMate_date(Timestamp mate_date) {
		this.mate_date = mate_date;
	}

	
}
