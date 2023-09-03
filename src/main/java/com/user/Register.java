package com.user;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.cj.jdbc.NonRegisteringDriver;


@WebServlet(urlPatterns = {"/Register"})
@MultipartConfig
//servelt can handle multi aprt form , audio vidoe, file etc
public class Register extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
          
            
            //getting data   
            String name= request.getParameter("user_name");
			String password = request.getParameter("user_password");
			String email = request.getParameter("user_email");
			
			
			//for image
			Part part=request.getPart("image");
			
			String filename =part.getSubmittedFileName();

		
			
			//connection
			
			try {
				
			Thread.sleep(3000);	
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "N@saisro1640");
			       
			
									       
			String s1 = "INSERT INTO information(name, password, email, imageName) VALUE(?,?,?,?);";
			
			PreparedStatement stmt = con.prepareStatement(s1);
			stmt.setString(1, name);
			stmt.setString(2, password);
			stmt.setString(3, email);
			stmt.setString(4, filename);
			
			stmt.executeUpdate();
			
			//upload the file
			
			InputStream is = part.getInputStream();
			byte [] data = new byte[is.available()];
			
			
			is.read(data);
			
			String path = request.getRealPath("/")+"image"+File.separator+filename; 
			
			FileOutputStream fos= new FileOutputStream(path);
			fos.write(data);
			fos.close();					    
			con.close();
			
			out.println("done");
			    	
			} catch (Exception e) {
				
				
				
				System.out.println("error");
				e.printStackTrace();	
			}
			
			
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

		
		
	