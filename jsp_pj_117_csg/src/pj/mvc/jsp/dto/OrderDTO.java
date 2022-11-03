package pj.mvc.jsp.dto;

import java.util.Date;

public class OrderDTO {

	private String id;						//아이디
	private String address;					//주소
	private String hp;						//핸드폰번호
	private String name;					//이름
	private int orderNo;					//주문번호
	private int pdNo;						//상품번호
	private int cartNo;						//장바구니번호
	private int cartCnt;					//장바구니번호
	private String pdImg;					//상품이미지
	private int orderCnt;					//주문수량(재고)
	private String pdName;					//상품이름
	private int price;						//판매가격
	private int dvprice;					//배송비
	private int money;						//합계
	private int totalCnt;					//판매수량
	private int totalMoney;				//판매금액
	private String state;					//상태
	private String orderName;				//주문자명
	private String orderaddress;		//주문자주소
	private String orderhp; 			//주문자핸드폰
	private Date orderdate;				//주문날짜
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getPdNo() {
		return pdNo;
	}
	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getPdImg() {
		return pdImg;
	}
	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDvprice() {
		return dvprice;
	}
	public void setDvprice(int dvprice) {
		this.dvprice = dvprice;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	public int getCartCnt() {
		return cartCnt;
	}
	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderaddress() {
		return orderaddress;
	}
	public void setOrderaddress(String orderaddress) {
		this.orderaddress = orderaddress;
	}
	public String getOrderhp() {
		return orderhp;
	}
	public void setOrderhp(String orderhp) {
		this.orderhp = orderhp;
	}
	
	
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	
	
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [id=" + id + ", address=" + address + ", hp=" + hp + ", name=" + name + ", orderNo=" + orderNo
				+ ", pdNo=" + pdNo + ", cartNo=" + cartNo + ", cartCnt=" + cartCnt + ", pdImg=" + pdImg + ", orderCnt="
				+ orderCnt + ", pdName=" + pdName + ", price=" + price + ", dvprice=" + dvprice + ", money=" + money
				+ ", totalCnt=" + totalCnt + ", totalMoney=" + totalMoney + ", state=" + state + ", orderName="
				+ orderName + ", orderaddress=" + orderaddress + ", orderhp=" + orderhp + ", orderdate=" + orderdate
				+ "]";
	}
	

	
}
