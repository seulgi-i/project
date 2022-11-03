<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>





<div id="display">
<br><br><br>
 <span style="font-weight: 700;margin-left: 10px;"><fmt:formatNumber pattern="###,###,###" value="${dto.balance * dto.month/12 * dto.rate/100}" />원</span>을 더해 
 총 <span style="font-weight: 700;"><fmt:formatNumber pattern="###,###,###" value="${dto.balance * dto.month/12 * dto.rate/100 + dto.balance}"/>원</span>을
		 모으실 수 있습니다.
		 <br><br><br><br>
	</div>
	
		<div class="eight columns bottom-3" style="width: 772px;">
									<div id="content_two2" class="tabscontent">
										<table class="style color">
								          <tbody>
								            <tr>
								              <th>구분</th>
								              <th>만기금액</th>
								              <th>이자</th>
								            </tr>
								            <tr>
								              <td>비과세</td>
								              <td><fmt:formatNumber pattern="###,###,###" value="${dto.balance * dto.month/12 * dto.rate/100 + dto.balance}"/>원</td>
								              <td><fmt:formatNumber pattern="###,###,###" value="${dto.balance * dto.month/12 * dto.rate/100}" />원</td>
								            </tr>
								            <tr>
								              <td>일반과세 (세후)</td>
								              <td><fmt:formatNumber pattern="###,###,###" 
								              value="${dto.balance * dto.month/12 * dto.rate/100 + dto.balance - dto.balance * dto.month/12 * dto.rate/100 *0.154}"/>원</td>
								              <td><fmt:formatNumber pattern="###,###,###" 
								              value="${dto.balance * dto.month/12 * dto.rate/100 - dto.balance * dto.month/12 * dto.rate/100 *0.154}" />원 </td>
								            </tr>
								         
								          </tbody>
								            	
								        </table>
								       			 <pre>
												* 일반과세의 경우 이자금액의 15.4%가 원천징수되고 비과세 종합저축의 경우 이자소득세가 면제됩니다.
												* 비과세종합저축은 가입대상자에 한해 5천만원 한도로 적용됩니다.
												* 관련세법에 따른 세율변경 시 변경된 세율이 적용됩니다.
												* 본 계산결과는 만기 및 이자금액 계산을 위한 단순 예시로 각 상품별 세제혜택 내용에 따라 달라질 수 있습니다.
												</pre>
									</div>

								
							</div>

	

</body>
</html>