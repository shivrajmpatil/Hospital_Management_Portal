package org.Hospital.Service;

import org.Hopital.Repository.DoctorRepository;
import org.Hospital.Model.*;
import java.util.*;

public class DoctorService {

	DoctorRepository Dr = new DoctorRepository();
	
	List<DoctorModel> list = new ArrayList<DoctorModel>();
	
	public int isDoctorAdd(DoctorModel model)
	{
		return Dr.addDoctor(model)?1:Dr.isDoctor(model)?0:-1;
	}
	
	
	public int isRemoveDoctor(DoctorModel model)
	{
		return Dr.isDoctorRemove(model)?1:Dr.isDoctor(model)?0:-1;
	}
	
	
	public int checkLogin(DoctorModel model)
	{
		int id = Dr.checkDoctor(model);
		return id>0?id:0;
	}
	
	
	public List<DoctorModel> viewAllDoctor()
	{
		 list =Dr.viewDoctorList();
		 
		 return list;
	}
	
	
	public int isSpecilizationAdd(DoctorModel model)
	{
		return Dr.addSpecilization(model)?1:Dr.isSpecilization(model)?0:-1;
	}
	
	
	public List<DoctorModel> viewSpecilization()
	{
		list = Dr.specilizationList();
		return list;
	}
	
	public  boolean deleteSpecilization(int Sid)
	{
		return Dr.deleteSpecilization(Sid);
	}
	
	public int updateSpecilization(DoctorModel model)
	{
		return Dr.updateSpecilization(model)?1:Dr.isSpecilization(model)?0:-1;
	}
	
	public boolean deleteDoctor(int Did)
	{
		return Dr.deleteDoctor(Did);
	}
	
	public int updateDoctor(DoctorModel model)
	{
		return Dr.updateDoctor(model)?1:Dr.isDoctor(model)?0:-1;
	}
	
	public DoctorModel getProfile(int did)
	{
		return Dr.getProfile(did);
	}
	
	public int getDoctorsCount()
	{
		return Dr.getDoctorsCount();
	}
}
