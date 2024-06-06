package org.Hopital.Repository;

import java.sql.*;
import org.Hospital.Helper.PathHelper;

public class DBConfig {

	protected Connection conn;
	protected PreparedStatement stmt;
	protected ResultSet rs;
	protected ResultSet rr;
	
	public DBConfig()
	{
		try {
				PathHelper phelp = new PathHelper();
				//Class.forName(PathHelper.p.getProperty("driver"));
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//conn= DriverManager.getConnection(PathHelper.p.getProperty("url"),PathHelper.p.getProperty("user"),PathHelper.p.getProperty("password"));
				
				conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmgt","root","2143");
				String s = conn!=null?"Database connected":"Some problem to connect database";
				//System.out.println(s);
		
			}
		
	catch(Exception e) {
		System.out.println("Errror is "+e);
		}
	
	}
}
