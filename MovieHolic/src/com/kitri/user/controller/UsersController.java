package com.kitri.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.user.dto.UsersDto;
import com.kitri.user.service.UsersService;

public class UsersController {
	
	private static UsersController usersController;
	
	static {
		usersController = new UsersController();
	}

	private UsersController() {}
	
	public static UsersController getUsersController() {
		return usersController;
	}
	
	
	
	
	
	
	
	public int login(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("userid");
	    String pass = request.getParameter("pass");
	    int result = 0;
	    
	    UsersDto usersDto = UsersService.getUsersService().login(userid);
	    
	    HttpSession session = request.getSession();
	    session.removeAttribute("loginInfo");
	    session.removeAttribute("name");
	    
		if (usersDto.getPass().equals(pass)) { // 아이디 검사 안하는 이유는 dto 넣을때 그 아이디로 넣어줬기 때문
			//System.out.println("성공");
			result = 1;
			session.setAttribute("loginInfo", userid);
			session.setAttribute("name", usersDto.getName() );
		}else {
			//System.out.println("실패");
			result = -1;
		}
	    
		return result;
		
	}
	
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginInfo");
	    session.removeAttribute("name");
		String path = "/film";
		
		return path;
		
	}

	
	
	public String register(HttpServletRequest request, HttpServletResponse response) {
		// post로 왔는데 doGet(request, response); 있어서 돌아옴 그래서 한번 들렸다 오니 글자가 깨지므로  post에서 인코딩 해줘야뎀.
		
			String path = "/film";
			
			

			String userid = request.getParameter("id");
			String emaildomain = request.getParameter("emaildomain");
			
			StringBuffer id = new StringBuffer();
			id.append(userid);
			id.append("@");
			id.append(emaildomain);
			
//			System.out.println(id);
//			System.out.println(request.getParameter("name"));
//			System.out.println(request.getParameter("pass"));
//			System.out.println(request.getParameter("tel1"));
//			System.out.println(request.getParameter("tel2"));
//			System.out.println(request.getParameter("tel3"));
//			System.out.println(request.getParameter("birth"));
//			System.out.println(request.getParameter("gender"));
			
			
//			private String userid;		//ID
//			private String pass;		//PW
//			private String name;		//이름
//			private String birth;		//생년월일
//			private String gender;		//성별
//			private String phoneFirst;	//폰1
//			private String phoneMid;	//폰2
//			private String phoneLast;	//폰3
			
		
			UsersDto usersDto = new UsersDto();
				
			usersDto.setUserId(id.toString());
			usersDto.setName(request.getParameter("name"));
			usersDto.setPass(request.getParameter("pass"));
			usersDto.setBirth(request.getParameter("birth"));
			usersDto.setGender(request.getParameter("gender"));
			usersDto.setPhoneFirst(request.getParameter("tel1"));
			usersDto.setPhoneMid(request.getParameter("tel2"));
			usersDto.setPhoneLast(request.getParameter("tel3"));
			
			System.out.println();
			
			int cnt = UsersService.getUsersService().registerMember(usersDto);
			
			if (cnt != 0) {
				
				//path = "/user/member/registerok.jsp"; // 갈것이다라는 지정만함. 프론트 컨트롤러에서 가는것을함. 가져가야되는 값이 오브젝트면 못보넴.
			
			} else {
				
				//path = "/user/member/registerfail.jsp";
			
			}
			
			return path;
					
	}
	
	
	public String idCheck(HttpServletRequest request, HttpServletResponse response, String id) {
		
//		String sid = request.getParameter("sid");
//		System.out.println("검색아이디 : " + sid);
//		String resultXML = UsersController.getUsersController().idCheck(sid);
//		// 넘기는 방법 json, xml, text
//		
//		System.out.println(resultXML);
//		
//		response.setContentType("text/xml;charset=UTF-8"); // text로 보내지만 xml로 인식해라.
//		PrintWriter out = response.getWriter();
		
		
		int cnt = UsersService.getUsersService().idCheck(id);
		System.out.println("cnt : " + cnt);

		String result = "";
		result += "<idcount>\n";
		result += "<cnt>" + cnt + "</cnt>\n";
		result += "</idcount>";

		return result;
		
	}
	
	
	

}

















