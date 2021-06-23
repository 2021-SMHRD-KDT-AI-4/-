package com.model;

public class ResultDTO {
	private int pred_like_num;
	private String pred_insta_id;
	private String upload_day;
	private String upload_time;
	private String rec_hash_tag;
	private String file_name;
	private int pred_date;
	private int account_tag;
	private int place_tag;
	private int result_like;
	public ResultDTO(int pred_like_num, String pred_insta_id, String upload_day, String upload_time,
			String rec_hash_tag, String file_name, int pred_date, int account_tag, int place_tag, int result_like) {
		super();
		this.pred_like_num = pred_like_num;
		this.pred_insta_id = pred_insta_id;
		this.upload_day = upload_day;
		this.upload_time = upload_time;
		this.rec_hash_tag = rec_hash_tag;
		this.file_name = file_name;
		this.pred_date = pred_date;
		this.account_tag = account_tag;
		this.place_tag = place_tag;
		this.result_like = result_like;
	}
	
	public ResultDTO(String upload_day, String upload_time, String rec_hash_tag, String file_name, int account_tag,
			int place_tag, int result_like) {
		super();
		this.upload_day = upload_day;
		this.upload_time = upload_time;
		this.rec_hash_tag = rec_hash_tag;
		this.file_name = file_name;
		this.account_tag = account_tag;
		this.place_tag = place_tag;
		this.result_like = result_like;
	}

	public int getPred_like_num() {
		return pred_like_num;
	}
	public void setPred_like_num(int pred_like_num) {
		this.pred_like_num = pred_like_num;
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
	public String getRec_hash_tag() {
		return rec_hash_tag;
	}
	public void setRec_hash_tag(String rec_hash_tag) {
		this.rec_hash_tag = rec_hash_tag;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getPred_date() {
		return pred_date;
	}
	public void setPred_date(int pred_date) {
		this.pred_date = pred_date;
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
	public int getResult_like() {
		return result_like;
	}
	public void setResult_like(int result_like) {
		this.result_like = result_like;
	}
	
	
	
	
	
	
}
