
<%@include file="DBCON.jsp" %>
<html>
    <body bgcolor="#E6E6FA" align="center">
        <h1>Forget Password Check Page</h1>
        <%
            String accountno = request.getParameter("accountno");
            String sques = request.getParameter("sques");
            String ans = request.getParameter("txt1");
            
            try {
                String viewquery = "select * from account";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(viewquery);
                boolean check = false;
                while(rs.next()) {
                    if(accountno.equalsIgnoreCase(rs.getString(1))) {
                        if(sques.equalsIgnoreCase(rs.getString(9)) && ans.equalsIgnoreCase(rs.getString(10))) {
                            check = true;
                        }
                    }
                    else {
                        out.println("Account number is wrong");
                    }
                }
                if(check) {
                    session.setAttribute("accountno", accountno);
                    response.sendRedirect("Reset.jsp");
                }
                
            } catch(Exception e) {
                
            }
        %>
    </body>
</html>