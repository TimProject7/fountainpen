package com.parker.user.boardcommon;



public class Paging {
	public static void set(PagingVO pvo) {
		// 한페이지
		int page = Util.nvl(pvo.getPage(), 1);
		// 총페이지수
		int pageSize = Util.nvl(pvo.getPageSize(), 10);

		// 널값일때 조건
		if (pvo.getPage() == null) {
			pvo.setPage(page + "");
		}
		if (pvo.getPageSize() == null) {
			pvo.setPageSize(pageSize + "");
		}

		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		pvo.setStart_row(start_row + "");
		pvo.setEnd_row(end_row + "");
		
		
		
	}
	
	

	
}
