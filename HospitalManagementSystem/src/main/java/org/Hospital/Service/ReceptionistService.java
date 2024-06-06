package org.Hospital.Service;

import java.util.*;
import org.Hopital.Repository.ReceptionistRepository;
import org.Hospital.Model.ReceptionistModel;

public class ReceptionistService {

ReceptionistRepository rr = new ReceptionistRepository();
	
	List<ReceptionistModel> list = new ArrayList<ReceptionistModel>();

	public int isReceptionistAdd(ReceptionistModel model)
	{
		return rr.addReceptionist(model)?1:rr.isReceptionist(model)?0:-1;
	}
	
	
	public boolean isRemoveReceptionist(int Rid)
	{
		return rr.isReceptionistRemove(Rid)?true:false;
	}
	
	
	public int checkLogin(ReceptionistModel model)
	{
		return rr.checkUserPass(model);
	}
	
	
	public List<ReceptionistModel> viewAllReceptionist()
	{
		 list =rr.viewReceptionistList();	 
		 return list;
	}
	
	public boolean isReceptionistUpdate(ReceptionistModel model)
	{
		return rr.updateReceptionist(model);
	}
	
	public ReceptionistModel getProfile(int rid)
	{
		return rr.getProfile(rid);
	}
}
