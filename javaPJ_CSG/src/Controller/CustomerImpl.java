/*
 * 작성일 : 2022-07-15
 * 작성자 : 최슬기
 * 클래스 설명 : 고객 클래스 구현. 로그인, 장바구니 기능 구현
 */


package Controller;


import java.util.Map;
import java.util.Scanner;

import View.MenuImpl;
import domain.flowerpot;



public class CustomerImpl implements Customer  {
	static Scanner sc = new Scanner(System.in); //스캐너 

	String id;
	String pw;
	//고객 아이디, 비밀번호 멤버 변수

	//싱글톤 적용
	private static CustomerImpl cd = new CustomerImpl();
	public static CustomerImpl getInstance() {
		if(cd == null) {
			cd = new CustomerImpl();
		}
		return cd;
	}	
	
	//싱글톤 불러오기
	public static MenuImpl mu = MenuImpl.getInstance();
	public static AdminImpl ad = AdminImpl.getInstance();
	public static flowerpot fw = flowerpot.getInstance();


	//해시맵 불러오기
	Hash hash = new Hash();
	
	//setter, getter
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}


	//고객 로그 재정의 목록
	
	@Override
	public void cartList() { // 장바구니 목록
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("               [ 장바구니 목록  ] 		");
		System.out.println("  	   번 호     이 름    가 격      수량    ");
		try{
			for(Map.Entry<Integer, flowerpot> str : hash.count.entrySet()) {

				int key = str.getKey();
				flowerpot value = str.getValue();
				value.showflowerInfo();		
			}//entry를 이용한 장바구니 상품 목록 출력
			System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
			mu.customerCartMenu();
		}catch(Exception e ) {
			e.getMessage();
		}
	}


	@Override
	public void cartAdd() { //장바구니 상품 추가
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 식물 목록 ] 			");
		System.out.println("  	   번 호     이 름    가 격    재 고      ");
		for(Map.Entry<Integer, flowerpot> str : hash.fwr.entrySet()) {
			int key = str.getKey();
			flowerpot value = str.getValue();
			value.listInfo(); //판매자 상품 목록 출력	
		}				
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");

		System.out.print("	구매할 식물 번호를 입력하세요 : ");
		int number;
		number= sc.nextInt();
		flowerpot f = hash.fwr.get(number); 	//식물 key값 불러오기
		try{
			if(hash.fwr.containsKey(number)) {	//key값이 입력한 number값과 맞아 값이 존재한다면

				System.out.print("	수량을 입력하세요 : ");
				int stock = sc.nextInt();
				f.setBuyflowerstock(stock);		//주문 수량에 값 입력
				hash.count.put(number, f);		//장바구니 map에 key, value값 입력

				if(stock>f.getStock()) {
					System.out.println("	재고량을 초과 했습니다. 다시 입력하세요.");
					cartAdd();					//입력한 수량이 상품 수량보다 많다면 출력되는 메세지
				}
				System.out.println("	장바구니에 담겼습니다. ");
				mu.customerMenu();				//key값이 입력한 number값과 맞을 때 출력되는 메세지
			}
			else{
				System.out.println("	잘못 입력하셨습니다. 다시 입력하세요.");
				mu.customerCartMenu();			//key값과 다른 번호 입력할 때 출력되는 메세지
			}
		}catch(Exception e) {
			e.getMessage();
		}
	}





	@Override //장바구니 상품 삭제
	public void cartRemove() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("  	   번 호     이 름    가 격    재 고    구매 수량");

		try{
			for(Map.Entry<Integer, flowerpot> str : hash.count.entrySet()) {

				int key = str.getKey();
				flowerpot value = str.getValue();
				value.showflowerInfo();					//장바구니 상품 목록 출력
			}
			System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
			System.out.print("	삭제하려는 식물 번호를 입력하세요. : ");
			int number = sc.nextInt();
			if(hash.count.containsKey(number)) {			//장바구니 상품 key값이 입력한 number값에 들어있다면
				hash.count.remove(number);					//장바구니 상품 목록에서 number를 삭제한다
				System.out.println("	"+number+"번 식물이 삭제 되었습니다.");
				mu.customerCartMenu();						//삭제되면 장바구니 목록으로 이동
			}else {System.out.println("	잘못 입력하셨습니다. 다시 입력하세요.");
			mu.customerCartMenu();
			}
		}catch(Exception e) {
			e.getMessage();
		}
	}


	@Override
	public void cartBuy() { //장바구니 구매
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("  	   번 호     이 름    가 격    재 고   구매 수량    ");
		for(Map.Entry<Integer, flowerpot> str : hash.count.entrySet()) {
			int key = str.getKey();			
			flowerpot value = str.getValue();
			value.showflowerInfo();								//장바구니 상품 목록 출력
		}
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		int number;
		int stock;
		System.out.print("	구매할 식물 번호를 입력하세요 : ");
		number= sc.nextInt();
		try {	
			if(hash.fwr.containsKey(number)) {			//판매자 상품 목록에 입력한 key값이 들어있다면
			flowerpot f = hash.fwr.get(number);			
			hash.buy.put(number, f);					//구매 요청 목록에 입력한 값에 해당되는 key, value값을 넣는다
			System.out.println("	구매 요청 되었습니다. ");
			hash.count.remove(number, f);				//장바구니 상품 목록에서 입력한 값 삭제
			mu.customerMenu();
		}else{
			System.out.println("	잘못 입력하셨습니다. 다시 입력하세요.");
			mu.customerCartMenu();
		}
		}catch(Exception e) {
			e.getMessage();

		}
	}



	@Override
	public void nowbuy() { //바로 구매
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 식물 목록 ] 			");
		System.out.println("  	   번 호     이 름    가 격    재  고      ");
		for(Map.Entry<Integer, flowerpot> str : hash.fwr.entrySet()) {
			int key = str.getKey();
			flowerpot value = str.getValue();							//판매자 상품 목록 소환

			value.listInfo();
		}
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	구매할 식물 번호를 입력하세요 : ");
		int number = sc.nextInt();
		try{
			if(hash.fwr.containsKey(number)) {				//상품목록 key값이 안에 들어있으면
				flowerpot f = hash.fwr.get(number);			
				hash.buy.put(number, f);					//구매요청map에 key, value 입력
				System.out.print("	수량을 입력하세요 : ");
				int stock = sc.nextInt();
				f.setBuyflowerstock(stock);		//구매 수량 값을 입력함
				hash.buy.put(number, f);		//구매 수량 map에 값 입력
				hash.count.remove(number, f); //장바구니 수량 map에 key, value값 입력

				if(stock>f.getStock()) {					//입력한 수량값이 판매 수량보다 많으면 아래 메세지 출력
					System.out.println("	재고량을 초과 했습니다. 다시 입력하세요.");
					cartAdd();
				}
				System.out.println("	구매 요청 되었습니다. ");
				mu.customerMenu();
			}
			else{
				System.out.println("	잘못 입력하셨습니다. 다시 입력하세요.");
				mu.customerCartMenu();
			}
		}catch(Exception e) {
			e.getMessage();
		}
	}


	@Override
	public void refund() { //환불

		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("  	   번 호     이 름    가 격    구매 수량     ");
		for(Map.Entry<Integer, flowerpot> str : hash.buy.entrySet()) {
			int key = str.getKey();
			flowerpot value = str.getValue();
			value.showflowerInfo();						//구매자 구매목록 호출
		}
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	환불할 식물 번호를 입력하세요 : [이전 : 0 ] ");
		int number;
		number= sc.nextInt();


		try{
			if(hash.fwr.containsKey(number)) {			//상품 목록에 입력한 key값이 들어있다면
				flowerpot f = hash.fwr.get(number);
				flowerpot buy = hash.buy.get(number);

				System.out.println("	환불 요청 되었습니다. ");
				hash.refund.put(number, f);			//환물 목록 추가
				hash.count.remove(number, f);		//주문 목록에서도 값 삭제
				mu.customerMenu();
			}else{
				mu.customerMenu();
			}
		}catch(Exception e) {
			e.getMessage();
		}
	}
}


