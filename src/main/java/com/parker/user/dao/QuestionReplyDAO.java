package com.parker.user.dao;

import com.parker.user.vo.QuestionReplyVO;

public interface QuestionReplyDAO {

	QuestionReplyVO questionReply(int question_number);
	
}
