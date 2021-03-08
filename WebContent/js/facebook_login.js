
  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
    	FB.login(function(response) {
  		  if (response.status === 'connected') {
  			testAPI();
  		  } 
  		  else {
  			  console.log('로그인 에러'); 
  		  }
  		},{scope: 'public_profile, email,user_gender'});
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '273273647151212',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v7.0'           // Use this Graph API version for this call.
    });
  }

  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
	    FB.api('/me',{fields: 'email,name,gender'}, function(response) {
	      console.log(response);
	      let param = {};
	      param.name = response.name;
	      param.email = response.email;
	      param.userEmail = response.email;
	      param.gender = response.gender;
	      param.pwd = response.id;
	      param.tel = '010-1234-5678';
	      param.role = 'ROLE_MEM';
	      param.enable = 1;
	      param.age = null;
	      param.weight = null;
	      param.height = null;
	      console.log(param.mem_pwd);
	      
	      $.ajax({
				url:'./snsInsert.hst',
				data:param,
				type:'post',
				success:function(data){
					console.log(data);
					location.replace("/proj/Home/ToHomePage.hst");
				},
				error:function(e){console.log('에러:',e)}
			});
	    })
  }