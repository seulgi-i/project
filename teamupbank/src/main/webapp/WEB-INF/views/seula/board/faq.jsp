<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

  <%@ include file="/WEB-INF/views/common/setting.jsp" %>
  
  <title>공지사항</title>
  <!-- Favicons -->
  <link rel="shortcut icon" href="images/favicon.ico">
  
</head>
<body>

  <div id="wrap" class="boxed">
  
   <header>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
   </header><!-- <<< End Header >>> -->
   
   <div class="page-title">
     <div class="container clearfix">
       
       <div class="sixteen columns"> 
         <h1>고객센터</h1>
       </div>
       
     </div><!-- End Container -->
   </div><!-- End Page title -->
   
   <!-- Start main content -->
   <div class="container main-content clearfix">
   
    
   <!-- Start Sidebar Widgets -->
   <div class="five columns sidebar bottom-3">
   
     
     <!-- Categories Widget -->
     <div class="widget categories">
       <h3 class="title bottom-1">고객센터</h3><!-- Title Widget -->
       <ul class="arrow-list">
         <li><a href="notice.do">공지사항</a></li>
         <li><a href="faq.do">자주하는질문</a></li>
		<li><a href="cnsltInsert.do">상담신청</a></li>
		<li><a href="cnslt.do">상담내역</a></li>
       </ul><!-- End arrow-list -->
     </div>
     <!-- End -->
     
     <!-- Text Widget -->
     <div class="widget" style="margin-top:100px">
     <li style="text-indent: 1px;"><i class="icon-comments-alt s-20 color"></i>고객센터</li>
       <!-- Title Widget -->
       <p style="text-indent: 5px;">1588-1234</p>
       <p style="text-indent: 5px;">1599-1234</p>
     </div>
     <!-- End -->
     
     
   
   </div><!-- End Sidebar Widgets -->
   
   
   <!-- Start Posts -->
     <div class="sixteen columns bottom-3">
     
      <!-- ==================== Single Post ==================== -->
      <div class="post single style-1">
       <h3 class="title bottom-1">자주묻는질문</h3>
      
       <hr class="line bottom-3"></hr>
<div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item">
    <h6 class="accordion-header" id="flush-heading1">
      <button style="font-size:15px" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse1" aria-expanded="false" aria-controls="flush-collapse1">
       개인 통장 비밀번호가 5회 오류 되었는데 은행 방문없이 오류를 해제하는 방법이 있나요?
      </button>
    </h6>
    <div id="flush-collapse1" class="accordion-collapse collapse" aria-labelledby="flush-heading1" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
         <pre style="font-size:15px">
      ▶ 오류 계좌의 비밀번호를 알고 계시고, 계좌비밀번호 5회 오류 해제만을 원하시는 경우, 
      「비대면실명확인」을 통해 오류 해제를 하실 수 있습니다.
[비대면실명확인 접속방법 : 택 1]
① 모바일 웹 https://m.wooribank.com > 전체메뉴(화면 오른쪽 상단 三) > 뱅킹관리 > 계좌비밀번호 오류 해제
② 스마트뱅킹 : 우리WON뱅킹 > 전체메뉴 > 인증/보안 > 비대면실명확인 > 뱅킹관리 > 계좌 비밀번호 오류 해제
※ 「비대면 실명확인」서비스 이용가능 조건(모두 충족)
① 만 19세 이상 내국인(외국인 거래불가)
② 본인명의 스마트폰 통신사 본인인증
③ 주민등록증 또는 운전면허증 직접촬영 후 본인인증
④ 우리은행 또는 타행의 본인 계좌로 본인확인절차 이행 가능한 고객
다만, 기등록된 비밀번호를 기억하지 못하시어 5회 오류가 된 경우로 계좌비밀번호 오류해제 및 재설정을 원하신다면,
영업점으로 신분증을 지참하시고 방문해 주셔야 합니다.
※ 지점방문이 어려우신개인고객님 (대한민국 국적의 만19세이상)을 위하여 바이오 정보 및 화상상담을 통해
 은행업무를 간편하게 처리할 수 있는 새로운 혁신 금융채널키오스크 (상담센터 ☎ 1800-5000)가 있습니다.
      </pre>
      </div>
    </div>
  </div>
  
  
  <div class="accordion-item">
    <h6 class="accordion-header" id="flush-heading2">
      <button style="font-size:15px" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse2" aria-expanded="false" aria-controls="flush-collapse2">
        공동명의로 통장을 만들 수 있나요?
      </button>
    </h6>
    <div id="flush-collapse2" class="accordion-collapse collapse" aria-labelledby="flush-heading2" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
  <pre style="font-size:15px">
    공동명의로 통장개설은 가능합니다.


