$(function() {
	//아이디 중복검사
	$('#identified').on('focusout', function() {
		let id = $('#identified').val();
		$.ajax({
			url: "idCheck.do",      // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			type: "post",         // HTTP 요청방식 (get/post)
			data: { "identified": id },         // HTTP 요청과 함께 서버로 보낼 데이터
			dataType: 'text',      // 서버에서 보내줄 데이터의 타입
			// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
			success: function(result) {
				if (result == 0) {
					$("#idCheckMsg").html('이미 사용중인 아이디 입니다.');
					isDuplicate = true;
				} else {
					$("#idCheckMsg").html('사용할 수 있는 아이디 입니다.');
					isDuplicate = false;
				}
			},
			error: function() {
				alert("서버요청실패");
			}
		})
	});

	// 비밀번호 확인
	$('#passwordOk').blur(function() {
		if ($('#password').val() != $('#passwordOk').val()) {
			if ($('#passwordOk').val() != '') {
				alert("비밀번호가 일치하지 않습니다.");
				$('#passwordOk').val('');
				$('#passwordOk').focus();
			}
		}
	});
	// 입력 이름 형식 중복 검사
	$('#name').on('focusout', function() {
		let name = $('#name').val();
		$.ajax({
			url: "nameCheck.do",      // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			type: "post",         // HTTP 요청방식 (get/post)
			data: { "name": name },         // HTTP 요청과 함께 서버로 보낼 데이터
			dataType: 'text',      // 서버에서 보내줄 데이터의 타입
			// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
			success: function(result) {
				if (result == 0) {
					$("#nameCheckMsg").html('이미 사용중인 이름 입니다.');
				} else {
					$("#nameCheckMsg").html('사용할 수 있는 이름 입니다.');
				}
			},
			error: function() {
				alert("서버요청실패");
			}
		})
	});

	// 입력 이메일 형식 중복 검사
	$('#email').on('focusout', function() {
		let email = $('#email').val();
		$.ajax({
			url: "emailCheck.do",      // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			type: "post",         // HTTP 요청방식 (get/post)
			data: { "email": email },         // HTTP 요청과 함께 서버로 보낼 데이터
			dataType: 'text',      // 서버에서 보내줄 데이터의 타입
			// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
			success: function(result) {
				if (result == 0) {
					$("#emailCheckMsg").html('이미 사용중인 이메일 입니다.');
					isDuplicate = true;
				} else {
					$("#emailCheckMsg").html('사용할 수 있는 이메일 입니다.');
					isDuplicate = flase;
				}
			},
			error: function() {
				alert("서버요청실패");
			}
		})
	});

	// 입력 닉네임 형식 중복 검사
	$('#nickname').on('focusout', function() {
		let nickname = $('#nickname').val();
		$.ajax({
			url: "nicknameCheck.do",      // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			type: "post",         // HTTP 요청방식 (get/post)
			data: { "nickname": nickname },         // HTTP 요청과 함께 서버로 보낼 데이터
			dataType: 'text',      // 서버에서 보내줄 데이터의 타입
			// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
			success: function(result) {
				if (result == 0) {
					$("#nicknameCheckMsg").html('이미 사용중인 닉네임 입니다.');
				} else {
					$("#nicknameCheckMsg").html('사용할 수 있는 닉네임 입니다.');
				}
			},
			error: function() {
				alert("서버요청실패");
			}
		})
	});
});
// 회원가입 유효성 검사
function checkValidation() {
	const joinForm = document.joinForm;
	//const result = document.getElementById("idCheckMsg"); // 중복검사 결과창 태그 - 사용 중
	//const result1 = document.getElementByEmail("emailCheckMsg");
	const userid = joinForm.identified;
	const userpw = joinForm.password;
	const usepwOK = joinForm.passwordOk;
	const username = joinForm.nickname;
	const usere = joinForm.email;
	const name = joinForm.name;
	let isDuplicate = false;

	if (userid.value == "") {
		alert("아이디를 입력하세요!");
		userid.focus();
		return false;
	}
	if (userid.value.length < 5 || userid.value.length > 12) {
		alert("아이디는 5자 이상 12자 이하로 작성해주세요!");
		userid.focus();
		return false; // 글자 수 
	}
	if (userpw.value == "") {
		alert("비밀번호를 입력하세요!");
		userid.focus();
		return false;
	}
	if (usepwOK.value == "") {
		alert("비밀번호를 확인해주세요!");
		userid.focus();
		return false;
	}
	if (usere.value == "") {
		alert("이메일을 입력하세요!");
		userid.focus();
		return false;
	}
	if (username.value == "") {
		alert("닉네임을 입력하세요!");
		userid.focus();
		return false;
	}
	if (name.value == "") {
		alert("이름을 입력하세요!");
		userid.focus();
		return false;
	} else {
		alert('회원가입 완료')
	}
}