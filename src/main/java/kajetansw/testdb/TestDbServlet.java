package kajetansw.testdb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// setup connection variables
		String user = "bb712f49b833d2";
		String pass = "f9ca01dd";
		
		String jdbcUrl = "jdbc:mysql://us-cdbr-gcp-east-01.cleardb.net:3306/gcp_e1efb438b6caa2b0f31b?useSSL=false";
		String driver = "com.mysql.jdbc.Driver";
		
		// get connection to db
		try {
			
			PrintWriter out = resp.getWriter();
			
			out.println("Connecting to database: " + jdbcUrl);
			
			Class.forName(driver);
			
			Connection myConn = DriverManager.getConnection(jdbcUrl, user, pass);
			
			out.println("### Success!");
			
			myConn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
				
	}
}
