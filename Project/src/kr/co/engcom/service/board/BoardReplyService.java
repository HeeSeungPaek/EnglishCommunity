package kr.co.engcom.service.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.engcom.action.Action;
import kr.co.engcom.action.ActionForward;
import kr.co.engcom.dao.BoardDao;
import kr.co.engcom.dto.BoardDto;

public class BoardReplyService implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
	 	request.setCharacterEncoding("utf-8");
	 	ActionForward forward = new ActionForward();
	 	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("userid");
	 	System.out.println("id: " + id);
	 	
	 	String realFolder="";
   		String saveFolder="boardupload";
   		
   		int fileSize=5*1024*1024;
	 	
		BoardDao boarddao=new BoardDao();
   		BoardDto boarddata=new BoardDto();
   		
   		realFolder=request.getRealPath(saveFolder);
   		System.out.println("realFolder: " + realFolder);
   		int result=0;
   		
   		response.setContentType("text/html;charset=utf-8");
   		PrintWriter out=response.getWriter();
   		
   		MultipartRequest multi=null;
		
		multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"utf-8",
				new DefaultFileRenamePolicy());
   		
   		boarddata.setContentNumber(Integer.parseInt(multi.getParameter("contentNumber")));
   		boarddata.setId(id);
   		boarddata.setContentTitle(multi.getParameter("contentTitle"));
   		boarddata.setContent(multi.getParameter("content"));
   		boarddata.setBoardName(multi.getParameter("boardName"));
   		boarddata.setRefer(Integer.parseInt(multi.getParameter("refer")));
   		boarddata.setDepth(Integer.parseInt(multi.getParameter("depth")));
   		boarddata.setStep(Integer.parseInt(multi.getParameter("step")));
   		boarddata.setFilename(
   				multi.getFilesystemName(
   						(String)multi.getFileNames().nextElement()));
   		
   		
   		result=boarddao.boardReply(boarddata);
   		if(result==0){
   			System.out.println("답장 실패");
   			return null;
   		}
   		System.out.println("답장 완료");
   		
   		forward.setRedirect(false);
   		forward.setPath("BoardDetailService.bo?num="+result);
   		return forward;
	}
}
