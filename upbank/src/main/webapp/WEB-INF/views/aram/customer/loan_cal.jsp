<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>대출 이자 계산기</title>
</head>
<body>
	<div class="eight columns bottom-3">
        <h3 class="title bottom-2">대출 계산기 : 
	        <c:if test="${param.kind == 'amortization'}">
	        	원리금 균등 상환
	        </c:if>
	        <c:if test="${param.kind == 'even_repayment'}">
	        	원금 균등 상환
	        </c:if>
	        <c:if test="${param.kind == 'repayment'}">
	        	원금 만기일시 상환
	        </c:if>
        </h3>
        
         <table class="style color">
          <tbody>
            <tr>
              <th>회차</th>
              <th>이자</th>
              <th>원금</th>
              <th>내야하는 금액</th>
            </tr>
            <c:forEach var="loan" items="${list}">
	            <tr>
	              <td>${loan.count}</td>
	              <td>
	              	<fmt:formatNumber value="${loan.installment_interest}" pattern="##,###,###원"/>
	              </td>
	              <td>
	              	<fmt:formatNumber value="${loan.installment_principal}" pattern="##,###,###원"/>
	              </td>
	              <td>
	              	<fmt:formatNumber value="${loan.installment}" pattern="##,###,###원"/>
	              </td>
	            </tr>
            </c:forEach>
            <c:if test="${repay_interest != null}">
           		<tr>
           			<td>1~${month-1}</td>
           			<td>
           				<fmt:formatNumber value="${repay_interest}" pattern="##,###,###원"/>
           			</td>
           			<td>0</td>
           			<td>
						<fmt:formatNumber value="${repay_interest}" pattern="##,###,###원"/>
					</td>
           		</tr>
           		<tr>
           			<td>${month}</td>
           			<td>
           				<fmt:formatNumber value="${repay_interest}" pattern="##,###,###원"/>
           			</td>
           			<td>
           				<fmt:formatNumber value="${principal}" pattern="##,###,###원"/>
           			</td>
           			<td>
           				<fmt:formatNumber value="${principal + repay_interest}" pattern="##,###,###원"/>
           			</td>
           		</tr>
            </c:if>
            <tr>
            	<td colspan="3" style="text-align:right">
            		총 이자액
            	</td>
            	<td>
            		<fmt:formatNumber value="${total_interest}" pattern="##,###,###원"/>
            	</td>
            </tr>
          </tbody>
        </table>
        
       </div><!-- End column -->
</body>
</html>