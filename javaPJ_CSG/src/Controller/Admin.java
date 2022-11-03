package Controller;

public interface Admin {
		public static final String ID = "admin";
		public static final String PASSWORD = "admin";
		
		//싱글톤 적용
		AdminImpl ad = AdminImpl.getInstance();
		
		//관리자 - 재고관리
		public void productList();  	//꽃 목록
		
		public void productAdd();		//꽃 추가
		public void productdate();		//꽃 수정
		public void productRemove();		//꽃 삭제
		
		//포인트관리 , QnA같은 거...
		
		//관리자 - 주문관리
		public void orderList();		//주문 목록
		public void orderConfirm();		//결제승인
		public void orderCancel();		//결제취소
		
		//관리자 - 결산
		public void saleTotal();		//결산
}
		
