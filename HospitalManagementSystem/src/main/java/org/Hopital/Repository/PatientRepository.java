package org.Hopital.Repository;

import java.util.*;
import org.Hospital.Model.PatientModel;
import java.time.LocalDate;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PatientRepository {

	DBConfig dbc = DBConfig.getDBConfig();
	Connection conn = dbc.getConnection();
	private PreparedStatement stmt;
	private ResultSet rs;
	List<PatientModel> list = new ArrayList<PatientModel>();

	// -------------------------------------------addPatient--------------------------------------------------------
	public boolean addPatient(PatientModel model) {
		int Pid = getPid();
		Pid++;
		try {
			stmt = conn.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?)");
			stmt.setInt(1, Pid);
			stmt.setString(2, model.getName());
			stmt.setString(3, model.getBloodgroup());
			stmt.setInt(4, model.getAge());
			stmt.setString(5, model.getGender());
			stmt.setString(6, model.getContact());
			stmt.setString(7, model.getDisease());
			stmt.setString(8, model.getAddress());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("addPatient ex =" + ex);
			return false;
		}
	}

	// -----------------------------------------------getPid-------------------------------------------------------
	private int getPid() {

		try {
			stmt = conn.prepareStatement("select max(Pid) from patient");
			rs = stmt.executeQuery();
			if (rs.next()) {
				synchronized (rs) {
					return rs.getInt(1);
				}
			}

			else
				return 0;
		} catch (Exception ex) {
			System.out.println("getPid ex =" + ex);
			return 0;
		}
	}

	// --------------------------------------------isPatientRemove----------------------------------------------------------
	public boolean isPatientRemove(PatientModel model) {
		try {
			stmt = conn.prepareStatement("delete from patient where Pid=?");
			stmt.setInt(1, model.getPid());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("isPatientRemove" + ex);
			return false;
		}
	}

	// --------------------------------------------viewPatientList-----------------------------------------------------------
	public List<PatientModel> viewPatientList() {
		list.clear();
		try {
			stmt = conn.prepareStatement("select *from patient");
			rs = stmt.executeQuery();

			while (rs.next()) {
				PatientModel model = new PatientModel();
				model.setPid(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setBloodgroup(rs.getString(3));
				model.setAge(rs.getInt(4));
				model.setGender(rs.getString(5));
				model.setContact(rs.getString(6));
				model.setDisease(rs.getString(7));
				model.setAddress(rs.getString(8));

				list.add(model);
			}
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println("viewPatientList ex=" + ex);
			return null;
		}
	}

	// -------------------------------------------updateAppointment---------------------------------------------------------------
	public boolean updateAppointment(PatientModel model) {
		boolean b = checkDate(model);
		if (!b) {
			System.out.println("You Insert Previous Date");
			return false;
		}
		try {
			stmt = conn.prepareStatement("update patientstatus set AppointmentDate=?, Disease=?, Did=? where Pid=?");
			stmt.setDate(1, model.getAppointmentDate());
			stmt.setString(2, model.getDisease());
			stmt.setInt(3, model.getDid());
			stmt.setInt(4, model.getPid());

			int value = stmt.executeUpdate();

			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("updateAppointment ex=" + ex);
			return false;
		}
	}

	// ----------------------------------------------addAppointment----------------------------------------------------------------
	public boolean addAppointment(PatientModel model) {
		boolean b = checkDate(model);
		if (!b)
			return false;
		try {
			stmt = conn.prepareStatement("insert into patientstatus(Pid,AppointmentDate,Disease,Did) values(?,?,?,?)");
			stmt.setInt(1, model.getPid());
			stmt.setDate(2, model.getAppointmentDate());
			stmt.setString(3, model.getDisease());
			stmt.setInt(4, model.getDid());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("addAppointment ex =" + ex);
			return false;
		}
	}

	// -----------------------------------------------viewAppointedPatients---------------------------------------------------------
	public List<PatientModel> viewAppointedPatients(int Did) {
		list.clear();
		Date ld = Date.valueOf(LocalDate.now());
		System.out.println(ld);
		try {
			stmt = conn.prepareStatement(
					"select p.Pid, p.Name, p.Gender, p.Contact, ps.AppointmentDate, ps.Category from patient p inner join patientstatus ps on p.Pid=ps.Pid and ps.AppointmentDate >= ? and Did=? order by ps.AppointmentDate");
			stmt.setDate(1, ld);
			stmt.setInt(2, Did);
			rs = stmt.executeQuery();
			while (rs.next()) {
				PatientModel model = new PatientModel();
				model.setPid(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setGender(rs.getString(3));
				model.setContact(rs.getString(4));
				model.setAppointmentDate(rs.getDate(5));
				model.setCategory(rs.getString(6));

				list.add(model);
			}
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println("viewAppointedPatients ex =" + ex);
			return null;
		}
	}

	// ---------------------------------------------------viewAllAppointedPatients--------------------------------------------------------------
	public List<PatientModel> viewAllAppointedPatients() {
		Date ld = Date.valueOf(LocalDate.now());
		System.out.println(ld);
		list.clear();
		try {
			stmt = conn.prepareStatement(
					"select p.Pid, p.Name, ps.AppointmentDate, ps.Did, ps.Category from patient p inner join patientstatus ps on p.Pid=ps.Pid where ps.AppointmentDate>=? order by ps.AppointmentDate");
			stmt.setDate(1, ld);
			rs = stmt.executeQuery();
			while (rs.next()) {
				PatientModel model = new PatientModel();
				model.setPid(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setAppointmentDate(rs.getDate(3));
				model.setDid(rs.getInt(4));
				model.setCategory(rs.getString(5));

				list.add(model);
			}
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println("viewAllAppointedPatients ex =" + ex);
			return null;
		}
	}

	// -----------------------------------------getPatient------------------------------------------------------------------------------
	public List<PatientModel> getPatient(PatientModel model) {
		list.clear();
		try {
			stmt = conn.prepareStatement(
					"select p.Name, p.Bloodgroup, p.Age, ps.Category from patient p inner join patientstatus ps where ps.Pid=? and p.Pid=?");
			stmt.setInt(1, model.getPid());
			stmt.setInt(2, model.getPid());
			rs = stmt.executeQuery();
			if (rs.next()) {
				PatientModel modelp = new PatientModel();
				modelp.setName(rs.getString(1));
				modelp.setBloodgroup(rs.getString(2));
				modelp.setAge(rs.getInt(3));
				modelp.setCategory(rs.getString(4));

				list.add(modelp);
			}
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println("getPatient ex=" + ex);
			return null;
		}
	}

	// -------------------------------------------------------isPid-----------------------------------------------------------------
	public boolean isPid(PatientModel model) {
		try {
			stmt = conn.prepareStatement("select *from patient where Pid=?");
			stmt.setInt(1, model.getPid());
			rs = stmt.executeQuery();
			return rs.next();
		} catch (Exception ex) {
			System.out.println("isPid ex =" + ex);
			return false;
		}
	}

	// ---------------------------------------------------updatePrescription-------------------------------------------------------
	public boolean updatePrescription(PatientModel model) {
		try {
			stmt = conn.prepareStatement("update patientstatus set Disease=?, Prescription=? where Pid=?");
			stmt.setString(1, model.getDisease());
			stmt.setString(2, model.getPrescription());
			stmt.setInt(3, model.getPid());
			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("updatePrescription ex =" + ex);
			return false;

		}
	}

	// -----------------------------------------------------getPrescription-----------------------------------------------------------
	public List<PatientModel> getPrescription(PatientModel model) {
		list.clear();
		try {
			stmt = conn.prepareStatement("select Prescription from patientstatus where Pid=?");
			stmt.setInt(1, model.getPid());
			rs = stmt.executeQuery();
			if (rs.next()) {
				PatientModel modelp = new PatientModel();
				modelp.setPrescription(rs.getString(1));
				list.add(modelp);
			}
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println("getPrescription ex =" + ex);
			return null;
		}
	}

	// --------------------------------------------------admmitPatient-----------------------------------------------------------------
	public boolean admmitPatient(PatientModel model) {
		try {
			LocalDate d = LocalDate.now();
			Date sqld = Date.valueOf(d);

			stmt = conn.prepareStatement("update patientstatus set AdmmitDate=?, Category=? where Pid=?");
			stmt.setDate(1, sqld);
			stmt.setString(2, "IPD");
			stmt.setInt(3, model.getPid());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("admmitPatient ex=" + ex);
			return false;
		}
	}

	// -------------------------------------------------dischargePatient---------------------------------------------------------------
	public boolean dischagePatient(PatientModel model) {
		try {

			LocalDate d = LocalDate.now();
			Date sqld = Date.valueOf(d);

			stmt = conn.prepareStatement("update patientstatus set DischargeDate=?, Category=? where Pid=?");
			stmt.setDate(1, sqld);
			stmt.setString(2, "OPD");
			stmt.setInt(3, model.getPid());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("dischargePatient ex =" + ex);
			return false;
		}
	}

	// -------------------------------------------------viewAdmmitedPatients-----------------------------------------------------------------
	public List<PatientModel> viewAdmmitedPatients() {
		list.clear();
		try {
			stmt = conn.prepareStatement(
					"select p.Pid, p.Name, p.Disease, ps.AdmmitDate, ps.Did from patient p inner join patientstatus ps where p.Pid=ps.Pid and ps.Category=? order by ps.AdmmitDate");
			stmt.setString(1, "IPD");
			rs = stmt.executeQuery();
			while (rs.next()) {
				PatientModel model = new PatientModel();
				model.setPid(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setDisease(rs.getString(3));
				model.setAdmmitDate(rs.getDate(4));
				model.setDid(rs.getInt(5));

				list.add(model);
			}
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println("viewAdmittedPatients ex =" + ex);
			return null;
		}
	}

	// -------------------------------------------------checkDate---------------------------------------------------------------------
	private boolean checkDate(PatientModel model) {
		Date ld = Date.valueOf(LocalDate.now());
		Date ad = model.getAppointmentDate();

		int check = ad.compareTo(ld);
		return check < 0 ? false : true;
	}

	// ------------------------------------------------deletePatient-----------------------------------------------------------------
	public boolean deletePatient(int Pid) {
		try {
			stmt = conn.prepareStatement("delete from patient where Pid=?");
			stmt.setInt(1, Pid);

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("deletePatient ex=" + ex);
			return false;
		}
	}

	// ----------------------------------------------------getPatientStatus----------------------------------------------------------
	public PatientModel getPatientStatus(int Pid) {
		try {
			stmt = conn.prepareStatement(
					"select p.Name, p.Bloodgroup, p.age, ps.Disease, ps.Category, ps.Prescription from patient p inner join patientstatus ps on p.Pid=ps.Pid where p.Pid=?");
			stmt.setInt(1, Pid);
			rs = stmt.executeQuery();

			if (rs.next()) {
				PatientModel model = new PatientModel();

				model.setPid(Pid);
				model.setName(rs.getString(1));
				model.setBloodgroup(rs.getString(2));
				model.setAge(rs.getInt(3));
				model.setDisease(rs.getString(4));
				model.setCategory(rs.getString(5));
				model.setPrescription(rs.getString(6));

				return model;
			} else
				return null;
		} catch (Exception ex) {
			System.out.println("getPatientStatus ex=" + ex);
			return null;
		}
	}

	// --------------------------------------------------updateAmount-------------------------------------------------------------
	public boolean updateAmount(int Pid, int Amount) {
		try {
			stmt = conn.prepareStatement("select BillAmt from patientstatus where Pid=?");
			stmt.setInt(1, Pid);
			rs = stmt.executeQuery();

			int OldAmount = 0;
			if (rs.next()) {
				OldAmount = rs.getInt(1);
			}
			Amount = Amount + OldAmount;

			stmt = conn.prepareStatement("update patientstatus set BillAmt =? where Pid=?");
			stmt.setInt(1, Amount);
			stmt.setInt(2, Pid);

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("updateAmount ex=" + ex);
			return false;
		}
	}

	// -------------------------------------getAmount---------------------------------------------------
	public int getAmount(int Pid) {
		try {
			stmt = conn.prepareStatement("select BillAmt from patientstatus where Pid=?");
			stmt.setInt(1, Pid);
			rs = stmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (Exception ex) {
			System.out.println("getAmount ex=" + ex);
			return 0;
		}
	}

	// ------------------------------------------------updatePatient----------------------------------------------------------------------
	public boolean updatePatient(PatientModel model) {
		try {
			stmt = conn.prepareStatement(
					"update patient set Name=?, Bloodgroup=?, Age=?, Gender=?, Contact=?, Disease=?, Address=? where Pid=?");
			stmt.setString(1, model.getName());
			stmt.setString(2, model.getBloodgroup());
			stmt.setInt(3, model.getAge());
			stmt.setString(4, model.getGender());
			stmt.setString(5, model.getContact());
			stmt.setString(6, model.getDisease());
			stmt.setString(7, model.getAddress());
			stmt.setInt(8, model.getPid());

			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("updatePatient ex=" + ex);
			return false;
		}
	}

	// ----------------------------getPatientCount-----------------------------------------------------
	public int getPatientCount() {
		try {
			stmt = conn.prepareStatement("select count(*) from patient");
			rs = stmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}

			return 0;
		} catch (Exception ex) {
			System.out.println("getPatientCount ex =" + ex);
			return 0;
		}
	}

	
	//------------------------------------getTodayPatientCount----------------------------------------------
	public int getTodayPatientCount() {
		try {
			stmt = conn.prepareStatement("select count(AppointmentDate) from patientstatus where AppointmentDate= current_date()");
			rs = stmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}

			return 0;
		} catch (Exception ex) {
			System.out.println("getTodayPatientCount ex=" + ex);
			return 0;
		}
	}

}
