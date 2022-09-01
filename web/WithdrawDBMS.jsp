
<%@include file="DBCON.jsp" %>

<html>
    <body bgcolor="#E6E6FA" align="center">
        <h1>Withdraw DBMS Page</h1>
        <%
            String accountno = request.getParameter("accountno");
            String refe = request.getParameter("ref");
            String date = request.getParameter("date");
//            String transID = request.getParameter("transID");
            String amount = request.getParameter("amount");
            
            
//            out.println(accountno);
//            out.println(refe);
//            out.println(date);
//            out.println(transID);
//            out.println(amount);
            
            String viewquerytest = "select * from transactionbank";
            Statement stmttest = con.createStatement();
            ResultSet rstest = stmttest.executeQuery(viewquerytest);

            String transIDold = "";

            while(rstest.next()) {
                transIDold = rstest.getString(4);
            }
            
            String temp = transIDold.replace("T", "");
            int i = Integer.parseInt(temp);
            i = i + 1;
            String transID = Integer.toString(i);
            transID = "T" + transID;
            
            
            
            
            try {
                
                String viewquery = "select * from transactionbank";
                Statement stmt = con.createStatement();
                
                ResultSet rs = stmt.executeQuery(viewquery);
                
                int lastbal = 0;
                
                while(rs.next()) {
                    lastbal = rs.getInt(7);
                }
                
                
                String cashdepquery = "insert into transactionbank values(?,?,?,?,?,?,?);";
                
                PreparedStatement pst = con.prepareStatement(cashdepquery);
                pst.setString(1, accountno);
                pst.setString(2, refe);
                pst.setString(3, date);
                pst.setString(4, transID);
                pst.setInt(5, 0);
                pst.setInt(6, Integer.parseInt(amount));
                pst.setInt(7, lastbal - Integer.parseInt(amount));
                
                pst.executeUpdate();
                
                out.println("Connection done.. cash withdraw in bank transaction table");
                
                String viewquery2 = "select * from " + accountno;
                Statement stmt2 = con.createStatement();
                
                ResultSet rs2 = stmt2.executeQuery(viewquery2);
                
                int lastbalcust = 0;
                
                while(rs2.next()) {
                    lastbalcust = rs2.getInt(7);
                }
                
                
                String cashdepquery2 = "insert into " +accountno+ " values(?,?,?,?,?,?,?);";
                
                PreparedStatement pst2 = con.prepareStatement(cashdepquery2);
                pst2.setString(1, accountno);
                pst2.setString(2, refe);
                pst2.setString(3, date);
                pst2.setString(4, transID);
                pst2.setInt(5, 0);
                pst2.setInt(6, Integer.parseInt(amount));
                pst2.setInt(7, lastbalcust - Integer.parseInt(amount));
                
                pst2.executeUpdate();
                
                out.println("Connection done.. cash withdraw in customer table");
                
                
                
                out.println("<html>");
                out.println("<body>");
                out.println("<form >");
                out.println("<table border= 2 bgcolor= pink align= center>");
                out.println("<tr>");
                out.println("<td>");
                out.println("Account No");
                out.println("</td>");
                out.println("<td>");
                out.println(accountno);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Date of Transfer");
                out.println("</td>");
                out.println("<td>");
                out.println(date);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Transfer ID");
                out.println("</td>");
                out.println("<td>");
                out.println(transID);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Account No");
                out.println("</td>");
                out.println("<td>");
                out.println(accountno);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Amount");
                out.println("</td>");
                out.println("<td>");
                out.println(amount);
                out.println("</td>");
                out.println("</tr>"); 
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Mode of transfer");
                out.println("</td>");
                out.println("<td>");
                out.println(refe);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("</table>");
                out.println("</form>");
                out.println("</body>");
                out.println("</html>");
            }
            
            
            catch(Exception e) {
                out.println("cash not withdraw" + e);
            }
        %>
    </body>
</html>
