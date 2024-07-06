package org.Hopital.Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConfig {
	
	private static DBConfig dbc = null;
	private static Connection conn;

	private DBConfig() {

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");

			// local
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmgt", "root", "2143");

			// server
				//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smprowor_hospitalmgt", "smprowor_shivraj","l}{XAy!vjqyT");
			} catch (SQLException e) {

				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
	
	public static DBConfig getDBConfig()
	{
		if(dbc==null)
		{
			dbc = new DBConfig();
		}
		return dbc;
	}

	public static Connection getConnection() {
		return conn;
	}
	
}
