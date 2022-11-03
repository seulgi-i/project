package domain;
/*
 * 작성일 : 2022-07-15
 * 작성자 : 최슬기
 * 클래스 설명 : 상품 클래스.
 */
import java.util.Map;

//상품 클래스

public class flowerpot {


	public flowerpot() {}
	private static flowerpot fw = new flowerpot();
	public static flowerpot getInstance() {
		if(fw == null) {
			fw = new flowerpot();
		}
		return fw;
	}
	private Map <Integer,flowerpot> fwr;
	

		
		//멤버변수
		private String name; //이름
		private int number; // 번호
		private int price; //가격
		private int stock; //수량
		
		int buyflowerstock; //구매수량
		
		//디폴트 생성자

		//매개변수 생성자
		public flowerpot( int number, String name, int price,int stock) {
			this.number = number;
			this.name = name;
			this.price = price;
			this.stock = stock;
		}
		public void setBuyflowerstock(int buyflowerstock) {
			this.buyflowerstock = buyflowerstock;
		}
		public int getBuyflowerstock () {
			return buyflowerstock;
		}
		
		public void setName(String name) {
			this.name = name;
		}
		public String getName() {
			return name;
		}
		public void setNumber(int number) {
			this.number = number;
		}
		public int getNumber() {
			return number;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getStock() {
			return stock;
		}
		public void setStock(int stock) {
			this.stock = stock;
		}
		
		public void showflowerInfo() {
			System.out.println("	"+number+"  "+name +"  "+price+"  "+buyflowerstock);
		}
		@Override
		public String toString() {
			return number+ " "+name +"   "+price+"  "+stock+"  "+buyflowerstock;
			
		}
		public void listInfo() {
			System.out.println("	"+number+"  "+name +"  "+price+"  "+stock);
		}

	}



