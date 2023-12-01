package TravelInfo;

import java.sql.Date;

public class TravelDTO {
	
	private int travelboard_num;
	private String member_id;
	private String title;
	private String content;
	private Date created;
	private String region;
	private String myplan;
	private String img;
	
	public int getTravelboard_num() {
		return travelboard_num;
	}
	public void setTravelboard_num(int travelboard_num) {
		this.travelboard_num = travelboard_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getMyplan() {
		return myplan;
	}
	public void setMyplan(String myplan) {
		this.myplan = myplan;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
}
