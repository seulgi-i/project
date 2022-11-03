/*
 * 작성일 : 2022-07-15
 * 작성자 : 최슬기
 * 클래스 설명 : 모든 메뉴 인터페이스
 */
package View;


public interface Menu {
	MenuImpl mu = MenuImpl.getInstance();
	
	public void commonMenu(int num);		//공통메뉴 이전..
	public void loginMenu();	//로그인메뉴	
	
	public void join();		//회원가입		
	public void adminLogin(); //관리자 로그인
	public void customerLogin(); //고객 로그인
	public void adminMenu(); 	//관리자 메뉴(1.재고관리 2. 주문관리 3.결산 4.로그아웃)
	public void adminStrockMenu(); //관리자 재고관리 메뉴(1.제품목록 2.제품추가 3.제품수정 4.제품삭제 이건 오버라이드 해서 사용)
	public void adminAdminMenu(); //관리자 주문관리 메뉴(1.주문목록 2.구매승인 3.환불처리 4.이전화면)
	public void adminTotalMenu(); //관리자 결산메뉴(1.결산 2.이전화면)
	public void customerMenu(); //고객메뉴(1.장바구니 2.바로구매 3.환불 4.로그아웃)
	public void customerCartMenu(); //고객 장바구니 메뉴 (1.장바구니 목록 2.제제품추가 3.목록삭제 4.제품구매 5.이전화면)
	
	
}
