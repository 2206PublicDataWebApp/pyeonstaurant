
package com.kh.pyeonstaurant.qanda.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.qanda.domain.QA;
import com.kh.pyeonstaurant.qanda.domain.QAComment;
import com.kh.pyeonstaurant.qanda.service.QAService;
import com.kh.pyeonstaurant.recipe.service.RecipeService;

@Controller
public class QAController {
	
	@Autowired
	private QAService qService;
	
	/**쓰기창 연결
	 * 
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/qna/wirteForm.do", method = RequestMethod.GET)
	public ModelAndView showQandAWrite(ModelAndView mv, HttpSession session) {
		
//		로그인 유저용
		if(session.getAttribute("loginUser")==null) {
			mv.addObject("msg", "로그인한 유저만 작성가능합니다");
			mv.setViewName("common/error");
			return mv;
			
		}
		
		

		mv.setViewName("/qna/qnaWirteForm");

		return mv;

	}


	/**
	 * qna등록
	 * 
	 * @param mv
	 * @param qA
	 * @param upFile
	 * @return
	 */
	@RequestMapping(value = "/qna/Regist.do", method = RequestMethod.POST)
	public ModelAndView registQandA(ModelAndView mv, @ModelAttribute QA qA,
			@RequestParam(value = "upFile", required = false) List<MultipartFile> upFile, HttpSession session,
			HttpServletRequest request) {
		try {

			// 파일등록시작//
			String[] qaFile = new String[5];
			String[] qaFileRename = new String[5];
			for (int i = 0; i < upFile.size(); i++) {
				qaFile[i] = "";
				qaFileRename[i] = "";
				qaFile[i] = upFile.get(i).getOriginalFilename();

				if (!qaFile[i].equals("")) { // qaFile이 있을때

					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\qnaImg"; // 내가 저장할 폴더
					File file = new File(savePath); // 파일 객체 만들기

					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					qaFileRename[i] = sdf.format(new Date(System.currentTimeMillis())) + "qaImg" + i + "."
							+ qaFile[i].substring(qaFile[i].lastIndexOf(".") + 1);// 동시에여러사진이올라가기에 이름에 순서추가해줌

					if (!file.exists()) { // 경로에 savePath가 없을땐
						file.mkdir(); // 경로 만들기
					}
					upFile.get(i).transferTo(new File(savePath + "\\" + qaFileRename[i]));// 파일을 buploadFile경로에
																							// 저장
					
				}
				///// 여기까지 사진 저장코드/////

			}

			qA.setQaFile1(qaFile[0]);
			qA.setQaFile2(qaFile[1]);
			qA.setQaFile3(qaFile[2]);
			qA.setQaFile4(qaFile[3]);
			qA.setQaFile5(qaFile[4]);

			qA.setQaFile1Rename(qaFileRename[0]);
			qA.setQaFile2Rename(qaFileRename[1]);
			qA.setQaFile3Rename(qaFileRename[2]);
			qA.setQaFile4Rename(qaFileRename[3]);
			qA.setQaFile5Rename(qaFileRename[4]);

			int result = qService.registQandA(qA);
			mv.setViewName("redirect:/qna/List.do");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}

		return mv;
	}

