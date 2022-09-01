package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class EditPageDBMS_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Connection con;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/ViewProfileDBMS.jsp");
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
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <body>\n");
      out.write("        <h1>View Profile DBMS</h1>\n");
      out.write("        ");

            out.println("Welcome " + session.getAttribute("loginname"));
            out.println("                   " + session.getAttribute("accountno") + "<br>");
            
            
            try
            {
          
                String viewquery = "Select * from account where accno = '"+session.getAttribute("accountno")+"'";
                
                
                Statement stmt = con.createStatement();
                
                ResultSet rs  = stmt.executeQuery(viewquery);
                
                while(rs.next())
                {
                    out.println("<html>");
                    out.println("<body>");
                    out.println("<form action = 'EditPage.jsp' method = 'post'>");
                    out.println("<table border='2'>");
                    out.println("<tr><td>Account Number</td>");
                    out.println("<td>" + rs.getString(1)+"</td></tr> ");
                    out.println("<tr><td>Name</td>");
                    out.println("<td>" + rs.getString(2)+"</td></tr> ");
                    out.println("<tr><td>Gender</td>");
                    out.println("<td>" + rs.getString(3)+"</td></tr> ");
                    out.println("<tr><td>Date Of Birth</td>");
                    out.println("<td>" + rs.getString(4)+"</td></tr> ");
                    out.println("<tr><td>Address</td>");
                    out.println("<td>" + rs.getString(5)+"</td></tr> ");
                    out.println("<tr><td>Mobile</td>");
                    out.println("<td>" + rs.getInt(6)+"</td></tr> ");
                    out.println("<tr><td>Role</td>");
                    out.println("<td>" + rs.getString(7)+"</td></tr> ");
                    out.println("<tr><td>Password</td>");
                    out.println("<td>" + rs.getString(8)+"</td></tr> ");
                    out.println("<tr><td>Special Question</td>");
                    out.println("<td>" + rs.getString(9)+"</td></tr> ");
                    out.println("<tr><td>Special Answer</td>");
                    out.println("<td>" + rs.getString(10)+"</td></tr> ");
                    out.println("<br>");
                    out.println("</table><br>");
                    out.println("<input type='submit' name='b1' value='EDIT'>");
                    out.println("</form>");
                    out.println("</body>");
                    out.println("</html>");
                    
                    
                }
            }
            catch(Exception e)
            {
                
            }
            
            
        
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <body>\n");
      out.write("        <h1>Edit Profile DBMS</h1>\n");
      out.write("        \n");
      out.write("        ");

            out.println("Welcome " + session.getAttribute("loginame"));
            out.println("                   " + session.getAttribute("accountno") + "<br>");
            String choice = request.getParameter("choice");
            
            try
            {
                String updatequery = "";
                String ac = request.getParameter("txt1");
                if (choice.equalsIgnoreCase("name"))
                {
                    updatequery = "update account set cname = '"+ac+"' where accno = '"+session.getAttribute("accountno")+"'";
                }
                else if (choice.equalsIgnoreCase("gender"))
                {
                updatequery = "update account set gender = '"+ac+"' where accno = '"+session.getAttribute("accountno")+"'";
                }
                else if (choice.equalsIgnoreCase("dob"))
                {
                    
                    updatequery = "update account set dob = '"+ac+"' where accno = '"+session.getAttribute("accountno")+"'";
                    
                }
                else if (choice.equalsIgnoreCase("Address"))
                {
                    
                    updatequery = "update account set address = '"+ac+"' where accno = '"+session.getAttribute("accountno")+"'";
                    
                }
                else if (choice.equalsIgnoreCase("mob"))
                {
                    updatequery = "update account set mob = '"+ac+"' where accno = '"+session.getAttribute("accountno")+"'";
                
                }
                else if (choice.equalsIgnoreCase("sques"))
                {
                
                    updatequery = "update account set sques = '"+ac+"' where accno = '"+session.getAttribute("accountno")+"'";
                
                }
                else if (choice.equalsIgnoreCase("sans"))
                {
                    
                    updatequery = "update account set ans = '"+ac+"' where accno = '"+session.getAttribute("accountno")+"'";
                
                }
                
                PreparedStatement ps = con.prepareStatement(updatequery);
                
                ps.executeUpdate();
                out.println("Update Done");
                
            }
            catch(Exception e)
            {
                out.println(e);
                
            }
            
        
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>");
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
