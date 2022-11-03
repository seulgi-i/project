/*
 * 작성일 : 2022-07-15
 * 작성자 : 최슬기
 * 클래스 설명 :메뉴, 코드 맵의 부모클래스 menu, code인터페이스를 구현.
 */





package View;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import Controller.AdminImpl;
import Controller.CustomerImpl;
import domain.Code;
import domain.flowerpot;


public class MenuImpl implements Menu, Code {

	static Scanner sc = new Scanner(System.in);

	public static AdminImpl ad = AdminImpl.getInstance();
	public static CustomerImpl cd = CustomerImpl.getInstance();
	public static flowerpot fw = flowerpot.getInstance();
	Map<String,String> hash;
	public MenuImpl() {
		hash = new HashMap <String, String>();
	}


	private static MenuImpl mu = new MenuImpl();
	public static MenuImpl getInstance() {
		if(mu == null) {
			mu = new MenuImpl();
		}
		return mu;
	}

	@Override
	public void commonMenu(int num) {
		switch(num) {
		case  SHOP_LOGIN : loginMenu(); 		//로그인
		break;
		case ADMIN_MENU : adminMenu();		//관리자메인화면
		break;
		case  ADMIN_MENU_LOGIN : adminLogin();//관리자 로그인
		break;
		case  ADMIN_STOCK_MENU : adminStrockMenu();	//재고관리
		break;
		case ADMIN_GOODS_LIST : ad.productList();//상품목록(싱글톤을 통해서 가야함 구현된 메서드로 가야함 밑 오버라이드에 없는 애들은 인터페이스로 접근.)
		break;
		case ADMIN_GOODS_ADD : ad.productAdd();//상품추가
		break;
		case ADMIN_GOODS_UPDATE : ad.productdate();//상품 수정
		break;
		case ADMIN_GOODS_DEL : ad.productRemove();//상품삭제
		break;
		case ADMIN_ORDER_MENU : 
;//주문관리
		break;
		case ADMIN_ORDER_LIST : ad.orderList();//주문 목록
		break;
		case ADMIN_ORDER_CONFIRM : ad.orderConfirm();//결제승인
		break;
		case ADMIN_ORDER_CANCEL : ad.orderCancel();//결제취소
		break;
		case ADMIN_ORDER_TOTAL : adminTotalMenu(); //관리자 결산메뉴
		break;
		case GUEST_MENU : customerMenu();//고객 메인화면
		break;
		case GUEST_MENU_LOGIN : customerLogin();//고객 로그인
		break;
		case GUEST_GOODS : cd.cartList();//상품리스트
		break;
		case GUEST_CART_LIST : cd.cartList(); //장바구니 리스트
		break;
		case GUEST_CART_ADD : cd.cartAdd();//장바구니 담기
		break;
		case GUEST_CART_DEL : cd.cartRemove();//장바구니 삭제
		break;
		case GUEST_CART_BUY : cd.cartBuy(); //장바구니 구매
		break;
		case GUEST_NOW_BUY : cd.nowbuy();//상품 바로 구매
		break;
		case GUEST_REFUND : cd.refund(); //환불
		break;
		case 4 : 
			System.out.println("	프로그램 종료");
			sc.close();
			System.exit(0);

		default : 
			System.out.println("	존재하지 않는 메뉴입니다.");

		}
	}

	@Override
	public void loginMenu() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("    ****** 식물나라에 오신 걸 환영합니다. ******   ");
		System.out.println("                 [ 로그인  ] ");
		System.out.println("       1.관리자   "+"2.고객   "+"3.회원가입   "+"4.종료");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	메뉴 번호를 입력하세요. : ");

