package com.to.me.dto;


public class MateMemberDTO {
	int mate_num, mate_confirm;
	String mem_id;
	public MateMemberDTO() {
		super();
	}
	
	

	public int getMate_num() {
		return mate_num;
	}
	public void setMate_num(int mate_num) {
		this.mate_num = mate_num;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}



	public MateMemberDTO(int mate_num, int mate_confirm, String mem_id) {
		super();
		this.mate_num = mate_num;
		this.mate_confirm = mate_confirm;
		this.mem_id = mem_id;
	}



	public int getMate_confirm() {
		return mate_confirm;
	}



	public void setMate_confirm(int mate_confirm) {
		this.mate_confirm = mate_confirm;
	}
	

	
}
