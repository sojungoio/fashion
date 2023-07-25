	function redirectToRegistPage() {
		window.location.href = "regist.do";
	}
	function redirectToSearchPage() {
		window.location.href = "search.do";
	}
	function redirectToFristPage() {
		window.location.href = "frist.do";
	}
    function checkValue()
    {
        inputForm = eval("document.loginInfo");
        if(!inputForm.identified.value)
        {
            alert("아이디를 입력하세요");    
            inputForm.identified.focus();
            return false;
        }
        if(!inputForm.password.value)
        {
            alert("비밀번호를 입력하세요");    
            inputForm.password.focus();
            return false;
        }
    }