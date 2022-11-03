//3-3.1
//const (변수선언)
// => (에로우 펑션, 익명함수, 한 번 쓰고 말 것.)
const toggleBtn= document.querySelector('.navbar_toggleBtn');
const menu= document.querySelector('.navbar_menu');
const icons= document.querySelector('.navbar_icons');
//선택자를 조회. (navbar_toggleBtn는 클래스기때문에 .을 사용한다.)를 조회하고 함수 toggleBtn외2개에 넣어준다.



// addEventLister API를 통해 클릭이 될 때마다 지정한 함수를 호출.
//html에서 지정한 클래스 .navbar_toggleBtn에 있는 햄버거버튼이 click되면 메뉴와 아이콘을 부활(active)시킴.
toggleBtn.addEventListener('click',() => {
	//alert('test');  --팝업창 띄움
	menu.classList.toggle('active');
	icons.classList.toggle('active');

	
})