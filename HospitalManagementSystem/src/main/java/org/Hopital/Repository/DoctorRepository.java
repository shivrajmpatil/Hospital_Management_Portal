package org.Hopital.Repository;

import java.util.*;
import org.Hospital.Model.DoctorModel;
import java.sql.*;

public class DoctorRepository {

	private DBConfig dbc = DBConfig.getDBConfig();
	private Connection conn = dbc.getConnection();
	private PreparedStatement stmt;
	private ResultSet rs;
	private ResultSet rr;

	List<DoctorModel> listd = new ArrayList<DoctorModel>();

	List<DoctorModel> lists = new ArrayList<DoctorModel>();

	// -------------------------------------------addDoctor--------------------------------------------------------
	public boolean addDoctor(DoctorModel model) {
		int Did = getDid();

		Did++;
		try {
			stmt = conn.prepareStatement("insert into doctor values(?,?,?,?,?,?,?)");
			stmt.setInt(1, Did);
			stmt.setString(2, model.getName());
			stmt.setInt(3, model.getSid());
			stmt.setString(4, model.getGender());
			stmt.setString(5, model.getContact());
			stmt.setString(6, model.getUsername());
			stmt.setString(7, model.getPassword());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("addDoctor ex =" + ex);
			return false;
		}
	}

	// -----------------------------------------------getDid-------------------------------------------------------
	private int getDid() {
		try {
			stmt = conn.prepareStatement("select max(Did) from doctor");
			rs = stmt.executeQuery();
			if (rs.next()) {
				synchronized (rs) {
					return rs.getInt(1);
				}
			}

			else
				return 0;
		} catch (Exception ex) {
			return 0;
		}
	}

	// ------------------------------------------------isDoctor----------------------------------------------
	public boolean isDoctor(DoctorModel model) {
		try {
			stmt = conn.prepareStatement("select *from doctor where UserName=?");
			stmt.setString(1, model.getUsername());
			rs = stmt.executeQuery();
			return rs.next();
		} catch (Exception ex) {
			System.out.println("isDoctor ex=" + ex);
			return false;
		}
	}

	// ----------------------------------------------isDoctorRemove--------------------------------------------
	public boolean isDoctorRemove(DoctorModel model) {
		try {
			stmt = conn.prepareStatement("delete from doctor where Did=? and UserName=?");
			stmt.setInt(1, model.getDid());
			stmt.setString(2, model.getUsername());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("isDoctorRemove" + ex);
			return false;
		}
	}

