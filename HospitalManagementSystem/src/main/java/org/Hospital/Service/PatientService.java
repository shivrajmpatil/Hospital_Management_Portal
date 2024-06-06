package org.Hospital.Service;

import org.Hopital.Repository.PatientRepository;
import org.Hospital.Model.*;
import java.util.*;

public class PatientService {

PatientRepository pr = new PatientRepository();
	
	List<PatientModel> list = new ArrayList<PatientModel>();
	
	public boolean isPatientAdd(PatientModel model)
	{
		return pr.addPatient(model);
	}
	
	
	public int isRemovePatient(PatientModel model)
	{
		return pr.isPatientRemove(model)?1:0;
	}
	
	
	public List<PatientModel> viewAllPatient()
	{
		 list =pr.viewPatientList();
		 
		 return list;
	}
	
	
	public int setAppointment(PatientModel model)
	{
		return pr.updateAppointment(model)?1:pr.addAppointment(model)?0:-1;
	}
	
	
	public List<PatientModel> viewAllAppointedPatient()
	{
		list = pr.viewAllAppointedPatients();
		
		return list;
	}
	
	
	public int isPid(PatientModel model)
	{
		list= pr.getPatient(model);
		if(list!=null)
		{	System.out.println("Patient Details : :\n=====================================================================================================================================");
			for(PatientModel l : list)
				System.out.println("Patient Name : "+l.getName()+"\nBlood group : "+l.getBloodgroup()+"\nAge : "+l.getAge()+"\nCategory : "+l.getCategory()+"\n|------------------------------|");
			return 1;
		}
		else
			return pr.isPid(model)?0:-1;
	}
	
	
	public boolean setPrescription(PatientModel model)
	{
		return pr.updatePrescription(model);
	}
	
	
	public int viewPrescription(PatientModel model)
	{
		list = pr.getPrescription(model);
		if(list!=null)
		{
			for(PatientModel l : list)
				System.out.println("Prescription ::\n"+l.getPrescription());
			return 1;
		}
		else
			return 0;
	}
	
	
	public List<PatientModel> viewAppointedPatient(int Did)
	{	
		list = pr.viewAppointedPatients(Did);
		
		return list;
	}
	
	
	public boolean admmitPatient(PatientModel model)
	{
		return pr.admmitPatient(model);
	}
	
	public boolean dischargePatinet(PatientModel model)
	{
		return pr.dischagePatient(model);
	}
	
	public List<PatientModel> viewAdmmitPatients()
	{
		list = pr.viewAdmmitedPatients();	
		return list;
	}
	
	public boolean deletePatient(int Pid)
	{
		return pr.deletePatient(Pid);
	}
	
	public boolean updatePatient(PatientModel model)
	{
		return pr.updatePatient(model);
	}
	
	public PatientModel getPatientStatus(int Did)
	{
		return pr.getPatientStatus(Did);
	}
	
	public boolean updateBill(int Pid, int Amount)
	{
		return pr.updateAmount(Pid, Amount);
	}
	
	public int getBill(int Pid)
	{
		return pr.getAmount(Pid);
	}
	
	//======================================SearchPatient==========================================================
	public void searchPatientById(int id)
	{
		list.clear();
		
		list =pr.getPatientById(id);
		
		if(list!=null)
		{
			System.out.println("Patient Details::\n==============================================================================================================================================");
			System.out.println("Name\tContact\tAddress");
			for(PatientModel l :list)
				System.out.println(l.getName()+"\t"+l.getContact()+"\t"+l.getAddress());
		}
		else
			System.out.println("Patient Not Found");
	}
	
	
	public void searchPatientByName(String name)
	{
		list.clear();
		
		list =pr.getPatientByName(name);
		
		if(list!=null)
		{
			System.out.println("Patient Details::\n==============================================================================================================================================");
			System.out.println("Id\tContact\tAddress");
			for(PatientModel l :list)
				System.out.println(l.getPid()+"\t"+l.getContact()+"\t"+l.getAddress());
		}
		else
			System.out.println("Patient Not Found");
	}
	
	public void searchPatientByDisease(String disease)
	{
		list.clear();
		
		list =pr.getPatientByDisease(disease);
		
		if(list!=null)
		{
			System.out.println("Patient Details::\n==============================================================================================================================================");
			System.out.println("Id\tName\tContact\tAddress");
			for(PatientModel l :list)
				System.out.println(l.getPid()+"\t"+l.getName()+"\t"+l.getContact()+"\t"+l.getAddress());
		}
		else
			System.out.println("Patient Not Found");
	}
	
	public void searchPatientByCategory(String category)
	{
		list.clear();
		
		list =pr.getPatientByCategory(category);
		
		if(list!=null)
		{
			System.out.println("Patient Details::\n==============================================================================================================================================");
			System.out.println("Id\tName\tContact\tAddress");
			for(PatientModel l :list)
				System.out.println(l.getPid()+"\t"+l.getName()+"\t"+l.getContact()+"\t"+l.getAddress());
		}
		else
			System.out.println("Patient Not Found");
	}
	
	public void searchPatientByDate(String date)
	{
		list.clear();
		
		list =pr.getPatientByDate(date);
		
		if(list!=null)
		{
			System.out.println("Patient Details::\n==============================================================================================================================================");
			System.out.println("Id\tName\tContact\tAddress");
			for(PatientModel l :list)
				System.out.println(l.getPid()+"\t"+l.getName()+"\t"+l.getContact()+"\t"+l.getAddress());
		}
		else
			System.out.println("Patient Not Found");
	}
	
	
}
