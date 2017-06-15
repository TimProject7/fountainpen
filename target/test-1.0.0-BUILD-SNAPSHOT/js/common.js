
function chkSubmit(v_item, v_name) {
		if (v_item.val().replace(/\s/g, "") == "") {
			alert(v_name + " 확인해 주세요.");
			v_item.val("");
			v_item.focus();
			return false;

		} else {
			return true;
		}
	}

