package cart;

public class cartDTO {
	
	
	private int travelNum;
	private String memberId;
	private String title;
	private String titlesub;
	private String startdate;
	private String enddate;
	private int price;
	private String img;
	
	public int getTravelNum() {
		return travelNum;
	}
	public void setTravelNum(int travelNum) {
		this.travelNum = travelNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitlesub() {
		return titlesub;
	}
	public void setTitlesub(String titlesub) {
		this.titlesub = titlesub;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	
}
