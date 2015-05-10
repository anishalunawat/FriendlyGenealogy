package model;

//import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.db4o.*;
//import com.db4o.cs.Db4oClientServer;
//import com.db4o.cs.config.ServerConfiguration;
import com.db4o.query.Predicate;
//import com.db4o.query.Query;

public class ConnectionWithPerson {

	static String Db4o = "d:/person.db4o";
	static ObjectContainer db;
	ObjectServer server;
	ObjectContainer client;
	//private final static int PORT = 8080;
	//private final static String USER = "user";
	
	//private final static String PASSWORD = "password";
	
	public ConnectionWithPerson(){
		
	}
	
	
	// called by createaccount in create.java
	// to create the new Account
	public void createPerson(String email, String password){
		try{
			remoteConnect();
			
			Person person = new Person(email,true);
			person.setPassword(password);
			db.store(person);
			//listResult((db.queryByExample(new Person(null,true))));
			
		}
		finally{
			db.close();
		}
		
	}
	
	public void createEPerson(String email, String password){

		try{
			remoteConnect();
			Person person;
			List<Person> persons = emailQuery(email);
			System.out.println("size = "+persons.size());
			if(persons.size()==1){
				person=persons.get(0);
				person.setEmail(email);
				person.setPassword(password);
				person.setCreate(true);
				db.store(person);
			}
		}
		finally{
			db.close();
		}
		
	}
	
	// to print the objects
	public static void listResult(List<?> result){
		System.out.println(result.size());
		for (Object o : result) {
		
		System.out.println(o);
		}
		}
	
	
	//call by checklogin() in login.java
	// to valid the user for login
	public String isValid(final String email,final String password){
		try{
			
			remoteConnect();
			List<Person> result=db.query(new Predicate<Person>() {
				public boolean match(Person person) {
				return person.getEmail().equals(email)
						&& person.getPassword().equals(password);
				}
				});
			
			if(result.size()==1){
				System.out.println(result.size());
				return ((Person)result.get(0)).getName();
				
			}
			else
				return null;
		}
		finally
		{
			db.close();
		//	server.close();
			
			
		}
		
	}
	
	
	// called by editDetails in details.java
	// to edit details of the user
	public boolean editDetails(String fname,String lname,final String email,String gender,String place,String occupation,String dob)
	{	
	
		try{
		
		
			remoteConnect();
			
			List<Person> persons = emailQuery(email);
			System.out.println("size = "+persons.size());
			if(persons.size()==1){
				
				Person person =(Person) persons.get(0);
				person.setName(fname,lname);
				person.setGender(gender);
				person.setDob(dob);
				person.setAddress(place);
				person.setOccupation(occupation);
				db.store(person);
			return true;
			}
		}
		finally{
			db.close();
		}
		return false;
	}
	
	
	// called by isValid() creatAccount in create.java
	public int isValid(final String email)
	{
		try{
		
			remoteConnect();
			List<Person> person = emailQuery(email);
			if(person.size()==0){
				System.out.println("congratulations" +person.size());
			
				return 1;
			
			}
			else if(person.size()==1){
				Person per;
				per = person.get(0);
				if(!per.getCreate())
					return 2;
			}
			return 0;
		}
		finally
		{
			db.close();
		}
		
		
	}
	
	
	
	
	

	
	
	
	
