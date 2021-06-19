package com.model;

import java.util.List;

public class UnfollowDTO {
	private String past_user_id;
	private String past_f4f_id;
	private String past_date;
	private List<String> past_f4f_list;
	

	public UnfollowDTO(String past_user_id, List<String> past_f4f_list) {
		this.past_user_id = past_user_id;
		this.past_f4f_list = past_f4f_list;
	}
	
	public String getPast_user_id() {
		return past_user_id;
	}
	public void setPast_user_id(String past_user_id) {
		this.past_user_id = past_user_id;
	}
	public String getPast_f4f_id() {
		return past_f4f_id;
	}
	public void setPast_f4f_id(String past_f4f_id) {
		this.past_f4f_id = past_f4f_id;
	}
	public String getPast_date() {
		return past_date;
	}
	public void setPast_date(String past_date) {
		this.past_date = past_date;
	}
	
	public List<String> getPast_f4f_list() {
		return past_f4f_list;
	}

	public void setPast_f4f_list(List<String> past_f4f_list) {
		this.past_f4f_list = past_f4f_list;
	}
	
}
