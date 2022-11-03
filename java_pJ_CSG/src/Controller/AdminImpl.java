/*
 * 작성일 : 2022-07-15
 * 작성자 : 최슬기
 * 클래스 설명 : 관리자 클래스 구현. 재고관리, 주문관리, 결산 기능 구현
 */


package Controller;

import java.util.Map;
import java.util.Scanner;

import View.MenuImpl;
import domain.flowerpot;

public class AdminImpl implements Admin{

	static Scanner sc= new Scanner(System.in);

	//싱글톤 적용
	private AdminImpl() {}

	private static AdminImpl ad = new AdminImpl();
	public static AdminImpl getInstance() {
		if(ad == null) {
			ad = new AdminImpl();
		}
		return ad;
	}

	Hash hash = new Hash();


	public static MenuImpl mu = MenuImpl.getInstance();
	public static CustomerImpl ct = CustomerImpl.getInstance();
	int money = 0;


	//꽃 목록
	@Override
	public void productList() {	
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("  	   번 호    이름   가격   재고       ");
		listInfo();	//상품 목록 메서드 호출
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");

		mu.adminStrockMenu();
	}		


	//꽃 추가
	@Override
	public void productAdd() {
		try {
			System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
			System.out.println("                [ 식물 추가  ] 		");
			System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
			int number = (int)(Math.random()*1000)+1000;		//상품에 추가되는 값을 무작위 번호 지정

			System.out.print("	이름 : ");
			String name = sc.next();

			System.out.print("	가격 : ");
			int price = sc.nextInt();

			System.out.print("	수량 : ");
			int stock = sc.nextInt();

			flowerpot fr = new flowerpot(number, name, price, stock);	//상품 목록에 추가 함
			hash.fwr.put(number, fr);
			System.out.println("	"+name+"(이)가 추가되었습니다.");
			mu.adminStrockMenu();
		}catch(Exception e) {
			System.out.println("	잘못 입력하셨습니다. 다시 입력하세요.");
			sc.next();
			productAdd();
		}
	}


	//꽃 수정
	@Override
	public void productdate() {
		try {
			System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
			System.out.println("                [ 식물 수정  ]");
			System.out.println("  	   번 호    이름   가격   재고   ");
			listInfo();		//상품 목록 호출
			System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
			System.out.print("	식물 번호를 입력하세요. : ");
			int number;
			number=sc.nextInt();
			if(hash.fwr.containsKey(number)) {	//기존 목록에 있는 key값이 입력한 값이 들어가면

				System.out.print("	이름 : ");
				String name = sc.next();

				System.out.print("	가격 : ");
				int price = sc.nextInt();

				System.out.print("	수량 : ");
				int stock = sc.nextInt();

				flowerpot fr = new flowerpot(number, name, price, stock);
				hash.fwr.put(number, fr);
				System.out.println("	수정되었습니다.");	//갈아치운다
				mu.adminStrockMenu();
			}
			else {
				System.out.println("	잘못 입력하셨습니다. 다시 입력하세요.");
				productdate();
			}
		}catch(Exception e) {
			e.getMessage();
		}
	}




	//꽃 삭제
	@Override
	public void productRemove() {
		try {
			System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
			System.out.println("  	   번 호    이름   가격   재고    ");
			listInfo();	//상품 목록 호출
			System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
			System.out.print("	삭제하려는 식물 번호를 입력하세요. : ");

			int number = sc.nextInt();
			if(hash.fwr.containsKey(number)) {
				hash.fwr.remove(number);		//입력한 값이 key값에 들어 있으면 그 값을 삭제한다.
				System.out.println("	"+number+"번 식물이 삭제 되었습니다.");
				mu.adminStrockMenu();
			}else {
				System.out.println("	 잘못 입력하셨습니다. 다시 입력하세요.");
				productRemove();
			}
		}catch(Exception e) {
			e.getMessage();
		}
	}

