<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://budgetwebsite.cthtpprfbxoo.us-east-2.rds.amazonaws.com:3306/IncomeTax","admin", "adminadmin");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from User where username='" + username + "' and password='" + password + "'");
    if (rs.next()) {
        session.setAttribute("username", username);
        if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
        	 out.println("You are not logged in <a href='index.jsp'>Please Login</a>");
        	 
        }
        else {
        	out.println("Log in successful! ");
        	response.sendRedirect("loginsuccess.jsp");
		}
        
    } else {
    	//out.println("Login not successful! ");
    	response.sendRedirect("loginfail.jsp");
    }
    if (con != null){
    	con.close();
    }
%>