package com.model;

public class LikeDTO {


	private String pred_insta_id;
	private String upload_day;
	private String upload_time;
	private String hashtag;
	private String file_name;
	private int account_tag;
	private int place_tag;
	private int pred_date;
	
	
	
	public LikeDTO(String pred_insta_id, String upload_day, String upload_time, String hashtag,String file_name, int account_tag, int place_tag) {
		this.pred_insta_id = pred_insta_id;
		this.upload_day = upload_day;
		this.upload_time = upload_time;
		this.hashtag = hashtag;
		this.file_name = file_name;
		this.account_tag = account_tag;
		this.place_tag = place_tag;
	}



	public String getPred_insta_id() {
		return pred_insta_id;
	}



	public void setPred_insta_id(String pred_insta_id) {
		this.pred_insta_id = pred_insta_id;
	}



	public String getUpload_day() {
		return upload_day;
	}



	public void setUpload_day(String upload_day) {
		this.upload_day = upload_day;
	}



	public String getUpload_time() {
		return upload_time;
	}



	public void setUpload_time(String upload_time) {
		this.upload_time = upload_time;
	}



	public String getHashtag() {
		return hashtag;
	}



	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}



	public String getFile_name() {
		return file_name;
	}



	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}



	public int getAccount_tag() {
		return account_tag;
	}



	public void setAccount_tag(int account_tag) {
		this.account_tag = account_tag;
	}



	public int getPlace_tag() {
		return place_tag;
	}



	public void setPlace_tag(int place_tag) {
		this.place_tag = place_tag;
	}



	public int getPred_date() {
		return pred_date;
	}



	public void setPred_date(int pred_date) {
		this.pred_date = pred_date;
	}
	
	
	
	
	
	
	
}