▶ 공동명의로 통장 개설시 공동명의인 전원이 신분증과 통장에 사용할 도장을 지참하시고 은행을 방문하셔야 하며, 
통장명의는 대표 1명의 명의로 개설이 됩니다.
지급시는 공동명의 전원의 기명날인이 있어야 하며, 공동명의 예금주 각자가 분할 또는 단독으로는 찾으실 수 없습니다.
      </pre>
    </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h6 class="accordion-header" id="flush-heading3">
      <button style="font-size:15px" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse3" aria-expanded="false" aria-controls="flush-collapse3">
      적금에 자동이체 되어 있는데, 이번달만 자동이체 안하고 싶어요?
      </button>
    </h6>
    <div id="flush-collapse3" class="accordion-collapse collapse" aria-labelledby="flush-heading3" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
       <pre style="font-size:15px">
     자동이체는 1회차만 납부를 일시중지 할 수 없습니다.

자동이체를 해지한 후 원하시는 날짜에 자동이체가 시작되도록 다시 등록하셔야 합니다.
자동이체 해지는 이체지정일 전 영업일까지 하셔야 이번달에 납부가 되지 않습니다.
다시 재등록하는 경우 정기적립식 상품은 미납회차 체크하여 등록일 다음 영업일에 미납회차가 일괄자동이체로 출금됩니다.
      </pre>
    </div>
    </div>
  </div>

  <div class="accordion-item">
    <h6 class="accordion-header" id="flush-heading4">
      <button style="font-size:15px" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse4" aria-expanded="false" aria-controls="flush-collapse4">
      이름을 개명했는데 은행 업무는 어떻게 하나요?
      </button>
    </h6>
    <div id="flush-collapse4" class="accordion-collapse collapse" aria-labelledby="flush-heading4" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
       <pre style="font-size:15px">
      답변
예금주 본인께서 가까운 영업점 방문 후 개명에 의한 명의변경을 하셔야 합니다.

▶ 준비서류 (발급일로부터 3개월 이내, 주민등록번호 13자리 모두 기재)
- 개명 전, 후 확인되는 주민등록초본 (또는 기본증명서 상세)
- 개명 후 발급된 주민등록증 (또는 유효기간 내 주민등록증 발급신청 확인서)
- 통장 및 도장 (서명가능)
- 개명에 의한 명의변경 수수료는 없습니다.

※ 인터넷뱅킹 가입자의 경우 지점에서 명의 변경 후 조치사항
로그인 → 정보변경 → 고객정보변경 및 수정 (하단 확인버튼 클릭) → 로그아웃 → 재 로그인
      </pre>
    </div>
    </div>
</div>

  <div class="accordion-item">
    <h6 class="accordion-header" id="flush-heading5">
      <button style="font-size:15px" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse5" aria-expanded="false" aria-controls="flush-collapse5">
     예금자보호되는 금액은 얼마인가요?
      </button>
    </h6>
    <div id="flush-collapse5" class="accordion-collapse collapse" aria-labelledby="flush-heading5" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
       <pre style="font-size:15px">
    ▶ 원금과 소정의 이자를 합하여 1인당 최고 5,000만원(원화+외화예금 합산/세공금제전)까지 보호됩니다.
또한, 예금보호대상 금융상품으로 운용되는 확정기여형 또는 개인형퇴직연금 적립금을 합하여 가입자 1인당 
"최고 5천만원(세금공제전)" 까지 다른예금과 별도로 보호합니다. (2015.2.26 부터 보호금융상품 중 퇴직연금 별도 시행)

▶ 1인당 보호한도는 각 금융기관별로 적용되며, 동일 금융기관 본점 및 지점의 예금등은 모두 합산하여 적용됩니다.

▶ 소정의 이자란?
약정이자와 예금보험공사가 정하는 이자(시중은행 1년만기 정기예금의 평균금리를 감안하여 결정)중 적은금액을 말합니다. 
「이자」는 예금 가입일부터 보험금 지급공고일 (예금보험공사가 보험금을 지급하겠다고 신문 등에 공고 한 날) 까지 이자 발생분을 말합니다.

▶ 예금한 금융기관으로부터 대출을 받은 경우에는 대출받은금액을 차감한 후 1인당 보호한도가 적용됩니다.
(예시 : 1억원을 예금하고 예금한 은행으로부터 3천만원을 대출받았다면 1억원에서 3천만원과 대출이자 등을 차감하고 남은 금액중에서 5천만원까지 보호됨)
      </pre>
    </div>
    </div>
  </div>
</div>
     </div> 
     <!-- ==================== End Single Post  ==================== -->
     
     
     
   </div><!-- End Posts -->  
   
   <div class="clearfix"></div>
    
   </div><!-- <<< End Container >>> -->
   
   <footer>
       <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </footer><!-- <<< End Footer >>> -->
  
  </div><!-- End wrap -->
  
    
</body>
</html>