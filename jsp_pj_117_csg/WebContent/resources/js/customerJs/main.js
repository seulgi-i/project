//3-3.1
//const : 변수명 설정..
const toggleBtn = document.querySelector('.navbar_toggleBtn');	//햄버거버튼
const menu = document.querySelector('.navbar_menu');
const icons = document.querySelector('.navbar_icons');



//addEventListener API를 통해 클릭이 될때마다 지정한 함수 호출
toggleBtn.addEventListener('click', () => {	//햄버거 버튼이 클릭되면..
	//alert('test');
	menu.classList.toggle('active') //숨어있던 메뉴버튼을 부활시켜('활성화')
	icons.classList.toggle('active')//숨어있던 아이콘을 부활시켜
});

