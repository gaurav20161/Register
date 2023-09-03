package com.user;

import java.sql.*;

public class test {
    public static void main(String args[]) throws SQLException {

    
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "N@saisro1640");
      

        Statement stmt = con.createStatement();

       
        String s1 = "testing5(Id INT(3), Name VARCHAR (30), Location VARCHAR(30));";
        stmt.execute(s1);
    
        con.close();

        System.out.println("QUERY Executed");

    }

}