	//주문 목록
	@Override
	public void orderList() {  
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 주문 목록  ]");
		System.out.println("  	번 호     이름    가격    재고  구매수량 ");
		for(Map.Entry<Integer, flowerpot> str : hash.buy.entrySet()) {
			int key = str.getKey();
			flowerpot value = str.getValue();
			System.out.println("	"+value.toString());
			//구매자 구매 요청 목록 호출
		}
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	   이전으로 : [0]");

		int b = sc.nextInt();
		if(b==0) {
			mu.adminAdminMenu();
		}else {
			System.out.println("	잘못 입력 하셨습니다. 다시 입력하세요.");
			b=sc.nextInt();
		}

	}

	//결제승인
	@Override
	public void orderConfirm() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 주문 목록  ]");
		System.out.println("  	번 호     이름    가격    재고   구매수량 ");
		try{
			for(Map.Entry<Integer, flowerpot> str : hash.buy.entrySet()) {
				int key = str.getKey();
				flowerpot value = str.getValue();
				System.out.println("	"+value.toString());		//구매자 구매 목록 호출
			}	
			System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
			System.out.print("	   구매 승인할 코드를 입력하세요 : ");
			int number =sc.nextInt();
			if(hash.buy.containsKey(number)) {		//구매가 목록에 있는 값에 입력한 number값이 들어있다면
				
				flowerpot f = hash.fwr.get(number);
				flowerpot buy = hash.buy.get(number);
				
				int totalcount = f.getStock()-buy.getBuyflowerstock(); //상품 재고량 - 구매자의 요청 수량
				f.setStock(totalcount); //위 값을 상품재고량에 대입함.
				money += f.getPrice()*buy.getBuyflowerstock(); //관리자 결산금액 = 상품 금액*구매수량
				System.out.println("	      승인이 완료 되었습니다.");
				hash.buy.remove(number);
			}
			else {
				System.out.println("	잘못 입력 하셨습니다. 다시 입력하세요.");
				mu.adminAdminMenu();
			}
			mu.adminAdminMenu();
		}catch(Exception e) { 
			e.getMessage();
		}
	}





	//결제취소
	@Override
	public void orderCancel() {


		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("  	   번 호    이름   가격   재고    구매수량");
		for(Map.Entry<Integer, flowerpot> str : hash.refund.entrySet()) {
			int key = str.getKey();
			flowerpot value = str.getValue();
			System.out.println("	"+value.toString());		//구매자 목록 호출
		}
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	취소하려는 식물 번호를 입력하세요. : ");


		int number = sc.nextInt();
		try {
			if(hash.buy.containsKey(number)) {		//구매 목록에 입력한 값이 들어있다면
				flowerpot buy = hash.buy.get(number);
				flowerpot f =hash.fwr.get(number);
				//int totalcount = f.getStock()+buy.getBuyflowerstock(); //상품 재고량 + 구매수량
				//f.setStock(totalcount); //위 값을 상품재고량에 값을 돌려줌
				hash.buy.remove(number, buy);
				
				System.out.println("	"+number+"번 식물이 환불 되었습니다.");
				mu.adminStrockMenu();
			}else {
				System.out.println("	잘못 입력하셨습니다. 다시 입력하세요.");
				sc.next();
				productRemove();
			}
		}catch(Exception e) {
			e.getMessage();
		}
		System.out.println();
	}

	//결산
	@Override
	public void saleTotal() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 주문 결산  ]");

		System.out.println("	    "+money+"원입니다.");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.println("	이전으로 : [0] ");
		int b = sc.nextInt();
		if(b==0) {
			mu.adminAdminMenu();
		}else {
			b=sc.nextInt();
		}
	}
	
	public void listInfo() { //상품목록 메서드
		for(Map.Entry<Integer, flowerpot> str : hash.fwr.entrySet()) {
			int key = str.getKey();
			flowerpot value = str.getValue();
			value.listInfo();
		}
	}
}


