package Controller;


public interface Customer {

	

	CustomerImpl cd = CustomerImpl.getInstance();
		
	//고객 - 장바구니
		public void cartList(); //장바구니 리스트
		public void cartAdd(); //장바구니 추가
		public void cartRemove(); //장바구니 삭제
		public void cartBuy(); //장바구니 구매
		
		//포인트 누적 넣을까봐
		
	//고객 - 바로구매
		public void nowbuy();		//바로구매
		
	//고객  - 환불
		public void refund();		//환불
		
}
