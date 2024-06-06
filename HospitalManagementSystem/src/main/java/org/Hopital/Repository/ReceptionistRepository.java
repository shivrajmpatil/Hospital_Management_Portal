package org.Hopital.Repository;

import java.util.*;
import org.Hospital.Model.ReceptionistModel;

public class ReceptionistRepository extends DBConfig{

	List<ReceptionistModel> list = new ArrayList<ReceptionistModel>();

	//-------------------------------------------addReceptionist--------------------------------------------------------
		public boolean addReceptionist(ReceptionistModel model)
		{
			int Rid= getRid();
			Rid++;
			try {
				  stmt = conn.prepareStatement("insert into Receptionist values(?,?,?,?,?,?)");
				  stmt.setInt(1, Rid);
				  stmt.setString(2, model.getName());
				  stmt.setString(3, model.getGender());
				  stmt.setString(4, model.getContact());
				  stmt.setString(5, model.getUsername());
				  stmt.setString(6, model.getPassword());
				  
				  int value = stmt.executeUpdate(); 
				  return value>0?true:false;
			}
			catch(Exception ex)
			{
				System.out.println("addReceptionist ex ="+ex);
				return false;
			}
		}
		
		
		//-----------------------------------------------getRid-------------------------------------------------------
		private int getRid()
		{
			try {
				stmt = conn.prepareStatement("select max(Rid) from Receptionist");
				rs = stmt.executeQuery();
				if(rs.next())
				{
					String S= rs.getString(1);	//max value get in String format ( If column is empty then occur exception
					return Integer.parseInt(S);	// return max by converting into int
				}
				
				else
					return 0;
			}
			catch(Exception ex)
			{
				//System.out.println("getRid ex ="+ex);
				return 0;
			}
		}
		
		
		//------------------------------------------------isReceptionist----------------------------------------------
		public boolean isReceptionist(ReceptionistModel model)
		{
			try {
				stmt = conn.prepareStatement("select *from Receptionist where UserName=?");
				stmt.setString(1, model.getUsername());
				rs = stmt.executeQuery();
				return rs.next();
			}
			catch(Exception ex)
			{
				System.out.println("isReceptionist ex="+ex);
				return false;
			}
		}
		
		//----------------------------------------------isReceptionistRemove--------------------------------------------
		public boolean isReceptionistRemove(int Rid)
		{
			try {
				stmt = conn.prepareStatement("delete from Receptionist where Rid=?");
				stmt.setInt(1, Rid);
				
				int value = stmt.executeUpdate(); 
				  return value>0?true:false;
			}
			catch(Exception ex)
			{
				System.out.println("isReceptionistRemove"+ex);
				return false;
			}
		}
		
		
		//----------------------------------------------checkUserPass---------------------------------------
		public int checkUserPass(ReceptionistModel model)
		{
			try {
				stmt = conn.prepareStatement("select Rid from Receptionist where UserName=? and Password=?");
				stmt.setString(1, model.getUsername());
				stmt.setString(2, model.getPassword());
				
				rs = stmt.executeQuery();
				
				if(rs.next())
				{
					return rs.getInt(1);
				}
				else
					return 0;
			}
			
			
			catch(Exception ex)
			{
				System.out.println("checkUserPass ex ="+ex.getMessage());
				return 0;
			}
		}
		
		//--------------------------------------------viewReceptionistList-----------------------------------------------
		public List<ReceptionistModel> viewReceptionistList()
		{
			list.clear();
			try {
				stmt = conn.prepareStatement("select *from Receptionist");
				rs = stmt.executeQuery();
				
				while(rs.next())
				{
					ReceptionistModel model = new ReceptionistModel();
					model.setRid(rs.getInt(1));
					model.setName(rs.getString(2));
					model.setGender(rs.getString(3));
					model.setContact(rs.getString(4));
					model.setUsername(rs.getString(5));
					model.setPassword(rs.getString(6));
					
					list.add(model);
				}
				return list.size()>0?list:null;
			}
			catch(Exception ex)
			{
				System.out.println("viewReceptionistList ex="+ex);
				return null;
			}
		}
		
		//------------------------------------------updateReceptionist-----------------------------------------------------
		public boolean updateReceptionist(ReceptionistModel model)
		{
			try {
				stmt = conn.prepareStatement("update Receptionist set Name=?, Gender=?, Contact=?, Username=?, Password=? where Rid=?");
				stmt.setString(1, model.getName());
				stmt.setString(2, model.getGender());
				stmt.setString(3, model.getContact());
				stmt.setString(4, model.getUsername());
				stmt.setString(5, model.getPassword());
				stmt.setInt(6, model.getRid());
				
				int value = stmt.executeUpdate();
				return value>0?true:false;
			}
			catch(Exception ex)
			{
				System.out.println("updateReceptinist ex="+ex);
				return false;
			}
		}
		
		
		//--------------------------------------------getProfile-------------------------------------------------------------
		public ReceptionistModel getProfile(int rid)
		{
			try {
				stmt = conn.prepareStatement("select *from Receptionist where rid=?");
				stmt.setInt(1, rid);
				
				rs = stmt.executeQuery();
				
				if(rs.next())
				{
					ReceptionistModel model = new ReceptionistModel();
					
					model.setRid(rid);
					model.setName(rs.getString("Name"));
					model.setContact(rs.getString("Contact"));
					model.setUsername(rs.getString("UserName"));
					model.setPassword(rs.getString("Password"));
					
					return model;
				}
				else
					return null;
			}
			catch(Exception ex)
			{
				System.out.println("ReceptionistModel ="+ex);
				return null;
			}
		}
}
