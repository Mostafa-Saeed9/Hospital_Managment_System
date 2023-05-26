package com.entity;

public class Specialiest {

	private int id;
	private String specName;

	public Specialiest(int id, String specName) {
		super();
		this.id = id;
		this.specName = specName;
	}

	public Specialiest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialiestName() {
		return specName;
	}

	public void setSpecialiestName(String specialiestName) {
		this.specName = specialiestName;
	}

}