	// to make connection 
		public void remoteConnect(){
			db=Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), Db4o);
			// ServerConfiguration config =Db4oClientServer.newServerConfiguration();
			
		}
		
		// query to find object with a given email id
		static List<Person> emailQuery(final String email){
		List<Person> result =db.query(new Predicate<Person>() {
				public boolean match(Person person) {
				return person.getEmail().equals(email);
				}
			}
		
			);
			return result;
		}

		
		
		// to retrieve details.
		public String[] getFather(String eid) {
			// TODO Auto-generated method stub
			try{
				remoteConnect();
				Person father;
				List<Person> person = emailQuery(eid);
				if(person.size()==1)
				{		
					father=((Person)person.get(0)).getFather();
					if(father!=null){
						System.out.println("im in getfather"+father.getName()+"   "+eid);
						String[] fatherdetails = {father.getName(), father.getEmail()};
						return fatherdetails;
					}
					
					else 
						return null;
				}
				return null;
			}
			finally{
				db.close();
			}
			
			
		}


				public String[] getMother(String eid) {
					// TODO Auto-generated method stub
					try{
						remoteConnect();
						Person mother;
						List<Person> person = emailQuery(eid);
						if(person.size()==1)
						{		
							mother=((Person)person.get(0)).getMother();
							if(mother!=null){
								System.out.println("im in getmother"+mother.getName());
								String[] motherdetails = {mother.getName(), mother.getEmail()};
								return motherdetails;
							}
							
							else 
								return null;
						}
						return null;
					}
					finally{
						db.close();
					}
					
					
				}



		public String[][] getFriends(String eid) {
			// TODO Auto-generated method stub
			try{
				remoteConnect();
				String[][] friends;
				List<Person> person = emailQuery(eid);
				if(person!=null)
				{		
					String[][] friend=((Person)person.get(0)).getFriend();
					int size = friend.length;
					//Person person;
					friends = new String[size][2];
					if(friend[0][0]!=null)
					{	
						for(int i=0;i<size;i++){
						
						friends[i][0]=friend[i][1]+" "+friend[i][2];
						friends[i][1]=friend[i][0];
					}
				
					}
					
					else{
						friends[0][0]=null;
						friends[0][1]=null;
					}	return friends;
					
					
					
				}
				return null;
			}
			finally{
				db.close();
			}
		}


		public String[][] getChildren(String eid) {
			// TODO Auto-generated method stub
			try{
				remoteConnect();
				String[][] children;
				List<Person> person = emailQuery(eid);
				if(person.size()==1)
				{	
					System.out.println(person.get(0).getEmail()+" is email i have got");
					//ArrayList<Person> childrenList=((Person)person.get(0)).getChildren();
					Person persons = person.get(0);
					String[][] childrenList= persons.getChildren();
					if(childrenList!=null){
						int size = childrenList.length;
						System.out.println("size of the child list is "+size);
						//Person person;
						children = new String[size][2];
						if(childrenList[0][0]!=null){
						for(int i=0;i<size;i++){
							
							children[i][0]=childrenList[i][1]+" "+childrenList[i][2];
							System.out.println(children[i][0]+"holaa");
							children[i][1]=childrenList[i][0];
						}
						}
						else{
							children[0][0]=null;
							children[0][1]=null;
						}
						 return children;
						
						
					}
				}
				return null;
			}
			finally{
				db.close();
			}
		}


		public String[] getspouse(String email) {
			// TODO Auto-generated method stub
			try{remoteConnect();
			Person spouse;
			List<Person> person = emailQuery(email);
			if(person.size()==1)
			{		
				spouse=((Person)person.get(0)).getSpouse();
				if(spouse!=null){
				String[] spousedetails = {spouse.getName(), spouse.getEmail()};
				System.out.println(spousedetails[0]+"i am in getconection");
				return spousedetails;
				}
				return null;
			}
			return null;
			}
			finally{
				db.close();
			}
		}
		
		public String[][] getBrothersAndSisters(String email, String gender){
			// TODO Auto-generated method stub
			try{
					remoteConnect();
				Person father,sibling;
				String[][] brothers,sisters;
				List<Person> person = emailQuery(email);
			String gend;
				if(person.size()==1)
				{		
					gend = ((Person)person.get(0)).getGender();
					father=((Person)person.get(0)).getFather();
					if(father!=null){
						person = emailQuery(father.getEmail());
						if(person.size()==1){
							ArrayList<Person> brother,sister;
							int countBrothers=0,countsisters=0;
							String[][] siblings = ((Person)person.get(0)).getChildren();
							if(siblings[0][0]!=null){
							int size = siblings.length;
							brother= new ArrayList<Person>();
							sister= new ArrayList<Person>();
							for(int i=0;i<size;i++){
								List<Person> sib=emailQuery(siblings[i][0]);
								sibling=sib.get(0);
								if(sibling.getGender()==null ||sibling.getGender().equalsIgnoreCase("male")){
									countBrothers++;
									brother.add(sibling);
								}
								else{
									countsisters++;
									sister.add(sibling);
								}
							}
							
							String[] pending = father.getChildrenRequest();
							int flag=0;
							if(pending!=null){
								
								int pendSize = pending.length;
								for(int i=0;i<pendSize;i++){
									if(pending[i].equals(email))
										flag=1;
								}
							}
							
							
							
							int j=0;
							if(gender.equalsIgnoreCase("male")){
								size = brother.size();
								if(gend.equalsIgnoreCase("male") && flag==0)
									brothers= new String[size-1][2];
								else
									brothers= new String[size][2];
								for(int i = 0;i<size;i++){
									if(!((brother.get(i)).getEmail()).equals(email)){
										brothers[j][0]=(brother.get(i)).getName();
										brothers[j][1]=(brother.get(i)).getEmail();
										j++;
									}
								}
								return brothers;
							}
							
							else{
								j=0;
								size = sister.size();
								if(gend.equalsIgnoreCase("female") && flag==0)
									sisters= new String[size-1][2];
								else
									sisters= new String[size][2];
								
								for(int i = 0;i<size;i++){
								if(!((sister.get(i)).getEmail()).equals(email)){
									sisters[j][0]=(sister.get(i)).getName();
									sisters[j][1]=(sister.get(i)).getEmail();
									j++;
									}  
								}
								return sisters;
							}
						}
						
					}
				}
				}
				return null;
				}
			finally{
				db.close();
			}
		}
		
		
		public String[][] pendingRequest(String email){
			String[][] requests=null;
			String[] requestfriend;
			String[] requestchild;
			try{
				remoteConnect();
				Person person;
				List<Person> persons = emailQuery(email);
				if(persons!=null){
					person = persons.get(0);
					requestfriend= person.getFriendRequest();
					requestchild= person.getChildrenRequest();
					int childSize=0, friendSize=0,size=0, f=0,m=0,s=0;
					if(requestchild!=null)
						childSize= requestchild.length;
					if(requestfriend!=null)
						friendSize= requestfriend.length;
					String father = person.getFatherRequest();
					if(father!=null)
						f=1;
					String mother = person.getMotherRequest();
					if(mother!=null)
						m=1;
					String spouse = person.getSpouseRequest();
					if(spouse!=null)
						s=1;
					size=friendSize+childSize+s+m+f;
					if(size!=0)
						requests=new String[size][3];
					Person family;
					if(father!=null){
						persons = emailQuery(father);
						family =persons.get(0);
						requests[0][0] = family.getName();
						requests[0][1] = family.getEmail();
						requests[0][2] = "father";
					}
					
					if(mother!=null){
						persons = emailQuery(mother);
						family= persons.get(0);
						requests[f][0] = family.getName();
						requests[f][1] = family.getEmail();
						requests[f][2] = "mother";
					}
					if(spouse!=null){
						persons = emailQuery(spouse);
						family = persons.get(0);
						requests[m+f][0] = family.getName();
						requests[m+f][1] = family.getEmail();
						requests[m+f][2] = "spouse";
					}
					for(int i=0;i<friendSize;i++){
						persons = emailQuery(requestfriend[i]);
						Person  friend =persons.get(0);
						requests[i+m+f+s][0] = friend.getName();
						requests[i+m+f+s][1] = friend.getEmail();
						requests[i+m+f+s][2] = "friend";
					}
					
					int currentSize= friendSize+s+m+f;
					for(int i=0;i<childSize;i++){
						persons = emailQuery(requestchild[i]);
						Person child =persons.get(0);
						requests[i+currentSize][0] = child.getName();
						requests[i+currentSize][1] = child.getEmail();
						requests[i+currentSize][2] = "child";
					}
					///if(size==0)
					
					return requests;
				}
			return null;
			}
			finally{
				db.close();
			}
		}
	
	public String[] otherDetails(String email){
		try{
			remoteConnect();
			Person person;
			String[] details = new String[6]; 
			List<Person> persons = emailQuery(email);
			if(persons!=null)
			{
				person= persons.get(0);
				details[0] = person.getAddress();
				details[1] = person.getGender();
				details[2] = String.valueOf(person.getcontact());
				details[3] = person.getDODeath();
				details[4] = person.getDOB();
				details[5] = person.getOccupation();
				return details;
			}
			
			return null;
		}
		finally{
			db.close();
		}
	}
	
	
	
	public String[][] getCousins(String email){
		String fatherEmail,motherEmail;
		int i,size=0,size1=0,size2=0,size3=0,size4=0,j,k=0;
		String[] father;
		try{
			remoteConnect();
			System.out.println("hello i m in father part");
			List<Person> persons = emailQuery(email);
			Person person = persons.get(0);
		}
		finally{
			db.close();
		}
		String[][] fatherBrothers=null,fatherSisters=null,motherBrothers=null,motherSisters=null ;
			 father = getFather(email);
			 if(father!=null){
				 fatherEmail = father[1];
			 	 System.out.println("hello i m in father part");
			 	  fatherBrothers  = getBrothersAndSisters(fatherEmail, "male");
			 	 fatherSisters = getBrothersAndSisters(fatherEmail, "female");
			 }
			String[] mother = getMother(email);
			if(mother!=null){
				motherEmail = mother[1];
				System.out.println("hello i m in mother part");
				 motherBrothers  = getBrothersAndSisters(motherEmail, "male");
				motherSisters = getBrothersAndSisters(motherEmail, "female");
			}
			//String[][] getChildren(String eid) 
			
			String[][][] allCousins;
			if(fatherBrothers!=null)
				size1 = fatherBrothers.length;
			if(fatherSisters !=null)
				size2 = fatherSisters.length;
			
			if(motherBrothers!=null)
				size3 = motherBrothers.length;
			if(motherSisters !=null)
				size4 = motherSisters.length;
			size= size1+size2+size3+size4;
			allCousins= new String[size][][];
			
			
			for(i=0;i<size1;i++){
				allCousins[i] = getChildren(fatherBrothers[i][1]);
			}
			
			for(i=size1,j=0;j<size2;j++,i++){
				allCousins[i] = getChildren(fatherSisters[j][1]);
			}
			
			for(i=size1+size2,j=0;j<size3;j++,i++){
				allCousins[i] = getChildren(motherBrothers[j][1]);
			}
			for(i=size1+size2+size3,j=0;j<size4;j++,i++){
				allCousins[i] = getChildren(motherSisters[j][1]);
			}
			
			
			String[][] cousins = new String[size][2];
			for(i=0;i<size;i++){
				int s;
				s= allCousins[i].length;
				for(j=0;j<s;j++){
					cousins[k][0] = allCousins[i][j][0];
					cousins[k][1] = allCousins[i][j][1];
					k++;
				}
			}
			
			return cousins;
		
	}
	
	
	public String[][] getSonAndDaughterInLaw(String email,String gender){
		Person person;
		int i,size, noOfDaughters=0,j=0;
		String[][] InLaw = null;
		Person daughterOrSon;
		List<Person> persons;
		try{
			
			remoteConnect();
			persons = emailQuery(email);
			person = persons.get(0);
		}finally{
			db.close();
		}
		if(getChildren(person.getEmail())[0][0]!=null){
			String[][] children = getChildren(person.getEmail());
			size = children.length;
			
			try{
				remoteConnect();
				for(i=0;i<size;i++){
					List<Person> child = emailQuery(children[i][1]);
					daughterOrSon=child.get(0);
					if((daughterOrSon.getGender()).equalsIgnoreCase(gender) && daughterOrSon.getSpouse()!=null)
							noOfDaughters++;
				}
				
				InLaw = new String[noOfDaughters][2];
				for(i=0;i<size;i++){
					
					List<Person> child = emailQuery(children[i][1]);
					daughterOrSon=child.get(0);
					if(((daughterOrSon.getGender()).equalsIgnoreCase(gender)) && daughterOrSon.getSpouse()!=null)
					{
						//inlaw details
						InLaw[j][0]=daughterOrSon.getSpouse().getName();
						InLaw[j][1] = daughterOrSon.getSpouse().getEmail();
						j++;
					}	
					
				}
			}
				finally{
					db.close();
				}
			System.out.println("size of child list"+noOfDaughters);
				return InLaw;
			
		}
		return null;
		
			
		
	}
	
	public String[][] getMotherInLawAndFatherInLaw(String email, String gender){
		
		try{
			remoteConnect();
			Person person;
			List<Person> persons = emailQuery(email);
			person = persons.get(0);
			Person spouse;
			String[][] inLaw = new String[1][2];
			spouse = person.getSpouse();
			if(spouse!=null){
				if(gender.equalsIgnoreCase("male")){
					if(spouse.getFather()!=null)
					inLaw[0][0] = spouse.getFather().getName();
					inLaw[0][1] = spouse.getFather().getEmail();
				}
				else if(spouse.getMother()!=null){
					
					inLaw[0][0] = spouse.getMother().getName();
					inLaw[0][1] = spouse.getMother().getEmail();
				}
			}
			return inLaw;
		}
		finally{
			db.close();
		}
	}
	
	
	public String[][] getNeiceOrNephew(String email, String gender){
		int size,i,numOfBrothers=0,numOfSisters=0, numOfChildren=0,j,numOfNeiceOrNephew=0;
		
		Person person;
		try{
			
			remoteConnect();
			
			List<Person> persons = emailQuery(email);
			person= persons.get(0);
		}
		finally{
			db.close();
		}
			String[][] brothers = getBrothersAndSisters(email,"male"); 
			String[][] sisters = getBrothersAndSisters(email,"female");
			String[][] neiceOrNephew=null;
			List<Person> per;
			Person brother;
			String[][] children;
			try{
				remoteConnect();
			if(brothers!=null){
				numOfBrothers = brothers.length;
				System.out.println("numOfBrothers    "+ numOfBrothers);
				for(i=0;i<numOfBrothers;i++){
					per = emailQuery(brothers[i][1]);
					brother= per.get(0);
					children=brother.getChildren();
					if(children[0][0]!=null){
						numOfChildren = children.length;
						for(j=0;j<numOfChildren;j++){
							per=emailQuery(children[i][1]);
							person = per.get(0);
							if(person.getGender().equalsIgnoreCase(gender))
								System.out.println("hello my son is "+ person.getName());
								numOfNeiceOrNephew++;
						}
						
					}
						
				}
			}
			Person sister;
			if(sisters!=null){
				numOfSisters = sisters.length;
				for(i=0;i<numOfSisters;i++){
					per = emailQuery(sisters[i][1]);
					sister= per.get(0);
					children=sister.getChildren();
					if(children[0][0]!=null){
						numOfChildren = children.length;
						for(j=0;j<numOfChildren;j++){
							per=emailQuery(children[i][1]);
							person = per.get(0);
							if(person.getGender().equalsIgnoreCase(gender)){
								System.out.println("Hello my daughter is "+person.getName());
								numOfNeiceOrNephew++;
							}
						}
						
					}
						
				}	
				
			}
				
			neiceOrNephew = new String[numOfNeiceOrNephew][2];	
			int k=0;
			if(brothers!=null){
				numOfBrothers = brothers.length;
				for(i=0;i<numOfBrothers;i++){
					per = emailQuery(brothers[i][1]);
					brother= per.get(0);
					children=brother.getChildren();
					if(children!=null){
						numOfChildren = children.length;
						for(j=0;j<numOfChildren;j++){
							per=emailQuery(children[i][1]);
							person = per.get(0);
							if(person.getGender().equalsIgnoreCase(gender)){
								
								neiceOrNephew[k][0] = person.getName();
								neiceOrNephew[k][1] = person.getEmail();
								k++;
							}
						}
						
					}
						
				}
			}
			if(sisters!=null){
				numOfSisters = sisters.length;
				System.out.println("num of brothers is "+numOfSisters);
				for(i=0;i<numOfSisters;i++){
					per = emailQuery(sisters[i][1]);
					sister= per.get(0);
					children=sister.getChildren();
					if(children[0][0]!=null){
						numOfChildren = children.length;
						for(j=0;j<numOfChildren;j++){
							per=emailQuery(children[i][1]);
							person = per.get(0);
							if(person.getGender().equalsIgnoreCase(gender)){
								neiceOrNephew[k][0] = person.getName();
								neiceOrNephew[k][1] = person.getEmail();
								k++;
							}
						}
						
					}
						
				}	
				
			}
			return neiceOrNephew;
				}
				finally{
					db.close();
				}
			
		
	}
	
	
	
	public String[][] getGrandFatherAndGrandMother(String email, String gender){
		
		Person person,father,grandRelation=null;
		String[][] grandFatherOrGrandMother= null;
		List<Person> persons;
		try{
			remoteConnect();
			persons = emailQuery(email);
			person = persons.get(0);
			father = person.getFather();
			if(father!=null){
				System.out.println("I m the father "+father.getName());
				if(gender.equalsIgnoreCase("male"))
					grandRelation = father.getFather();
				else
					grandRelation = father.getMother();
			}
			if(grandRelation !=null){
				grandFatherOrGrandMother= new String[1][2];
				grandFatherOrGrandMother[0][0]=grandRelation.getName();
				grandFatherOrGrandMother[0][1] = grandRelation.getEmail();
				
			}
			return grandFatherOrGrandMother;
		}
		finally{
			db.close();
		}
	}
	
	public String getGender(String email){
		try{
			remoteConnect();
			List<Person> persons = emailQuery(email);
			Person person = persons.get(0);
			return person.getGender();
		}
		finally{
			db.close();
		}
	}
	
	public String[][] getGrandSonAndGrandDaughter(String email,  String gender){
		
		Person person;
		String[][][] grandRelation=null;
		String[][] children, grandSonOrDaughter= null;
		List<Person> persons;
		try{
			remoteConnect();
			persons = emailQuery(email);
			person = persons.get(0);
			children = person.getChildren();
			
		}
		finally
		{
			db.close();
		}
		int sizeOfGrandRelation=0;
		if( children[0][0]!=null){
			int size  = children.length;
			grandRelation = new String[size][][];
			
			for(int i=0;i<size;i++){
				grandRelation[i] = getChildren(children[i][1]);  
				int childsize = grandRelation[i].length;
				for(int j=0;j<childsize;j++){
				if(grandRelation[i][0][0]!=null && getGender(grandRelation[i][j][1]).equalsIgnoreCase(gender)){
					sizeOfGrandRelation+=grandRelation[i].length;
				}
				}
			}
			int k=0;
			grandSonOrDaughter = new String[sizeOfGrandRelation][2];
			for(int i=0;i<size;i++){
				int childsize = grandRelation[i].length;
				if(grandRelation[i][0][0]!=null){
					for(int j=0;j<childsize;j++){
						if(getGender(grandRelation[i][j][1]).equalsIgnoreCase(gender)){
						grandSonOrDaughter[k][0] = grandRelation[i][j][0];
						grandSonOrDaughter[k][1] = grandRelation[i][j][1];
						System.out.println("hello my grandson are"+grandSonOrDaughter[k][0]);
						k++;
						}
					}
				}
			}
			
		}
		System.out.println("size of children is "+grandSonOrDaughter.length);
		return grandSonOrDaughter;
	}
	
	
	// to delete details
	
	public boolean deleteFather(String email){
		try{	
			remoteConnect();
			Person person,father;
			boolean b;
			List<Person> persons = emailQuery(email);
			if(persons!=null)
			{
				person= persons.get(0);
				father= person.getFather();
				father.removeRequestChild(person);
				b= person.deleteFather();
				db.store(father);
				db.store(person);
				return b;
				
			}
			return false;
		}
		finally{
			db.close();
		}
	}
	
	public boolean deleteMother(String email){
		try{
			remoteConnect();
			Person person,mother;
			boolean b;
			List<Person> persons = emailQuery(email);
			if(persons!=null)
			{
				person= persons.get(0);
				mother= person.getMother();
				mother.removeRequestChild(person);
				b= person.deleteMother();
				db.store(mother);
				db.store(person);
				return b;
			}
			return false;
		}
		finally{
			db.close();
		}
	}
	public boolean deleteSpouse(String email){
		try{
			remoteConnect();
			Person person,spouse;
			boolean b;
			List<Person> persons = emailQuery(email);
			if(persons!=null)
			{
				person= persons.get(0);
				b= person.deleteSpouse();
				db.store(person);
				return b;
			}
			return false;
		}
		finally{
			db.close();
		}
	}
	
	public boolean deleteFriend(String email, String  friendEmail){
		try{
			remoteConnect();
			Person person, friends;
			
			List<Person> persons = emailQuery(email);
			if(persons != null){
				person = persons.get(0);
				List<Person> friend = emailQuery(friendEmail);
				if(friend!=null){
					friends=friend.get(0);
					friends.removeRequestFriend(person);
					person.deleteFriend(friends);
					db.store(person);
					db.store(friends);
				}
				return true;
			}
			return false;
		}
		finally{
			db.close();
		}
	}
	
	
	public boolean deleteChildren(String email, String  friendEmail){
		try{
			remoteConnect();
			Person person, child, parent;
			boolean b;
			List<Person> persons = emailQuery(email);
			if(persons != null){
				parent = persons.get(0);
				List<Person> children = emailQuery(friendEmail);
				if(children!=null){
					child = children.get(0);
					if((parent.getGender().equalsIgnoreCase("male")))
						child.removeRequestFather();
					else
						child.removeRequestMother();
					parent.deleteChildren(child);
				
					db.store(child);
				}
				db.store(parent);
			}
			return false;
		}
		finally{
			db.close();
		}
	}
	
	
	public void deleteBrotherAndSister(String email, String brotherOrSister){
		Person person=null, child=null, father=null,mother=null;
		try{
			remoteConnect();
			
			List<Person> persons = emailQuery(email);
			person= persons.get(0);
			father = person.getFather();
			}
			finally{
				db.close();
			}
	
			if(father!=null){
				deleteChildren(father.getEmail(),brotherOrSister);
			}
			else if((mother=person.getMother())!=null){
				deleteChildren(mother.getEmail(),brotherOrSister);

			}
		
	}
	//to add
	
	public void addFather(String email, String fatherFName, String  fatherLName,String fatherEmail ){
		try{
			remoteConnect();
		
		Person person, EFather;
		List<Person> persons= emailQuery(email);
		List<Person> father = emailQuery(fatherEmail);
		person = persons.get(0);
		if(father.size() == 0){
			
			person.addFather(fatherEmail,fatherFName, fatherLName);
			
			System.out.println(fatherFName+"i am in CWP");
			db.store(person);
		}
		else
		{
			EFather = father.get(0);
			EFather.addChildRequest(person);
			EFather.setGender("male");
			person.addEFather(EFather);
			db.store(EFather);
			db.store(person);
			
		}
		}
		finally{
			db.close();
		}
	}
	
	public void addMother(String email, String motherFName, String  motherLName,String motherEmail ){
		try{
			remoteConnect();
		
		Person person, EMother;
		List<Person> persons= emailQuery(email);
		List<Person> mother = emailQuery(motherEmail);
		person = persons.get(0);
		if(mother.size() == 0){
			
			person.addMother(motherEmail,motherFName, motherLName);
			System.out.println(motherFName+"i am in CWP");
			db.store(person);
		}
		else
		{
			EMother = mother.get(0);
			EMother.addChildRequest(person);
			person.addEMother(EMother);
			db.store(EMother);
			db.store(person);
			
		}
		}
		finally{
			db.close();
		}
	}
	
	
	public void addSpouse(String email, String spouseFName, String spouseLName,String spouseEmail ){
		try{remoteConnect();
		Person person, ESpouse;
		List<Person> persons= emailQuery(email);
		List<Person> spouse = emailQuery(spouseEmail);
		person = persons.get(0);
		String gender = person.getGender();
		if(spouse.size()==0){
			person.addSpouse(spouseEmail,spouseFName, spouseLName,gender);
			System.out.println(spouseFName+"i am in addSpouse");
			db.store(person);
		}
		else
		{
			ESpouse = spouse.get(0);
			ESpouse.addSpouseRequest(person);
			person.addESpouse(ESpouse);
			db.store(ESpouse);
			db.store(person);
		}
		}
		finally{
			db.close();
		}
	}
	
	public void addFriend(String email, String friendEmail, String  friendLName,String friendFName ){
		try{
			remoteConnect();
			Person person, eFriend;
			List<Person> persons= emailQuery(email);
			List<Person> friend = emailQuery(friendEmail);
			person = persons.get(0);
			if(friend.size()== 0){
				Person friends = new Person(friendEmail,friendFName, friendLName,false);
				person.addFriend(friendEmail,friendFName, friendLName);
				friends.addFriendRequest(email);
				db.store(person);
				db.store(friends);
			}
			else
			{
				Person friends = friend.get(0);
				//eFriend = friend.get(0);
				//eFriend.addFriendRequest(person);
				person.addFriend(friendEmail,friendFName, friendLName);
				friends.addFriendRequest(email);
				//db.store(eFriend);
				db.store(person);
			}
		}
		finally{
			db.close();
		}
	}
	
	public void addChildren(String email, String childrenFName, String  childrenLName,String childrenEmail ){
		
		try{
			remoteConnect();
			Person person, eChildren;
			List<Person> persons= emailQuery(email);
			System.out.println(email);
			List<Person> children = emailQuery(childrenEmail);
			person = persons.get(0);
			String gender = person.getGender();
			if(children.size()== 0){
				
				
				//see the request;
				
				
				Person child = new Person( childrenEmail,childrenLName, childrenFName,false);
				if(gender.equalsIgnoreCase("male"))
				child.addFatherRequest(email);
				else
					child.addMotherRequest(email);
				db.store(child);
				person.addChild(childrenEmail,childrenLName, childrenFName);
				Person spouse = person.getSpouse();
				if(spouse!=null)
				spouse.addChild(childrenEmail, childrenLName, childrenFName);
				db.store(person);
				
//				System.out.println(childrenFName+"lala i m in get childs   "+ email);
//				person.addChild(childrenEmail,childrenFName, childrenLName);
//				System.out.println("size of the children is   "+person.getChildren().size());
//				db.store(person);
//				System.out.println("size of the children is   "+(person.getChildren()).size());
//				children = emailQuery(email);
//				System.out.println("size of the children "+children.size());
//				if(children.size()>=1){
//					Person child = children.get(0);
//					System.out.println(" heello    hello   children is "+child.getChildren().size());
//				}
//				
			}
			else
			{
				eChildren = children.get(0);
				if(gender.equalsIgnoreCase("male"))
						eChildren.addFatherRequest(email);
					else
						eChildren.addMotherRequest(email);
				//eChildren.addChildRequest(person);
				person.addChild(childrenEmail,childrenLName, childrenFName);
				//db.store(eChildren);
				db.store(person);
				
			}
		}
		finally{
			db.close();
		}
	}
	
	public void addChildren(String email, String childrenFName, String  childrenLName,String childrenEmail, String gender ){
		
		try{
			remoteConnect();
			Person person, eChildren;
			List<Person> persons= emailQuery(email);
			System.out.println("email of the father is"+email);
			List<Person> children = emailQuery(childrenEmail);
			person = persons.get(0);
			String genders = person.getGender();
			if(children.size()== 0){
				
				Person child = new Person( childrenEmail,childrenLName, childrenFName,false);
				child.setGender(gender);
				if(genders.equalsIgnoreCase("male"))
					child.addFatherRequest(email);
					else
						child.addMotherRequest(email);
				db.store(child);
				person.addChild(childrenEmail,childrenLName, childrenFName);
				db.store(person);
				
//				System.out.println(childrenFName+"lala i m in get childs   "+ email);
//				person.addChild(childrenEmail,childrenFName, childrenLName);
//				System.out.println("size of the children is   "+person.getChildren().size());
//				db.store(person);
//				System.out.println("size of the children is   "+(person.getChildren()).size());
//				children = emailQuery(email);
//				System.out.println("size of the children "+children.size());
//				if(children.size()>=1){
//					Person child = children.get(0);
//					System.out.println(" heello    hello   children is "+child.getChildren().size());
//				}
//				
			}
			else
			{
				eChildren = children.get(0);
				if(gender.equalsIgnoreCase("male"))
					eChildren.addFatherRequest(email);
					else
						eChildren.addMotherRequest(email);
				person.addChild(childrenEmail,childrenLName, childrenFName);
				db.store(eChildren);
				db.store(person);
				
			}
		}
		finally{
			db.close();
		}
	}
	

	public void addBrother(String email, String brotherEmail, String brotherLName, String brotherFName){
		Person father=null, person=null, mother=null;
		try{
			remoteConnect();
			List<Person> persons= emailQuery(email);
			person = persons.get(0);
			 
			father = person.getFather();
		}
		finally{
			db.close();
		}
			if(father!=null){
				addChildren(father.getEmail(), brotherFName, brotherLName,brotherEmail,"male");
				
			}
			else if((mother=person.getMother())!=null)
			{
				addChildren(father.getEmail(), brotherFName, brotherLName,brotherEmail,"male");
			}
			
		
	}
	
	public void addSister(String email, String sisterEmail, String sisterLName, String sisterFName){
		
		Person father=null, person=null, mother=null;
		try{
			remoteConnect();
			List<Person> persons= emailQuery(email);
			person = persons.get(0);
			 
			father = person.getFather();
		}
		finally{
			db.close();
		}
			if(father!=null){
				addChildren(father.getEmail(),sisterFName, sisterLName,sisterEmail,"female");
			}
			else if((mother=person.getMother())!=null)
			{
				addChildren(father.getEmail(),sisterFName, sisterLName,sisterEmail,"female");
			}
			
}
	
	
	
	
	
	// to update
	public void updatePerson(String email,String newEmail, String lName, String fName , String dob, String address, String gender, String occupation, int contact ){
		try{
			remoteConnect();
			Person person;
			List<Person> persons= emailQuery(email);
			if(persons.size()==1){
				person = persons.get(0);
				person.setName(fName, lName);
				person.setAddress(address);
				person.setDob(dob);
				person.setOccupation(occupation);
				if(email.equals(newEmail)){
					List<Person> newpersons= emailQuery(email);
					if(newpersons.size()==0){
						person.setEmail(newEmail);
					}
					
				}
			}
		}
		finally{
			db.close();
		}
	}

	public String getName(String email){
		try{
			remoteConnect();
			Person person;
			List<Person> persons= emailQuery(email);
			if(persons.size()==1){
				person = persons.get(0);
				return person.getName();
			}
			return null;
		}
	finally{
		db.close();
	}
	}
	
	public void deleteRequest(String email, String personEmail, String type){
		try{
			remoteConnect();
			List<Person> persons = emailQuery(email);
			Person person = persons.get(0);
			List<Person> personsEmail = emailQuery(personEmail);
			Person family = personsEmail.get(0);
			if(type.equals("mother")){
				person.removeRequestMother();
				family.deleteChildren(person);
				
			}
			else if(type.equals("father")){
				person.removeRequestFather();
				family.deleteChildren(person);
				
			}
			else if(type.equals("child")){
				person.removeRequestChild(family);
				if(family.getGender().equalsIgnoreCase("male"))
					family.deleteFather();
				else
					family.deleteMother();
			}
			
			else if(type.equals("friend")){
				person.removeRequestFriend(family);
				family.deleteFriend(person);
			}
			
			else if(type.equals("spouse")){
				person.removeRequestSpouse();
				family.deleteSpouse();
				
			}
			db.store(family);
			db.store(person);
		}
		finally{
			db.close();
		}
	}
	
	public void acceptRequest(String email, String personEmail, String type){
	
		try{
			remoteConnect();
			List<Person> persons = emailQuery(email);
			Person person = persons.get(0);
			List<Person> personsEmail = emailQuery(personEmail);
			Person family = personsEmail.get(0);
			if(type.equals("mother")){
				person.addEMother(family);
				person.removeRequestMother();
				
			}
			else if(type.equals("father")){
				person.removeRequestFather();
				person.addEFather(family);
				
			}
			else if(type.equals("child")){
				System.out.println("hello i m removing children");
				person.removeRequestChild(family);
				person.addChild(personEmail, family.getFname(), family.getLname());
				if(person.getSpouse()!=null){
					Person spouse = person.getSpouse();
					spouse.addChild(personEmail, family.getFname(), family.getLname());
				}
			}
			
			else if(type.equals("friend")){
				person.removeRequestFriend(family);
				person.addFriend(personEmail, family.getFname(), family.getLname());
				//family.deleteFriend(person);
			}
			
			else if(type.equals("spouse")){
				int j;
				person.removeRequestSpouse();
				person.addESpouse(family);
				db.store(person);
				String[][] personChildren = person.getChildren();
				String[][] familyChildren = family.getChildren(); 
				int i,fsize,psize = personChildren.length;
				fsize = familyChildren.length;
				int f=1;
				if(personChildren[0][0]!=null){
					for(i=0;i<psize;i++){
						if(familyChildren[0][0]!=null){
							for(j=0;j<fsize;j++)
							{
								System.out.println("hello i m in acccepting request  1   "+ fsize+"  "+psize);
								
								 if(personChildren[i][0].equalsIgnoreCase(familyChildren[j][0])){
									
									f=0;
									break;
								}
								
							}
						}
						if(f==1)
							family.addChild(personChildren[i][0], personChildren[i][1], personChildren[i][2]);
					}
				}
				f=1;
				if(familyChildren[0][0]!=null){
					for(i=0;i<fsize;i++){
						if(personChildren[0][0]!=null){
							for(j=0;j<psize;j++)
							{
								System.out.println("hello i m in acccepting request  2   "+ fsize+"  "+psize);
								if(personChildren[j][0].equalsIgnoreCase(familyChildren[i][0])){
									f=0;
									break;
								}
							}
						}
						if(f==1)
							person.addChild(familyChildren[i][0], familyChildren[i][1], familyChildren[i][2]);
						
					}
				}
				
			}
			db.store(person);
			db.store(family);
		}
		finally{
			db.close();
		}		
	}
	
}

      