package org.hj.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.hj.model.AttachFileVO;
import org.hj.model.BoardVO;
import org.hj.model.CriteriaVO;
import org.hj.model.LoginVO;
import org.hj.model.PageVO;
import org.hj.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {
	
	// 비지니스 모델을 컨트롤러에 연결하기
	@Autowired
	BoardService bs;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	// 게시판 목록 리스트
	public String list(Model model, CriteriaVO cri) {
		System.out.println("move to list page");
		System.out.println(cri);
		model.addAttribute("list", bs.list(cri));
		int total=bs.total(cri);
		model.addAttribute("paging", new PageVO(cri, total));
		return "board/list";
	}
	// login에서 게시판으로 넘어올때 아이디값을 감추기 위해서 post를 사용했음.
	// 원래 post로 사용중이였음. [43 ~ 57 2023.04.11 오후 12:35분]
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	// 게시판 목록 리스트
	public String list_p(Model model, CriteriaVO cri) {
		System.out.println("move to list page");
		System.out.println(cri);
		// list.jsp 실행 할 때 select 된 결과를 가져와라
		model.addAttribute("list", bs.list(cri));
		// list.jsp 실행 할 때 PageVO에 저장되어 있는 데이터를 가져와라.
		//                           생성자 호출(매개변수가 2개인 생성자)
		// board테이블(게시판테이블)에 전체 건수(select해서)를 아래에 190대신에 대입
		int total=bs.total(cri);
		//model.addAttribute("paging", new PageVO(cri, 190));
		model.addAttribute("paging", new PageVO(cri, total));	//페이지 네이션
		return "board/list";
	}
	
	 //게시판 상세 페이지
		@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
		public String detail(int bno, BoardVO board, Model model, HttpSession session) {
//			BoardVO board = new BoardVO();
			board.setBno(bno);
			BoardVO detail = bs.detail(board);
			
			// Model 객체를 이용해 View로 전달할 데이터 저장
			model.addAttribute("board",detail);
			
			// 게시글 작성자 ID 가져오기
			String writerId = detail.getId();
			
			// 로그인한 사용자 ID 가져오기
			LoginVO login = (LoginVO)session.getAttribute("login");
			String userId = login.getId();
			
			// 게시판을 가져오기 위해서 작성  4.14(금) 10:30 작성
			model.addAttribute("detail", bs.detail(board));	
			// 현재 사용자가 게시글 작성자인 경우에만 삭제 버튼 표시
			if(userId.equals(writerId)) {
				model.addAttribute("isOwner", true);
			} else {
				model.addAttribute("isOwner", false);
			}
			
			System.out.println(board);
			return "board/detail";
		}
		
//		 //게시판 상세 페이지(원본)
//		@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
//		// public String detail(int bno){
//		public String detail (BoardVO board, Model model) {
//			System.out.println(board);
////			bs.detail(bno);
//			model.addAttribute("detail", bs.detail(board));
//			return "board/detail";
//		}
	
//	게시판 상세 페이지 , 권한이 있는 사람에게만 삭제 수정을 부여하도록
//	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
//	public String detail(@RequestParam("bno") String bno, Model model, HttpSession session) {
//	    // String 타입으로 전달받은 파라미터를 int 타입으로 변환
//	    int boardNo = Integer.parseInt(bno);
//	    
//	    // BoardVO 객체 생성 후 게시글 정보 저장
//	    BoardVO board = new BoardVO();
//	    board.setBno(boardNo);
//	    BoardVO detail = bs.detail(board);
//	    
//	    // Model 객체를 이용해 View로 전달할 데이터 저장
//	    model.addAttribute("board", detail);
//
//	    // 게시글 작성자 ID 가져오기
//	    String writerId = detail.getId();
//	    
//	    // 로그인한 사용자 ID 가져오기
//	    LoginVO login = (LoginVO)session.getAttribute("login");
//	    String userId = login.getId();
//	    
//	    // 현재 사용자가 게시글 작성자인 경우에만 삭제 버튼 표시
//	    if(userId.equals(writerId)) {
//	        model.addAttribute("isOwner", true);
//	    } else {
//	        model.addAttribute("isOwner", false);
//	    }
//	    
//	    return "board/detail";
//	}// 현재 제목 클릭하면 디테일에서 값을 못받아온다. -> 수정눌러도 반응이없음 해결


	
	// 게시판 수정
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public String modify (BoardVO board, RedirectAttributes rttr) {
		bs.modify(board);
		rttr.addAttribute("bno", board.getBno());
		// 수정하고 난 뒤 확인을 위해 상세페이지로 화면이동
		return "redirect:/list/detail?bno=" + board.getBno();
	}
	
	// 게시판 삭제
		@RequestMapping(value = "/board/remove", method = RequestMethod.POST)
		public String remove (BoardVO board) {
			bs.remove(board);
			return "redirect:/list";
	}
		
//		// 게시판 수정 [기존 수정 삭제]
//		@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
//		public String modify (BoardVO board, RedirectAttributes rttr) {
//			bs.modify(board);
//			rttr.addAttribute("bno", board.getBno());
//			// 수정하고 난 뒤 확인을 위해 상세페이지로 화면이동
//			return "redirect:/list";
//		}
//		
//		// 게시판 삭제
//			@RequestMapping(value = "/board/remove", method = RequestMethod.POST)
//			public String remove (BoardVO board) {
//				bs.remove(board);
//				return "redirect:/list";
//		}
	
	// 게시판 글쓰기 페이지
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
	    return "board/write";
	}

	// 게시판 글쓰기 페이지(insert)
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	// HttpSession을 이용해 현재 세션에 로그인한 작성자가 글을 작성할때 id가 올라가도록 처리해줌.
	public String writePost(BoardVO board, HttpSession session) {
		// HttpSession 객체를 이용해 "login"이라는 이름으로 저장된 LoginVO 타입의 객체를 가져옵니다.
		LoginVO loginMember = (LoginVO)session.getAttribute("login");
		// 게시글 객체의 작성자 id 값을 로그인한 사용자의 id 값으로 지정해줍니다.
		board.setId(loginMember.getId());
	    System.out.println(board);
	    // 비지니스 영역 연결한 후 BoardService
	    bs.write(board);
	    return "redirect:/list";
	}
	
	// 해당 게시물의 첨부파일의 데이터를 ajax로 전송
	@RequestMapping(value = "attachlist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<AttachFileVO>> uploadAjaxPost(int bno){
		return new ResponseEntity<>(bs.attachlist(bno),HttpStatus.OK);
	}
}