	/**
	 * qa리스트
	 * 
	 * @param mv
	 * @param qA
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/qna/List.do", method = RequestMethod.GET)
	public ModelAndView allQAList(ModelAndView mv, @ModelAttribute QA qA,
			@RequestParam(value = "page", required = false) Integer page, 
			@RequestParam(value="searchCondition", required = false) String searchCondition,
			@RequestParam(value="searchValue", required = false) String searchValue,
			HttpSession session) {
		try {

			// 페이징중//
			int currentPage = (page != null) ? page : 1;
			// 현재 페이지
			// 만약 page값이 없으면 기본형 1로 출력할것, 아니면 받아온 page의 값을 준다.
			// 삼항연상자 사용

			int totalCount = qService.getTotalCount("", "");
			int boardLimit = 10; // 한 화면에 출력할 게시물 수
			int naviLimit = 5; // 한 화면에 출력할 게시판 페이지 수
			int maxPage; // 게시판의 총 페이지 수
			int startNavi; // 한 화면에 출력되는 게시판 페이지의 처음 수
			int endNavi;// 한 화면에 출력되는 게시판 페이지의 마지막 수

			maxPage = (int) ((double) totalCount / boardLimit + 0.9);
			startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
			endNavi = startNavi + naviLimit - 1;

			// endNavi가 maxNavi보다 커지는 오류방지
			if (maxPage < endNavi) {
				endNavi = maxPage;
			}
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			
			///페이징 종료////

			/////검색어 전송///
			mv.addObject("pageNow", currentPage);
			mv.addObject("searchValue",searchValue);
			mv.addObject("searchCondition",searchCondition);
			
			
			List<QA> qList = qService.allQAList(currentPage, boardLimit);
			
			//사용자 이름 출력영역
			String name[] = new String[qList.size()];
			for(int i=0; i<name.length;i++) {
				name[i]=qService.printMemberName(qList.get(i).getMemberEmail());
				qList.get(i).setName(name[i]);
					}
			
			mv.addObject("qList", qList);

			mv.setViewName("/qna/qnaList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}

		return mv;
	}

	/**
	 * qna수정창 연결
	 * 
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/qna/modifyView.do", method = RequestMethod.GET)
	public ModelAndView modifyQandAView(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam("qaNo") Integer qaNo) {
		
		
		try {
			

		
		
		QA qa = qService.printOneQANo(qaNo);
		mv.addObject("qa", qa);
		mv.setViewName("/qna/qnamodifyView");

		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
//			mv.setViewName("common/error");
		}
		return mv;
	}

	/**
	 * qa수정
	 * 
	 * @param mv
	 * @param qA
	 * @param upFile
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/qna/modify.do", method = RequestMethod.POST)
	public ModelAndView modifyOneQandA(ModelAndView mv, @ModelAttribute QA qA,
			@RequestParam(value = "upFile", required = false) List<MultipartFile> upFile, HttpSession session,
			HttpServletRequest request) {

		try {
			
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			if(!loginUser.getMemberEmail().equals(qA.getMemberEmail())&&loginUser.getAdminCheck()==false) {
			
				mv.addObject("msg", "작성자만 수정할 수 있습니다");
				mv.setViewName("common/error");
				return mv;
			}
			
			// 파일 교체 시작//

			String filename[] = new String[5];
			String fileRename[] = new String[5];
			String filesetName[] = { qA.getQaFile1Rename(), qA.getQaFile2Rename(), qA.getQaFile3Rename(),
					qA.getQaFile4Rename(), qA.getQaFile5Rename() };
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savedPath = root + "\\qnaImg";

			// 반복문으로 삭제/저장
			for (int i = 0; i < upFile.size(); i++) {
				filename[i] = upFile.get(i).getOriginalFilename();

				if (upFile.get(i) != null && !filename[i].equals("")) {

					File file = new File(savedPath + "\\" + filesetName[i]); // 이미 저장한 파일의 이름을 가져와야 한다.

					if (file.exists()) { // 지정한 파일이 있는지 없는지 체크
						file.delete(); // 있으면 삭제
					}

					////////// 여기부터 파일 재 업로드/////////////////////
					// 파일 이름으로 업로드하면 파일이름이 겹치면 파일이 겹쳐서 사라진다.
					// 고유한 rename으로 변경해주어야 한다.
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					fileRename[i] = sdf.format(new Date(System.currentTimeMillis())) + "qaImg" + i + "."
							+ filename[i].substring(filename[i].lastIndexOf(".") + 1);// 동시에여러사진이올라가기에 이름에 순서추가해줌

					upFile.get(i).transferTo(new File(savedPath + "\\" + fileRename[i]));// 파일을 buploadFile경로에
																							// 저장
					// 사진 저장 코드 종료//
				}
			}

			// 사진이름 qa에 넣어주기 시작//
			if (fileRename[0] != null) {
				qA.setQaFile1(filename[0]);
				qA.setQaFile1Rename(fileRename[0]);
			}
			if (fileRename[1] != null) {
				qA.setQaFile2(filename[1]);
				qA.setQaFile2Rename(fileRename[1]);
			}
			if (fileRename[2] != null) {
				qA.setQaFile3(filename[2]);
				qA.setQaFile3Rename(fileRename[2]);
			}
			if (fileRename[3] != null) {
				qA.setQaFile4(filename[3]);
				qA.setQaFile4Rename(fileRename[3]);
			}
			if (fileRename[4] != null) {
				qA.setQaFile5(filename[4]);
				qA.setQaFile5Rename(fileRename[4]);
			}

			int result = qService.modifyQandA(qA);
			int page = 1;
			mv.addObject("qa", qA);
			mv.addObject("page", page);
			mv.setViewName("redirect:/qna/detail.do?qaNo=" + qA.getQaNo());

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;

	}

	/**
	 * qa삭제
	 * 
	 * @param session
	 * @param mv
	 * @param qaNo
	 * @param memberEmail
	 * @return
	 */
	@RequestMapping(value = "/qna/remove.do", method = RequestMethod.GET)
	public ModelAndView removeQA(HttpSession session, ModelAndView mv, @RequestParam("qaNo") Integer qaNo,
			 @RequestParam("memberEmail")	String memberEmail) {
		try {
			
			//작성자 아니면 삭제금지
			Member loginUser = (Member)session.getAttribute("loginUser");
			System.out.println(loginUser.getMemberEmail());
			System.out.println(memberEmail);
			if(!loginUser.getMemberEmail().equals(memberEmail)&&loginUser.getAdminCheck()==false) {
				
				mv.addObject("msg", "작성자만 삭제할 수 있습니다");
				mv.setViewName("common/error");
				return mv;
			}
			
			

			int result = qService.reomoveOneQandANo(qaNo);
			mv.setViewName("redirect:/qna/List.do");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	/**
	 * qa상세창
	 * 
	 * @param mv
	 * @param qaNo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/qna/detail.do", method = RequestMethod.GET)
	public @ResponseBody ModelAndView viewDetailQa(ModelAndView mv, @RequestParam("qaNo") int qaNo, HttpSession session
			,@RequestParam(value="page", required = false) int page
			,@RequestParam(value="searchCondition", required = false) String searchCondition
			,@RequestParam(value="searchValue", required = false) String searchValue,
			@RequestParam(value="searchValue", required = false) Optional<String> sValue
			
			) {
		try {
			QA qa = qService.printOneQANo(qaNo);
			List<QAComment> qcList = qService.allQACommentList(0, 0, qaNo);
			
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			//비밀글시에
			if(qa.isQaSecret()){
				if(!loginUser.getMemberEmail().equals(qa.getMemberEmail())&&loginUser.getAdminCheck()==false) {
				
					mv.addObject("msg", "작성자만 확인할수 있습니다");
					mv.setViewName("common/error");
					return mv;
					
				}
				
			}
			
			//사용자 이름 출력영역
			String name = qService.printMemberName(qa.getMemberEmail());
			qa.setName(name);
			//코멘트 이름 출력영역
			String[] cName = new String[qcList.size()];
			for(int i=0; i<cName.length; i++) {
				cName[i]=qService.printMemberName(qcList.get(i).getMemberEmail());
				qcList.get(i).setQcName(cName[i]);
				
			}
			
			//한글 깨짐 방지용
			if(sValue.isPresent()) {
				
				searchValue =URLEncoder.encode(searchValue, "UTF-8");
			}
			
			mv.addObject("page",page);
			mv.addObject("qa", qa);
			mv.addObject("qcList", qcList);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue); //한글깨짐 방지코드
			
	
			

			mv.setViewName("/qna/qnaDtail");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}

	/**
	 * qa검색
	 * 
	 * @param mv
	 * @param searchCondition
	 * @param page
	 * @param searchValue
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/qna/search.do", method = RequestMethod.GET)
	public ModelAndView qaSearchList(ModelAndView mv, @RequestParam("searchCondition") String searchCondition,
			@RequestParam(value = "page", required = false) Integer page, // 페이징을 위한 매개변수
			@RequestParam("searchValue") String searchValue, HttpSession session) {

		try {
			///////////////////////////////// 페이징시작//////////////////////////////
			int currentPage = (page != null) ? page : 1;
			int boardLimit = 10; // 한 화면에 출력할 게시물 수
			///// 페이징용////

			List<QA> qList = qService.printAllByValue(searchCondition, searchValue, currentPage, boardLimit);

			if (!qList.isEmpty()) {

				
				//사용자 이름 출력영역
				String name[] = new String[qList.size()];
				for(int i=0; i<name.length;i++) {
					name[i]=qService.printMemberName(qList.get(i).getMemberEmail());
					qList.get(i).setName(name[i]);
						}
				

				mv.addObject("qList", qList);

			} else {
				mv.addObject("qList", null);

			}

			///// 페이징용////
			int totalCount = qService.getTotalCount(searchCondition, searchValue);

			int naviLimit = 5; // 한 화면에 출력할 게시판 페이지 수
			int maxPage; // 게시판의 총 페이지 수
			int startNavi; // 한 화면에 출력되는 게시판 페이지의 처음 수
			int endNavi;// 한 화면에 출력되는 게시판 페이지의 마지막 수
			maxPage = (int) ((double) totalCount / boardLimit + 0.9);
			startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
			endNavi = startNavi + naviLimit - 1;

			// endNavi가 maxNavi보다 커지는 오류방지
			if (maxPage < endNavi) {
				endNavi = maxPage;
			}

			mv.addObject("urlVal", "search");
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("maxPage", maxPage);
			//////////////////////////////// 페이징종료///////////////////////////////////
			
			
			mv.addObject("pageNow", currentPage);
			mv.addObject("searchValue", searchValue);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("/qna/qnaList");

		} catch (Exception e) {

			mv.addObject("msg", e.getMessage()).setViewName("/common/errorPage");

		}

		return mv;

	}
	
	/**
	 * qa여러개삭제
	 * @param mv
	 * @param arrayNo
	 * @return
	 */
	@RequestMapping(value="/qna/removeArray.do", method=RequestMethod.GET)
	public ModelAndView removeArray(ModelAndView mv, @RequestParam(value="array", required = false ) String arrayNo, HttpSession session) {
		try {
			
			//관리자 아니면 삭제금지
			Member loginUser = (Member)session.getAttribute("loginUser");
			if(loginUser.getAdminCheck()==false) {
				
				mv.addObject("msg", "관리자만 삭제할 수 있습니다");
				mv.setViewName("common/error");
				return mv;
			}
			
			
		String removeNo[] =  arrayNo.split(",");
		int result=0;
		for(int i=0; i<removeNo.length;i++) {
			
			 result += qService.reomoveOneQandANo(Integer.parseInt(removeNo[i]));
		
		}
		mv.setViewName("redirect:/qna/List.do");

	} catch (Exception e) {
		mv.addObject("msg", e.getMessage());
		mv.setViewName("common/error");
	}

		
		return mv;
		
	}

}

