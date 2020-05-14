package com.juji.client.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.juji.client.board.service.BoardService;
import com.juji.client.board.vo.BoardVO;
import com.juji.client.common.file.FileUploadUtil;
import com.juji.client.common.page.Paging;
import com.juji.client.reply.vo.ReplyVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	private Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardservice;
	
	@RequestMapping(value = "/boardList",method=RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute BoardVO bvo) {
		ModelAndView model = new ModelAndView();
		
		int total;
		//페이지 세팅
		
		Paging.setPage(bvo);
		
		
		if(bvo.getQ_category() != null) {
		
		if(bvo.getQ_category().equals("기타") || bvo.getQ_category().equals("환불/반품")) {
					total = boardservice.ectCnt(bvo);
		} else {
					total = boardservice.boardListCnt(bvo);	
			}
		}else {
					total = boardservice.boardListCnt(bvo);
		}
		
		List<BoardVO> list = boardservice.boardList(bvo);
		model.addObject("boardList",list);
		model.addObject("total",total);
		model.addObject("bvo",bvo);
		model.setViewName("/board/boardList");
		
		
		return model;
	}
	
	@RequestMapping(value = "/boardDetail",method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView Detail(@ModelAttribute BoardVO bvo) {
		ModelAndView model = new ModelAndView();
		log.info("게시글 상세 보기");
		
		List<ReplyVO> reply = boardservice.replyList(bvo.getQ_num());
		
		int view = bvo.getQ_view()+1;
		
		bvo.setQ_view(view);
		
		
		boardservice.detailView(bvo);
		
		BoardVO board = new BoardVO();
		
		board = boardservice.detailBoard(bvo.getQ_num());
		board.setPage(bvo.getPage());
		model.addObject("detail",board);
		model.addObject("reply_list",reply);
		model.setViewName("/board/boardDetail");
		
		return model;
	}
	
	@RequestMapping(value = "/deleteBoard",method = RequestMethod.POST)
	public String deleteBoard(@RequestParam("q_num") int q_num,@ModelAttribute BoardVO bvo, HttpServletRequest req) throws IOException {
		log.info("게시글 삭제");
		
		if(!bvo.getQ_image1().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getQ_image1(), req);
			bvo.setQ_image1(null);
		}

		if(!bvo.getQ_image2().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getQ_image2(), req);
			bvo.setQ_image2(null);
		}
		
		if(!bvo.getQ_image3().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getQ_image3(), req);
			bvo.setQ_image3(null);
		}
		
		boardservice.deleteBoard(q_num);
		
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value = "/updateBoardForm",method = RequestMethod.GET)
	public ModelAndView updateBoard(@ModelAttribute BoardVO bvo) {
		ModelAndView model = new ModelAndView();
		log.info("게시 글 수정하기");
		
		
		BoardVO board = new BoardVO();
		
		board = boardservice.detailBoard(bvo.getQ_num());
		model.addObject("detail",board);
		model.setViewName("/board/boardUpdate");
		
		return model;
	}
	
	@RequestMapping(value = "/updateBoard",method = RequestMethod.POST)
	public String updateBoard(@ModelAttribute BoardVO bvo,HttpServletRequest req) throws IOException {
		
		
		if(!bvo.getFile1().isEmpty()) {
			if(!bvo.getQ_image1().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getQ_image1(), req);
				bvo.setQ_image1(null);
			}
				String file1 = FileUploadUtil.fileUpload(bvo.getFile1(),req,"board");
				bvo.setQ_image1(file1);
		}
		if(!bvo.getFile2().isEmpty()) {
			if(!bvo.getQ_image2().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getQ_image2(), req);
				bvo.setQ_image2(null);
			}
				String file2 = FileUploadUtil.fileUpload(bvo.getFile2(), req,"board");
				bvo.setQ_image2(file2);
		}
		if(!bvo.getFile3().isEmpty()) {
			if(!bvo.getQ_image3().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getQ_image3(), req);
				bvo.setQ_image3(null);
			}
			String file3 = FileUploadUtil.fileUpload(bvo.getFile3(), req,"board");
			bvo.setQ_image3(file3);
		}
		
		boardservice.updateBoard(bvo);
		
		return "redirect:/board/boardDetail?q_num="+bvo.getQ_num();
	}
	
	
	@RequestMapping(value = "/boardWrite",method = RequestMethod.GET)
	public String boardWrite() {
		return "/board/boardWrite";
	}
	
	@RequestMapping(value = "/insertBoard",method = RequestMethod.POST)
	public String insertBoard(@ModelAttribute BoardVO bvo,HttpSession session,HttpServletRequest req) throws IOException {
		
		bvo.setQ_reply("답변대기");
		
		if(!bvo.getFile1().isEmpty()) {
			System.out.println("file1="+bvo.getFile1());
			String file1 = FileUploadUtil.fileUpload(bvo.getFile1(),req,"board");
			bvo.setQ_image1(file1);
		}
		if(!bvo.getFile2().isEmpty()) {
			System.out.println("file2="+bvo.getFile2());
			String file2 = FileUploadUtil.fileUpload(bvo.getFile2(), req,"board");
			bvo.setQ_image2(file2);
		}
		if(!bvo.getFile3().isEmpty()) {
			System.out.println("file3="+bvo.getFile3());
			String file3 = FileUploadUtil.fileUpload(bvo.getFile3(), req,"board");
			bvo.setQ_image3(file3);
		}
		
		bvo.setId((String)session.getAttribute("id"));
			boardservice.insertBoard(bvo);
	
		return "redirect:/board/boardList";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchReply",method = RequestMethod.POST)
	public int searchReply(@ModelAttribute ReplyVO rvo) {
		int result;
		List<ReplyVO> reply = boardservice.replyList(rvo.getQ_num());
		if(!reply.isEmpty()) {
			result = 0;
		}else {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteReply",method = RequestMethod.POST)
	public int deleteReply(@RequestParam("q_num") int q_num,HttpServletRequest req) throws IOException {
		int result;
		
		System.out.println(q_num);
		
		List<ReplyVO> reply = boardservice.replyList(q_num);
		if(!reply.isEmpty()) {
			for(int i = 0; i<reply.size();i++) {
				if(reply.get(i).getA_image() != null && reply.get(i).getA_image().length() != 0) {
					FileUploadUtil.fileDelete(reply.get(i).getA_image(), req);
				}
			}
		}
		result = boardservice.replyDelete(q_num);
		System.out.println("삭제:   "+result);
		return result;
	}
}





























