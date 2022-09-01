
<%@include file="DBCON.jsp"%>
<html>

    <body bgcolor="Aqua" align="center">
        <h1>Create Account DBMS!</h1>
        <%
           String accno = request.getParameter("accno");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("DOB");
            String address = request.getParameter("address");
            String contactno = request.getParameter("contactno");
            //String accountype = request.getParameter("accountype");
            String sques = request.getParameter("sques");
            String sans = request.getParameter("answer");
            
            /*out.println(accno);
            out.println(name);
            out.println(password);
            out.println(gender);
            out.println(dob);
            out.println(address);
            out.println(contactno);
            out.println(accountype);*/
            
            try
            {
                String newaccountinsert = "insert into account values(?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement pst = con.prepareStatement(newaccountinsert);
                pst.setString(1, accno);
                pst.setString(2, name);
                pst.setString(3, gender);
                pst.setString(4, dob);
                pst.setString(5, address);
                pst.setInt(6, Integer.parseInt(contactno));
                pst.setString(7, "CUSTOMER");
                pst.setString(8, password);
                pst.setString(9, sques);
                pst.setString(10, sans);
                
                pst.executeUpdate();
                out.println("Account Created");
                
                String customeraccount = "create table " +accno +" (accountno varchar(20), ref varchar(20), dotrans varchar(20), transid varchar(20), depamount int, wdrwamount int, natbal int);";
                PreparedStatement pst2 = con.prepareStatement(customeraccount);
                pst2.executeUpdate();
                
                
                out.println("Customer Account Created");
            }
            catch(Exception e)
            {
                
                out.println("Account not Created" + e);
            }
            %>
    </body>
</html>
