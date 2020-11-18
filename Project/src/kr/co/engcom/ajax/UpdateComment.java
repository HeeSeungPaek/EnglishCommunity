package kr.co.engcom.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.engcom.dao.BoardDao;
import kr.co.engcom.dao.UserTableDao;

@WebServlet("/UpdateComment")
public class UpdateComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateComment() {
        super();
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response, String method)
			throws ServletException, IOException {
		System.out.println(method);
		
		response.setContentType("text/html;charset=UTF-8");
		
		String updateContent = request.getParameter("updateContent").trim();
		int commentNumber = Integer.parseInt(request.getParameter("commentNumber"));
		PrintWriter out = response.getWriter();
		BoardDao dao = new BoardDao();
		String responseData = "";
		
		System.out.println("업데이트 할 댓글 번호 : " + commentNumber);
		System.out.println("업데이트 할 댓글 내용 : " + updateContent);
		
		if(dao.updateComment(updateContent, commentNumber) > 0) {
			responseData = "Complete";
		}else {
			responseData = "Incomplete";
		}

		System.out.println("댓글 수정 비동기 결과 : " + responseData);
		out.print(responseData);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response, "UpdateComment Ajax POST : /UpdateComment.java");
	}

}
