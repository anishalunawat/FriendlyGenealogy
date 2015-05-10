package controller;



import model.ConnectionWithPerson;
public class details {
	public static boolean editDetails(String fname,String lname,String eid,String gender,String place,String occupation,String dob)throws Exception
    {
		Boolean edited;
		ConnectionWithPerson connection = new ConnectionWithPerson();
		edited=connection.editDetails(fname,lname,eid,gender,place,occupation,dob);
		return edited;
		
    }

}
