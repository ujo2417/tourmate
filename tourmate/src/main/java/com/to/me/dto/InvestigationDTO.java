package com.to.me.dto;

public class InvestigationDTO {
	int col1, col2, col3, col4;
	
	

	public InvestigationDTO() {	}

	public int getCol1() {
		return col1;
	}

	public void setCol1(int col1) {
		this.col1 = col1;
	}

	public int getCol2() {
		return col2;
	}

	public void setCol2(int col2) {
		this.col2 = col2;
	}

	public int getCol3() {
		return col3;
	}

	public void setCol3(int col3) {
		this.col3 = col3;
	}

	public int getCol4() {
		return col4;
	}

	public void setCol4(int col4) {
		this.col4 = col4;
	}

	@Override
	public String toString() {
		return "InvestigationDTO [col1=" + col1 + ", col2=" + col2 + ", col3=" + col3 + ", col4=" + col4 + "]";
	}
	
	
}
