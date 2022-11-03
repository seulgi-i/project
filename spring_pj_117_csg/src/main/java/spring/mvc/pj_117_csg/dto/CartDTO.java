package spring.mvc.pj_117_csg.dto;


//카트DTO
public class CartDTO {
	private String id;
	private int pdNo;				//상품번호
	private int cartNo;				//카트번호
	private String pdImg;			//상품이미지
	private int cartCnt;			//상품수량
	private String pdName;			//상품이름
	private int price;				//판매가격
	private int money;			//price*cartCnt
	
	public CartDTO() {
		
	}

	public String getPdImg() {
		return pdImg;
	}

	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getCartCnt() {
		return cartCnt;
	}

	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
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


	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "CartDTO [id=" + id + ", pdNo=" + pdNo + ", cartNo=" + cartNo + ", pdImg=" + pdImg + ", cartCnt=" + cartCnt
				+ ", pdName=" + pdName + ", price=" + price  + ", money=" + money + "]";
	}
	
}