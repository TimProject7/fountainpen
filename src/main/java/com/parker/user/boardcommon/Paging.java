package com.parker.user.boardcommon;

import com.parker.user.vo.QuestionVO;

public class Paging {
	public static void set(QuestionVO QVO) {
		//한페이지
		int page = Util.nvl(QVO.getPage(), 1);
		//총페이지수
		int pageSize = Util.nvl(QVO.getPageSize(), 10);
		
		//널값일때 조건
		if (QVO.getPage() == null) {
			QVO.setPage(page + "");
		}
		if (QVO.getPageSize() == null) {
			QVO.setPageSize(pageSize + "");
		}
		
		
		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		QVO.setStart_row(start_row + "");
		QVO.setEnd_row(end_row + "");
	}
}
