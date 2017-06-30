package com.parker.user.boardcommon;

import com.parker.user.vo.BuyListVO;
import com.parker.user.vo.QuestionVO;
import com.parker.user.vo.UserBoardVO;
import com.parker.user.vo.DeliveryVO;
import com.parker.user.vo.ProductVO;

public class Paging {
	public static void set(QuestionVO QVO) {
		// 한페이지
		int page = Util.nvl(QVO.getPage(), 1);
		// 총페이지수
		int pageSize = Util.nvl(QVO.getPageSize(), 10);

		// 널값일때 조건
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

	public static void set(BuyListVO BVO) {
		// 한페이지
		int page = Util.nvl(BVO.getPage(), 1);
		// 총페이지수
		int pageSize = Util.nvl(BVO.getPageSize(), 10);

		// 널값일때 조건
		if (BVO.getPage() == null) {
			BVO.setPage(page + "");
		}
		if (BVO.getPageSize() == null) {
			BVO.setPageSize(pageSize + "");
		}

		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		BVO.setStart_row(start_row + "");
		BVO.setEnd_row(end_row + "");
	}

	public static void set(DeliveryVO DVO) {
		// 한페이지
		int page = Util.nvl(DVO.getPage(), 1);
		// 총페이지수
		int pageSize = Util.nvl(DVO.getPageSize(), 10);

		// 널값일때 조건
		if (DVO.getPage() == null) {
			DVO.setPage(page + "");
		}
		if (DVO.getPageSize() == null) {
			DVO.setPageSize(pageSize + "");
		}

		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		DVO.setStart_row(start_row + "");
		DVO.setEnd_row(end_row + "");
	}

	public static void set(UserBoardVO UBVO) {
		// 한페이지
		int page = Util.nvl(UBVO.getPage(), 1);
		// 총페이지수
		int pageSize = Util.nvl(UBVO.getPageSize(), 10);

		// 널값일때 조건
		if (UBVO.getPage() == null) {
			UBVO.setPage(page + "");
		}
		if (UBVO.getPageSize() == null) {
			UBVO.setPageSize(pageSize + "");
		}

		int start_row = (page - 1) * pageSize + 1;
		int end_row = (page - 1) * pageSize + pageSize;

		UBVO.setStart_row(start_row + "");
		UBVO.setEnd_row(end_row + "");
	}

	public static void set(ProductVO pvo) {
		// TODO Auto-generated method stub
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
