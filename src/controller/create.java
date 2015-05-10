package controller;

import model.ConnectionWithPerson;
public class create {
	public static boolean createAccount(String eid,String pwd,String rpwd)throws Exception
    {
		
		int valid;
		ConnectionWithPerson connection = new ConnectionWithPerson();
		System.out.println("hello how are you");
		if(pwd.equals(rpwd))
		{
			System.out.println("Hello----------------------");
			valid= connection.isValid(eid);
			if(valid==1){
				connection.createPerson(eid,pwd);
				System.out.println("heello");
				return true;
			
			}
			else if(valid==2){
				connection.createEPerson(eid, pwd);
				return true;
			}
				return false;
		}
		return false;
		
    }

}
