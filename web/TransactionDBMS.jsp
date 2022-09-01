<%@include file="DBCON.jsp" %>
<%@include file="Transaction.jsp" %>
<html>
    <body bgcolor="#E6E6FA" align="center">
        <h1>Transaction DBMS</h1>
        <%
            String choice = request.getParameter("choice");
            
            try {
                
                String viewquery = "";
                String ac = request.getParameter("txt1");
                if(choice.equalsIgnoreCase("accountno")) {
                    
                    viewquery = "select * from transactionbank where accountno='" + ac + "'";
                } else if(choice.equalsIgnoreCase("date")) {



                   viewquery = "select * from transactionbank where dotrans='" + ac + "'";
                } else if(choice.equalsIgnoreCase("amount")) {
                    viewquery = "select * from transactionbank where netbal='" + ac + "'";
                } else {
                    viewquery = "select * from transactionbank";
                }
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(viewquery);
                
                while(rs.next()) {
                    out.println(" " + rs.getString(1));
                    out.println(" " + rs.getString(2));
                    out.println(" " + rs.getString(3));
                    out.println(" " + rs.getString(4));
                    out.println(" " + rs.getString(5));
                    out.println(" " + rs.getString(6));
                    out.println(" " + rs.getString(7));
                    out.println("<br>");
                }
                
            } catch(Exception e) {
                out.println("Invalid input");
            }
        %>
    </body>
</html>