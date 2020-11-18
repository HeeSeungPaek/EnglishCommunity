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

@WebServlet("/DeleteComment")
public class DeleteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteComment() {
        super();
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response, String method)
			throws ServletException, IOException {
		System.out.println(method);
		
		response.setContentType("text/html;charset=UTF-8");
		
		int commentNumber = Integer.parseInt(request.getParameter("commentNumber"));
		PrintWriter out = response.getWriter();
		BoardDao dao = new BoardDao();
		String responseData = "";
		
		System.out.println("삭제 할 댓글 번호 : " + commentNumber);
		
		if(dao.deleteComment(commentNumber) > 0) {
			responseData = "Complete";
		}else {
			responseData = "Incomplete";
		}

		System.out.println("댓글 삭제 비동기 결과 : " + responseData);
		out.print(responseData);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response, "DeleteComment Ajax POST : /DeleteComment.java");
	}

}
