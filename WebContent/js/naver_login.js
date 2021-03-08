var naverLogin = new naver.LoginWithNaverId({
	clientId : "J1cxuz7Jr6xgeCNRV13x",
	callbackUrl : "http://localhost:8090/proj/Home/ToHomePage.hst",
	isPopup : true,
/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
});
/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
naverLogin.init();

/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
$('#naver').click(function(){
	naverLogin.getLoginStatus(function(status) {
		if (status) {
			let param = {};
			/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
			param.email = naverLogin.user.getEmail();
			param.name = naverLogin.user.getNickName();	
			param.pwd = naverLogin.user.getId();
			param.age = naverLogin.user.getAge();
			console.log(param.uniqId);
		} else {
			console.log(status)
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});