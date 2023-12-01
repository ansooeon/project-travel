package traveldetail;

import java.sql.Date;

public class travelscheduleDTO {
	
	private int schedule_num;
	private int travel_num;
	private Date day;
	private String title;
	private String content;
	public int getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}
	public int getTravel_num() {
		return travel_num;
	}
	public void setTravel_num(int travel_num) {
		this.travel_num = travel_num;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
