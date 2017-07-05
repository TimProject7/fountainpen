package com.parker.user.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.parker.user.dao.FAQDao;
import com.parker.user.vo.FAQVO;

@Service
public class FAQServiceImpl implements FAQService{

	@Inject
	FAQDao faqDao;
	
	
    // 02. 게시글 상세보기
    @Override
    public FAQVO read(int faq_no) throws Exception {
        return faqDao.read(faq_no);
    }
    
    // 05. 게시글 전체 목록
    @Override
    public List<FAQVO> listAll( FAQVO fvo) throws Exception {
        return faqDao.listAll(fvo);
    }
    
    // 06. 게시글 조회수 증가
    @Override
    public void increaseViewcnt(int faq_no, HttpSession session) throws Exception {
        long update_time = 0;
        // 세션에 저장된 조회시간 검색
        // 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
        if(session.getAttribute("update_time_"+faq_no) != null){
                                // 세션에서 읽어오기
            update_time = (long)session.getAttribute("update_time_"+faq_no);
        }
        // 시스템의 현재시간을 current_time에 저장
        long current_time = System.currentTimeMillis();
        // 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
        // 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
        if(current_time - update_time > 5*1000){
            faqDao.increaseViewcnt(faq_no);
            // 세션에 시간을 저장 : "update_time_"+bno는 다른변수와 중복되지 않게 명명한 것
            session.setAttribute("update_time_"+faq_no, current_time);
            
        }
    }
	@Override
	public int listCnt(FAQVO fvo) {
		// TODO Auto-generated method stub
		return faqDao.listCnt(fvo);
	}
	
}
