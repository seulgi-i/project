/*
 * 작성일 : 2022-07-15
 * 작성자 : 최슬기
 * 클래스 설명 : 관리자, 구매자 클래스 hashmap 모아둔 클래스
 */
package Controller;

import java.util.HashMap;
import java.util.Map;

import domain.flowerpot;

public class Hash {
	static Map<Integer,flowerpot> fwr = new HashMap<Integer,flowerpot>(); //관리자 상품
	static Map<Integer,flowerpot> buy = new HashMap<Integer,flowerpot>();//결제 요청
	static Map<Integer,flowerpot> count = new HashMap<Integer,flowerpot>(); //장바구니 수량
	static Map<Integer,flowerpot> refund = new HashMap<Integer,flowerpot>(); //환불 요청 목록
}
