
function showModal() {
	var blurBackground = document.querySelector('.blur-background');
	var modal = document.querySelector('.modal');

	blurBackground.style.display = 'block';
	modal.style.display = 'block';
}

function hideModal() {
	var blurBackground = document.querySelector('.blur-background');
	var modal = document.querySelector('.modal');

	blurBackground.style.display = 'none';
	modal.style.display = 'none';
}
function showDropdown(season) {
	var dropdown = document.getElementById(season + "Dropdown");
	dropdown.style.display = "block";
}

function hideDropdown(season) {
	var dropdown = document.getElementById(season + "Dropdown");
	dropdown.style.display = "none";
}

function redirectToFristPage() {
	window.location.href = "frist.do";
}
function InfoCheck() {
	inputForm = eval("document.updateInfo");
	if (!inputForm.password.value) {
		alert("비밀번호를 입력하세요");
		inputForm.password.focus();
		return false;
	}
	if (!inputForm.passwordOk.value) {
		alert("비밀번호 확인을 입력하세요");
		inputForm.passwordOk.focus();
		return false;
	}
	if (inputForm.password.value != inputForm.passwordOk.value) {
		alert("비밀번호와 비밀번호확인은 값이 같아야합니다.");
		inputForm.passwordOk.focus();
		return false;
	}
}