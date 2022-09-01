package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class WithdrawDBMS_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Connection con;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/DBCON.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
           String connectionURL="jdbc:mysql://localhost:3306/soprabanking";
            String dbuser="root";
            String dbpass="root";
             con=DriverManager.getConnection(connectionURL,dbuser,dbpass);
            System.out.println("Connection Success");
            out.println("Connection Successful");
            }
            
            catch(Exception e)
            {
                out.println("Connection Failed.... " +e);
            }
            
            
            
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <body bgcolor=\"#E6E6FA\" align=\"center\">\n");
      out.write("        <h1>Withdraw DBMS Page</h1>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