		try {
			int i = sc.nextInt();
			switch(i) {
			case 1 :commonMenu(ADMIN_MENU_LOGIN);
			break;
			case 2 :
				commonMenu(GUEST_MENU_LOGIN);
				break;
			case 3 :
				join();
				break;
			case 4 :
				commonMenu(4);
				break;
			default : commonMenu(ADMIN_MENU);
			}

		}catch(Exception e) {
			System.out.println("	잘못 입력 하셨습니다. 다시 입력해 주세요.");
			sc.close();
			loginMenu();
		}
	}

	@Override
	public void join() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 회원 가입 ]              ");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	ID를 입력하세요 : ");
		String id = sc.next();
		cd.setId(id);
		System.out.print("	PW를 입력하세요 : ");
		String pw = sc.next();
		cd.setPw(pw);
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("               [ 회원 가입 완료 ]              ");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		loginMenu();
	}


	@Override
	public void adminLogin() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                 [ 로그인  ]              ");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	    관리자 ID : ");
		String id=sc.next();
		if(id.equals(ad.ID)) {
			System.out.print("	    관리자 PW : ");
			String pw = sc.next();
			if(pw.equals(ad.PASSWORD)) {
				adminMenu();
			}else{
				System.out.println("	잘못된 PW입니다. 다시 입력하세요.");
				adminLogin();
			}
		}else {
			System.out.println("	잘못된 ID입니다. 다시 관리자모드에 입장해 주세요.");
			loginMenu();
		}
	}

	@Override
	public void customerLogin() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                 [ 로그인  ]              ");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	        고객 ID : ");
		String id=sc.next();
		if(id.equals(cd.getId())) {
			System.out.print("	        고객 PW : ");
			String pw = sc.next();
			if(pw.equals(cd.getPw())) {
				customerMenu();
			}else{
				System.out.println("	잘못된 PW입니다. 다시 입력하세요.");
				customerLogin();
			}
		}else {
			System.out.println("	잘못된 ID입니다. 다시 입장해 주세요.");
			loginMenu();
		}
	}

	@Override
	public void adminMenu() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 관리자 메뉴  ]                ");
		System.out.println("     1.재고 관리   2.주문 관리  3.결산    4.로그아웃");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	메뉴 번호를 입력하세요. : ");

		int ad = 0;
		try {
			ad=sc.nextInt();
			switch(ad) {
			case 1 :commonMenu(ADMIN_STOCK_MENU);
			break;
			case 2 :
				adminAdminMenu();
				break;
			case 3 :
				commonMenu(ADMIN_ORDER_TOTAL);
				break; 
			case 4 :
				commonMenu(SHOP_LOGIN);
				break;
			default : commonMenu(ADMIN_MENU);

			}
		}catch(Exception e) {
			System.out.println("	잘못 입력 하셨습니다. 다시 입력해 주세요.");
			sc.next();
			loginMenu();

		}
	}

	@Override
	public void adminStrockMenu() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                 [ 재고 관리  ]                ");
		System.out.println("      1.목록    2.추가    3.수정    4.삭제    5.이전");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	메뉴 번호를 입력하세요. : ");
		int ad = 0;
		try {
			ad=sc.nextInt();
			switch(ad) {
			case 1 :commonMenu(ADMIN_GOODS_LIST);
			break;
			case 2 :
				commonMenu(ADMIN_GOODS_ADD);
				break;
			case 3 :
				commonMenu(ADMIN_GOODS_UPDATE);
				break;
			case 4 :
				commonMenu(ADMIN_GOODS_DEL);
				break;
			case 5 : commonMenu(ADMIN_MENU);
			break;
			}
		}catch(Exception e) {
			System.out.println("	잘못 입력 하셨습니다. 다시 입력해 주세요.");
			adminStrockMenu();
			sc.next();
		}
	}

	@Override
	public void adminAdminMenu() { //주문관리
		// TODO Auto-generated method stub
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("                [ 주문 관리  ]             ");
		System.out.println("   1.주문 목록  2.결제 승인  3.결제 취소  4.결산  5.이전");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	메뉴 번호를 입력하세요. : ");
		int ad = 0;
		try {
			
			ad=sc.nextInt();
			switch(ad) {
			case 1 :commonMenu(ADMIN_ORDER_LIST);
			break;
			case 2 :
				commonMenu(ADMIN_ORDER_CONFIRM);
				break;
			case 3 :
				commonMenu(ADMIN_ORDER_CANCEL);
				break;
			case 4 :
				commonMenu(ADMIN_ORDER_TOTAL);
				break;
			case 5 : commonMenu(ADMIN_MENU);
			break;
			}
		}catch(Exception e) {
			System.out.println("	잘못 입력 하셨습니다. 다시 입력해 주세요.");
			sc.next();
			adminStrockMenu();
		}
	}


	@Override
	public void adminTotalMenu() {
		ad.saleTotal();
	}

	@Override
	public void customerMenu() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("        ~ * 환영합니다 "+cd.getId()+"님! * ~ ");
		System.out.println("                [ 고객 메뉴  ]             ");
		System.out.println("     1.장바구니   2. 바로 구매  3. 환불    4.로그아웃");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	메뉴 번호를 입력하세요. : ");

		int ad = 0;
		try {
			ad=sc.nextInt();
			switch(ad) {
			case 1 :commonMenu(GUEST_CART_LIST);
			break;
			case 2 :
				commonMenu(GUEST_NOW_BUY);
				break;
			case 3 :
				commonMenu(GUEST_REFUND);
				break;
			case 4 :
				commonMenu(SHOP_LOGIN);
				break;
			default : commonMenu(GUEST_MENU);

			}
		}catch(Exception e) {
			System.out.println("	잘못 입력 하셨습니다. 다시 입력해 주세요.");
			customerMenu();
		}
	}

	@Override
	public void customerCartMenu() {
		System.out.println(" ┏━━━━━━━━━━»»————-　⚜   -————««━━━━━━━━━━┓");
		System.out.println("        ~ * 환영합니다 "+cd.getId()+"님! * ~ ");
		System.out.println("               [ 장바구니 메뉴  ]            ");
		System.out.println("       1.상품 추가   2.상품 삭제   3.구매    4.이전");
		System.out.println(" ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
		System.out.print("	메뉴 번호를 입력하세요. : ");
		int ad = 0;
		try {
			ad=sc.nextInt();
			switch(ad) {
			case 1 :commonMenu(GUEST_CART_ADD);
				break;
			case 2 :
				commonMenu(GUEST_CART_DEL);
				break;
			case 3 :
				commonMenu(GUEST_CART_BUY);
				break;
			case 4 :
				commonMenu(GUEST_MENU);
				break;
			default : commonMenu(GUEST_MENU);
			}
		}catch(Exception e) {
			System.out.println("	잘못 입력 하셨습니다. 다시 입력해 주세요.");
			customerCartMenu();
		}
		
	}
}



