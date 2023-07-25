       function checkValue() {
            /* boardForm 태그 선택 */
            const form = document.validateForm(form);

		function validateForm(form) {
			}
			if (form.title.value == "") {
				alert("제목을 입력하세요.");
				form.title.focus();
				return false;
			}
			if (form.season.value == "") {
				alert("계절을 선택하세요.");
				return false;
			}
			if (form.age.value == "") {
				alert("나이를 선택하세요.");
				return false;
			}
			if (form.file.value == "") {
				alert("첨부파일을 넣어주세요.");
				return false;
			}
		}
        
        /* 취소 버튼 클릭 시 */
        function goToList() {
            /* 게시판 목록으로 돌아가기  */
            location.href = "frist.do";
        }
        
        /* 이미지 여러개 미리 보기 */
        
		function setDetailImage(event){
			for(var image of event.target.files){
				var reader = new FileReader();
				
				reader.onload = function(event){
					var img = document.createElement("img");
					img.setAttribute("src", event.target.result);
					img.setAttribute("class", "col-lg-6");
					document.querySelector("div#images_container").appendChild(img);
				};
				
				console.log(image);
				reader.readAsDataURL(image);
			}
		}