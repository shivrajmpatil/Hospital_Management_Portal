package org.Hospital.Model;

public class DoctorModel {

	private int Did;
	private String Name;
	private String Specilization;
	private String Gender;
	private String Contact;
	private String Username;
	private String Password;
	private int Sid;
	
	public DoctorModel()
	{
		
	}
	
	public DoctorModel(String name, int sid, String gender, String contact, String user, String pass)
	{
		this.Name=name;
		this.Sid=sid;
		this.Gender=gender;
		this.Contact=contact;
		this.Username=user;
		this.Password=pass;
	}
	
	
	
	public DoctorModel(int did, String name, String gender, String contact, String username, int sid) {
		super();
		Did = did;
		Name = name;
		Gender = gender;
		Contact = contact;
		Username = username;
		Sid = sid;
	}

	public int getDid() {
		return Did;
	}
	public void setDid(int did) {
		Did = did;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getSpecilization() {
		return Specilization;
	}
	public void setSpecilization(String specilization) {
		Specilization = specilization;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getContact() {
		return Contact;
	}
	public void setContact(String contact) {
		Contact = contact;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}

	public int getSid() {
		return Sid;
	}

	public void setSid(int sid) {
		Sid = sid;
	}
	
}
