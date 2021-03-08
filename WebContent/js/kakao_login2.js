Kakao.init('c0e6cc61e58211222f29b50be0f8c221')
	console.log(Kakao.isInitialized());
  function loginWithKakao() {
    Kakao.Auth.login({
      	success: function(authObj) {
        kakaoTestApi();
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    })
  }
  
  function kakaoTestApi(){
	  Kakao.API.request({
		    url: '/v2/user/me',
		    success: function(response) {
		        console.log(response);
		        console.log(response['kakao_account']['email']);
		        let params = {};
			      params.name = response['properties']['nickname'];
			      params.email = response['kakao_account']['email'];
			      params.userEmail = response['kakao_account']['email'];
			      params.gender = response['kakao_account']['gender'];
			      params.pwd = response['id'];
			      params.tel = '010-1234-5678';
			      params.role = 'ROLE_MEM';
			      params.enable = 1;
			      params.age = response['kakao_account']['age_range'].substring(0,2);
			      console.log(params.age);
			      params.weight = null;
			      params.height = null;
			      console.log("파람스"+params.tel);
			      $.ajax({
						url:'./snsInsert.hst',
						data:params,
						type:'post',
						success:function(data){
							console.log(data);
							location.replace("/proj/Home/ToHomePage.hst");
						},
						error:function(e){console.log('에러:',e)}
					});
		    },
		    fail: function(error) {
		        console.log(error);
		    }
		});
  }