	// --------------------------------------------viewDoctorList-----------------------------------------------
	public List<DoctorModel> viewDoctorList() {
		listd.clear();
		try {
			stmt = conn.prepareStatement("select * from doctor");
			rs = stmt.executeQuery();

			while (rs.next()) {
				DoctorModel model = new DoctorModel();
				model.setDid(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setSid(rs.getInt(3));
				model.setGender(rs.getString(4));
				model.setContact(rs.getString(5));
				model.setUsername(rs.getString(6));
				// getSpecilization(model);

				try {
					stmt = conn.prepareStatement("select Sname from specilization where Sid=?");

					stmt.setInt(1, model.getSid());
					rr = stmt.executeQuery();
					if (rr.next()) {
						model.setSpecilization(rr.getString(1));
					}
				} catch (Exception ex) {
					System.out.println("Exception in getSpecilization =" + ex);
				}

				listd.add(model);
			}
			return listd.size() > 0 ? listd : null;
		} catch (Exception ex) {
			System.out.println("viewDoctorList ex=" + ex);
			return null;
		}
	}

	// ------------------------------------------------getSid---------------------------------------------------
	private int getSid(DoctorModel model) {
		try {
			stmt = conn.prepareStatement("select Sid from specilization where Sname=?");
			stmt.setString(1, model.getSpecilization());
			rs = stmt.executeQuery();
			if (rs.next())
				return rs.getInt(1);
			else {
				System.out.println("Specilization not found pls check specilization");
				return 0;
			}
		} catch (Exception ex) {
			System.out.println("Specilization not found " + ex);
			return 0;
		}
	}

	// ---------------------------------------------getSpecilization------------------------------------
//	private void getSpecilization(DoctorModel model)
//	{
//		try {
//			stmt = conn.prepareStatement("select Sname from Specilization where sid=?");
//			stmt.setInt(1, model.getSid());
//			rs= stmt.executeQuery();
//			if(rs.next())
//			{
//				model.setSpecilization(rs.getString(1));
//			}
//		}
//		catch(Exception ex)
//		{
//			System.out.println("Exception in getSpecilization ="+ex);
//		}
//	}

	// ----------------------------------------------checkUserPass---------------------------------------
	public int checkDoctor(DoctorModel model) {
		try {
			stmt = conn.prepareStatement("select Did from doctor where UserName=? and Password=?");
			stmt.setString(1, model.getUsername());
			stmt.setString(2, model.getPassword());

			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else
				return 0;
		}

		catch (Exception ex) {
			System.out.println("Doctor checkUserPass ex =" + ex);
			return 0;

		}
	}

	// --------------------------------------------getProfile-------------------------------------------------
	public DoctorModel getProfile(int did) {
		try {
			stmt = conn.prepareStatement("select *from doctor where Did=?");
			stmt.setInt(1, did);
			rs = stmt.executeQuery();

			if (rs.next()) {
				DoctorModel model = new DoctorModel();
				model.setDid(rs.getInt("Did"));
				model.setName(rs.getString("Name"));
				model.setContact(rs.getString("Contact"));
				model.setUsername(rs.getString("UserName"));
				model.setPassword(rs.getString("Password"));

				return model;
			} else {
				return null;
			}
		} catch (Exception ex) {
			System.out.println("getProfile ex=" + ex);
			return null;
		}
	}

	// ---------------------------------------------deleteDoctor-------------------------------------------
	public boolean deleteDoctor(int Did) {
		try {
			stmt = conn.prepareStatement("delete from doctor where Did=?");
			stmt.setInt(1, Did);

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			ex.getMessage();
			return false;
		}
	}

	// ---------------------------------------------updateDoctor-------------------------------------------
	public boolean updateDoctor(DoctorModel model) {
		try {
			stmt = conn
					.prepareStatement("update doctor set Name=?, Sid=?, Gender=?, Contact=?, UserName=? where Did=?");
			stmt.setString(1, model.getName());
			stmt.setInt(2, model.getSid());
			stmt.setString(3, model.getGender());
			stmt.setString(4, model.getContact());
			stmt.setString(5, model.getUsername());
			stmt.setInt(6, model.getDid());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("updateDoctor ex=" + ex);
			return false;
		}
	}

	// ---------------------------------------------addSpecilization---------------------------------------
	public boolean addSpecilization(DoctorModel model) {
		int Sid = getMaxSid();
		Sid++;
		try {
			stmt = conn.prepareStatement("insert into specilization values(?,?)");
			stmt.setInt(1, Sid);
			stmt.setString(2, model.getSpecilization());
			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("addSpecilization ex =" + ex);
			return false;
		}
	}

	// ---------------------------------------------getMaxSid----------------------------------------------------
	private int getMaxSid() {
		try {
			stmt = conn.prepareStatement("select max(Sid) from specilization");
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else
				return 0;
		} catch (Exception ex) {
			System.out.println("getMaxSid ex = " + ex);
			return 0;
		}
	}

	// --------------------------------------------isSpecilization-------------------------------------------------
	public boolean isSpecilization(DoctorModel model) {
		try {
			stmt = conn.prepareStatement("select *from specilization where Sname=?");
			stmt.setString(1, model.getSpecilization());
			rs = stmt.executeQuery();
			return rs.next();
		} catch (Exception ex) {
			return false;
		}
	}

	// -------------------------------------------specilizationList--------------------------------------------------
	public List<DoctorModel> specilizationList() {
		lists.clear();
		try {
			stmt = conn.prepareStatement("select *from specilization order by Sid");
			rs = stmt.executeQuery();
			while (rs.next()) {
				DoctorModel model = new DoctorModel();
				model.setSid(rs.getInt(1));
				model.setSpecilization(rs.getString(2));
				lists.add(model);
			}
			return lists.size() > 0 ? lists : null;
		} catch (Exception ex) {
			System.out.println("specilizationList ex =" + ex);
			return null;
		}

	}

	// ---------------------------------------------deleteSpecilization--------------------------------------------------
	public boolean deleteSpecilization(int Sid) {
		try {
			stmt = conn.prepareStatement("delete from specilization where Sid=?");
			stmt.setInt(1, Sid);
			int value = stmt.executeUpdate();

			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("deleteSpecilization ex=" + ex);
			return false;
		}
	}

	// --------------------------------------------updateSpecilization----------------------------------------------------
	public boolean updateSpecilization(DoctorModel model) {
		try {
			stmt = conn.prepareStatement("update specilization set Sname=? where Sid=?");
			stmt.setString(1, model.getSpecilization());
			stmt.setInt(2, model.getSid());
			int value = stmt.executeUpdate();

			return value > 0 ? true : false;
		} catch (Exception ex) {
			return false;
		}
	}

	// --------------------------------------------countDoctors----------------------------------------------------------------
	public int getDoctorsCount() {
		try {
			stmt = conn.prepareStatement("select count(*) from doctor");
			rs = stmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}

			return 0;
		} catch (Exception ex) {
			System.out.println("countDoctors ex=" + ex);
			return 0;
		}
	}
}
