// 重定向
response.sendRedirect("/AAA/stars.jsp");

//設定中文
response.setCharacterEncoding("utf-8");
response.setHeader("content-type","text/html,charset=utf-8");


// 1獲取字符輸出流
PrintWriter pw = response.getWriter(); 
// 2.輸出數據
pw.write(" AAAAAA");


//1獲取字節輸出流
ServletOutputStream sos =response.getOutputStream();
// 2.輸出數據
sos.write("hell ".getBytes());

HttpSession session = request.getSession();
session.setAttribute("meg","hello seesion");//傳出

Object msg = session.getAttribute("meg");//傳入
System.out.println(msg);


PrintWriter pw = response.getWriter();
pw.println("xxxxxxxxx");
pw.flush();

@ResponseBody //框架會把返回的類型,自動轉成需要的格式