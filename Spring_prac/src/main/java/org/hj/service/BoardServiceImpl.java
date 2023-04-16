package org.hj.service;

import java.util.ArrayList;

import org.hj.mapper.BoardAttachMapper;
import org.hj.mapper.BoardMapper;
import org.hj.model.AttachFileVO;
import org.hj.model.BoardVO;
import org.hj.model.CriteriaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper bm;	// board 테이블 mapper
	@Autowired
	BoardAttachMapper bam;
	
	// BoardService 에서 설계되어진 write 추상메서드를 구현
//	public void write(BoardVO board) {
//		// BoardMapper에 있는 write메서드를 호출
//		// 메서드의 매개변수를 통해 BoardVo 값을
//		// BoardMapper의 wirte 메서드로 전달
//		bm.write(board);
//		
//		board.getAttach().forEach(attach->{
//			System.out.println("service="+attach);
//		// AttachFileVO bno에 BoardVO의 bno를 저장
//			attach.setBno(board.getBno());
//			bam.insert(attach);
//		});
//	}
	
//	 22~35 수정한 코드
//	 첨부 파일이 null이면 forEach() 
//	 메서드가 호출되지 않고 NullPointerException 오류가 발생하지 않는다.
	public void write(BoardVO board) {
	    bm.write(board);
	    if (board.getAttach() != null) {
	        board.getAttach().forEach(attach -> {
	            System.out.println("service=" + attach);
	            attach.setBno(board.getBno());
	            bam.insert(attach);
	        });
	    }
	}

	
	// BoardService에서 설계되어진 list 추상메서드를 구현
	public ArrayList<BoardVO> list(CriteriaVO cri){
		return bm.list(cri);
	}
	
	@Transactional
	public BoardVO detail(BoardVO board) {
		// 상세페이지 조회 할때
		// 조회수 + 1 update
		bm.cntup(board);
		return bm.detail(board);
	}
	// BoardService에서 설계되어진 modify 추상메서드를 구현
	public void modify(BoardVO board) {
		bm.modify(board);
	}
	// BoardService에서 설계되어진 remove 추상메서드를 구현
	public void remove(BoardVO board) {
		bm.remove(board);
	}
	public int total(CriteriaVO cri) {
		return bm.total(cri);
	}
	// 첨부파일 조회 구현
	public ArrayList<AttachFileVO> attachlist(int bno){
		return bam.attachlist(bno);
	}
}
