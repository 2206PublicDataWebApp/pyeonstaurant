package com.kh.pyeonstaurant.qanda.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.qanda.domain.QA;
import com.kh.pyeonstaurant.qanda.service.QAService;

@Controller
public class QAController {
	@Autowired
	private QAService qService;

	/**
	 * 쓰기창 연결
	 * 
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/qna/wirteForm.do", method = RequestMethod.GET)
	public ModelAndView showQandAWrite(ModelAndView mv, HttpSession session) {

		mv.setViewName("/qna/qnaWirteForm");

		return mv;

	}
/**
 * qa 등록창 연결
 * @param mv
 * @param session
 * @return
 */
	public ModelAndView QandModifyView(ModelAndView mv, HttpSession session) {
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
			@RequestParam(value = "upFile", required = false) List<MultipartFile> upFile, 
			HttpSession session, HttpServletRequest request) {
		try {
			System.out.println("등록 시작");
			System.out.println(upFile.size());
			//파일등록시작//
			String[] qaFile = new String[5];
			String[] qaFileRename = new String[5];
			for(int i=0; i<upFile.size();i++) {
				 qaFile[i]="";
				 qaFileRename[i]="";
				 qaFile[i] = upFile.get(i).getOriginalFilename();
				 
				 if (!qaFile[i].equals("")) { //qaFile이 있을때
					 
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
	 * @param mv
	 * @param qA
	 * @param session
	 * @return
	 */
	 
	@RequestMapping(value="/qna/List.do",method = RequestMethod.GET)
	public ModelAndView allQAList(ModelAndView mv,@ModelAttribute QA qA, HttpSession session) {
		try {
			List<QA> qList = qService.allQAList(0, 0);
			mv.addObject("qList", qList);
			
			mv.setViewName("/qna/qnaList");
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		

		return mv;
	}
/**
 * qna수정창 연결
 * @param mv
 * @param page
 * @return
 */
	@RequestMapping(value="/qna/modifyView.do", method = RequestMethod.GET)
	public ModelAndView modifyQandAView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page,
			@RequestParam("qaNo") Integer qaNo ) {
		QA qa = qService.printOneQANo(qaNo);
		mv.addObject("qa",qa);
		mv.setViewName("/qna/qnamodifyView");

		return mv;
	}
	/**
	 * 레시피 수정
	 * @param mv
	 * @param qA
	 * @param upFile
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/qna/modify.do", method=RequestMethod.POST)
	public ModelAndView modifyOneQandA(ModelAndView mv, @ModelAttribute QA qA,
			@RequestParam(value = "upFile", required = false) List<MultipartFile> upFile, 
			HttpSession session, HttpServletRequest request) {
		
		try {
			System.out.println(qA.toString());
		//파일 교체 시작//
		
		String filename[] = new String[5];
		String fileRename[] = new String[5];
		String filesetName[]= {qA.getQaFile1Rename(),qA.getQaFile2Rename(),qA.getQaFile3Rename(),qA.getQaFile4Rename(),qA.getQaFile5Rename()};
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savedPath = root + "\\qnaImg";
		
		// 반복문으로 삭제/저장
		for (int i = 0; i <upFile.size(); i++) {
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
			//사진 저장 코드 종료//
			}
		}
				
		//사진이름 qa에 넣어주기 시작//
		if(fileRename[0]!=null) {
		qA.setQaFile1(filename[0]);
		qA.setQaFile1Rename(fileRename[0]);
		}
		if(fileRename[1]!=null) {
			qA.setQaFile2(filename[1]);
			qA.setQaFile2Rename(fileRename[1]);
		}
		if(fileRename[2]!=null) {
			qA.setQaFile3(filename[2]);
			qA.setQaFile3Rename(fileRename[2]);
		}
		if(fileRename[3]!=null) {
			qA.setQaFile4(filename[3]);
			qA.setQaFile4Rename(fileRename[3]);
		}
		if(fileRename[4]!=null) {
			qA.setQaFile5(filename[4]);
			qA.setQaFile5Rename(fileRename[4]);
		}
		
		System.out.println(qA.toString());
		int result = qService.modifyQandA(qA);
		mv.addObject("qa",qA);
		mv.setViewName("redirect:/qna/detail.do?qaNo="+qA.getQaNo());
		
		
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
		
	}

	public ModelAndView removeQA(HttpSession session, ModelAndView mv, int qaNo, String memberEmail) {
		return mv;
	}

	
	/**
	 * qa상세창
	 * @param mv
	 * @param qaNo
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/qna/detail.do",method = RequestMethod.GET)
	public ModelAndView viewDetailQa(ModelAndView mv, int qaNo, HttpSession session) {
	try {
		QA qa = qService.printOneQANo(qaNo);
		mv.addObject("qa",qa);
		
		mv.setViewName("/qna/qnaDtail");
		
	}catch (Exception e) {
		mv.addObject("msg", e.getMessage());
		mv.setViewName("common/error");
	}
		return mv;
	}

}
