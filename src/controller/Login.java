package controller;

import java.sql.SQLException;
import model.ConnectionWithPerson;

public class Login {

    public static String checkLogin(String eid,String pwd)throws SQLException
    {
    	ConnectionWithPerson connect =new ConnectionWithPerson();
    	String name;
        if((name=connect.isValid(eid,pwd))!=null){
            return name;
        }
            return null;

    }
    public static String[] getFather(String eid){
    	ConnectionWithPerson connect =new ConnectionWithPerson();
    	String father[]= connect.getFather(eid);
    	return father;
    }

    public static String[] getMother(String eid){
    	ConnectionWithPerson connect =new ConnectionWithPerson();
    	String mother[]= connect.getMother(eid);
    	return mother;
    }
    
    public static String[][] getFriends(String eid){
    	ConnectionWithPerson connect =new ConnectionWithPerson();
    	return connect.getFriends(eid);
    }
    
    public static String[][] getChildren(String eid){
    	
    	ConnectionWithPerson connect =new ConnectionWithPerson();
    	return connect.getChildren(eid);
    }
    
    public static String[] getSpouse(String email){
    	ConnectionWithPerson connect =new ConnectionWithPerson();
    	return connect.getspouse(email);
    }
    
}