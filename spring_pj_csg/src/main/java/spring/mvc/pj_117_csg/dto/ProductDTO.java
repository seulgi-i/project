package spring.mvc.pj_117_csg.dto;

import java.sql.Date;
//상품정보
public class ProductDTO {
	private int pdNo;				//상품번호
	private String pdName;	//상품이름
	private String pdImg;		//상품이미지
	private String category;	//카테고리
	private String brand;		//브랜드
	private String content;	//제품설명
	private int price;				//판매가격
	private int quantity;		//등록수량
	private String status;		//판매상태
	private Date indate;		//입고일
	
	public ProductDTO() {}
	
	public int getPdNo() {
		return pdNo;
	}
	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdImg() {
		return pdImg;
	}
	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "ProductDTO [pdNo=" + pdNo + ", pdName=" + pdName + ", pdImg=" + pdImg + ", category=" + category
				+ ", brand=" + brand + ", content=" + content + ", price=" + price + ", quantity=" + quantity
				+ ", status=" + status + ", indate=" + indate + "]";
	}
	
}
