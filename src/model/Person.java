package model;


import java.util.ArrayList;
import java.util.Date;


 public class Person {
	private String fname=null,lname=null, email=null, gender=null, address=null,password=null,occupation=null;
	private int contact=0,numOfChild;
	private String dob=null,doDeath=null;
	private Person mother=null, father=null, spouse=null;
	private String requestMother=null,requestFather=null,requestSpouse=null;// requestfather= request of a person who is your father;
	private String[][] children=null, friend=null;
	private String[] requestChild=null, requestFriend=null;
	private boolean create;
	private int numOfFriend,numOfRequestChild,numOfRequestFriend;
	
	protected Person(String email, boolean create){
		this.email=email;
		numOfFriend=0;
		numOfChild=0;
		friend= new String[1][3];
		children= new String[1][3];
	}
	
	protected Person(String email, String lname, String fname,boolean create){
		this.email= email;
		this.lname= lname;
		this.fname = fname;
		numOfFriend=0;
		numOfChild=0;
		friend = new String[1][3];
		children= new String[1][3];
	}
	void setName(String fname,String lname){
		this.fname = fname;
		this.lname=lname;
		
	}
	
	protected Person(String fname,String lname, String email, String address, int contact, String dob, boolean create){
		this.lname=lname;
		this.fname=fname;
		this.email=email;
		this.address=address;
		this.contact=contact;
		this.dob=dob;
	}
	
	protected void addFather(String father, String fname, String lname ){
		this.father=new Person(father,lname,fname,false);
		this.father.gender="Male";
		
		if(this.father.requestChild==null){
			this.father.requestChild=new String[1];
			this.father.numOfRequestChild=0;
		}
		if(this.father.requestChild.length <= this.father.numOfRequestChild)
		{
			int newSize ;
	        newSize = 1+this.father.numOfRequestChild;
	        String[] newData = new String[newSize];
	        System.arraycopy(this.father.requestChild, 0, newData, 0,this.father.requestChild.length);
	        this.father.requestChild = newData;
		}
		this.father.requestChild[this.father.numOfRequestChild]= this.email;
		this.father.numOfRequestChild++;
//		if(children.length<=numOfChild){
//		int newSize ;
//        newSize = 1+numOfChild;
//        String[][] newData = new String[newSize][3];
//        System.arraycopy(children, 0, newData, 0,children.length);
//        children = newData;
	}
	protected void addMother(String mother, String fname, String lname){
		this.mother=new Person(mother,lname,fname,false);
		this.gender="Female";
		if(this.mother.requestChild==null){
			this.mother.requestChild=new String[1];
			this.mother.numOfRequestChild=0;
		}
		if(this.mother.requestChild.length <= this.mother.numOfRequestChild)
		{
			int newSize ;
	        newSize = 1+this.mother.numOfRequestChild;
	        String[] newData = new String[newSize];
	        System.arraycopy(this.mother.requestChild, 0, newData, 0,this.mother.requestChild.length);
	        this.mother.requestChild = newData;
		}
		this.mother.requestChild[this.mother.numOfRequestChild]= this.email;
		this.mother.numOfRequestChild++;
		
	}
	protected void addChild(String child, String fName, String lName){
//		Person chld =newF Person(child,lName, fName,false);
		if(children.length<=numOfChild){
			int newSize ;
            newSize = 1+numOfChild;
            String[][] newData = new String[newSize][3];
            System.arraycopy(children, 0, newData, 0,children.length);
            children = newData;
            // System.out.println("Size of dynamic array increased to " + newSize);
        
		}
		this.children[numOfChild][0]=child;
		this.children[numOfChild][1] = fName;
		this.children[numOfChild][2] = lName;
		numOfChild++;
	}
	
	protected void addFriend(String friendEmail, String fName, String lName){

		
		if(friend.length<=numOfFriend){
				int newSize ;
                newSize = 1+numOfFriend;
	            String[][] newData = new String[newSize][3];
	            System.arraycopy(friend, 0, newData, 0,friend.length);
	            friend = newData;
            // System.out.println("Size of dynamic array increased to " + newSize);
        
		}
		this.friend[numOfFriend][0]= friendEmail;
		this.friend[numOfFriend][1] = fName;
		this.friend[numOfFriend][2] = lName;
		numOfFriend++;

	}
	
	

	protected void addDODeath(String date){
		this.doDeath=date;
	}
	
	protected void addContact(int contact){
		this.contact=contact;
	}
	
	protected void addEmail(String email){
		this.email=email;
	}
	
	protected void setAddress(String address){
		this.address=address;
	}

	protected void setGender(String gender){
		this.gender=gender;
	}
	
	protected  Person getFather(){
		return father; 
	}
	
	protected Person getMother(){
		return mother;
	}
	
	protected Person getSpouse(){
		return spouse;
	}
	
	protected String[][] getChildren(){
//		
//		
		//System.out.println(children.size()+" is the size of the children");
		return children;
	}
	
	protected  String[][] getFriend(){
//		
		return this.friend;
	}
	
	protected int getcontact(){
		return contact;
	}
	
	protected String getEmail(){
		return email;
	}
	
	protected String getGender(){
		return gender;
	}
	protected String getAddress(){
		return address;
	}
	
	@Override
	public String toString(){
		
		return this.email;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setPassword(String password){
		this.password=password;
	}

	public void setDob(String dob) {
		// TODO Auto-generated method stub
		this.dob=dob;
		
	}

	public void setOccupation(String occupation) {
		// TODO Auto-generated method stub
		this.occupation = occupation;
	}

	public void setEmail(Person person) {
		// TODO Auto-generated method stub
		this.email=person.email;
	}

	public String getName() {
		// TODO Auto-generated method stub
		return this.fname+" "+ this.lname;
	}
	
	public String getFatherRequest(){
		return requestFather;
	}
	
	public String getMotherRequest(){
		return	requestMother;
	}
	
	public String getSpouseRequest(){
		return requestSpouse;
	}
	
	public String[] getFriendRequest(){
		return requestFriend;
	}
	
	public String[] getChildrenRequest(){
		return requestChild;
	}
	
	public String getDOB(){
		return dob;
		
	}
	public String getDODeath(){
		return doDeath;
	}

	public String getOccupation() {
		// TODO Auto-generated method stub
		return occupation;
	}

	public boolean deleteFather() {
		// TODO Auto-generated method stub
		
		this.father=null;
		
		return true;
	}

	public void removeRequestChild(Person person) {
		// TODO Auto-generated method stub
		String email = person.getEmail();
		int size = numOfRequestChild;
		for(int i=0;i<size;i++){
			if(requestChild[i].equals(email)){
				numOfRequestChild--;
				requestChild[i] = requestChild[size-1];
				int newSize ;
				newSize = numOfRequestChild;
	            String[] newData = new String[newSize];
	            System.arraycopy(requestChild, 0, newData, 0,numOfRequestChild);
	            requestChild = newData;
	            break;
			}
		}
	}

	public boolean deleteMother() {
		// TODO Auto-generated method stub
		this.mother=null;
		return true;
	}

	public boolean deleteSpouse() {
		// TODO Auto-generated method stub
		spouse.requestSpouse=null;
		spouse=null;
		return true;
	}

	public void removeRequestFriend(Person person) {
		// TODO Auto-generated method stub
		String email = person.getEmail();
		int size = numOfRequestFriend;
		for(int i=0;i<size;i++){
			if(requestChild[i].equals(email)){
				numOfRequestFriend--;
				requestFriend[i] = requestFriend[size-1];
				int newSize ;
				newSize = numOfRequestFriend;
	            String[] newData = new String[newSize];
	            System.arraycopy(requestFriend, 0, newData, 0,numOfRequestFriend);
	            requestFriend = newData;
	            break;
			}
		}
	}

	public void deleteFriend(Person friends) {
		// TODO Auto-generated method stub
		String email = friends.getEmail();
		int size = friend.length;
		for(int i=0;i<size;i++){
			if(friend[i][0].equals(email)){
				numOfFriend--;
				friend[i][0] = friend[size-1][0];
				friend[i][1] = friend[size-1][1];
				friend[i][2] = friend[size-1][2];
				int newSize ;
				newSize = numOfFriend;
	            String[][] newData = new String[newSize][3];
	            System.arraycopy(friend, 0, newData, 0,numOfFriend);
	            friend = newData;
	            break;
			}
		}
	}

	public void removeRequestFather() {
		// TODO Auto-generated method stub
		requestFather= null;
	}

	public void deleteChildren(Person child) {
		// TODO Auto-generated method stub
		String email = child.getEmail();
		int size = children.length;
		for(int i=0;i<size;i++){
			if(children[i][0].equals(email)){
				numOfChild--;
				children[i][0] = children[size-1][0];
				children[i][1] = children[size-1][1];
				children[i][2] = children[size-1][2];
				int newSize ;
				newSize = numOfChild;
	            String[][] newData = new String[newSize][3];
	            System.arraycopy(children, 0, newData, 0,numOfFriend);
	            children = newData;
	            break;
			}
		}

	}

	public void removeRequestMother() {
		// TODO Auto-generated method stub
		requestMother= null;
	}

	public void addChildRequest(Person person) {
		// TODO Auto-generated method stub
		if(numOfRequestChild==0){
			requestChild=new String[1];
		}
		if(requestChild.length<=numOfRequestChild){
			int newSize ;
            newSize = 1+numOfRequestChild;
            String[] newData = new String[newSize];
            System.arraycopy(requestChild, 0, newData, 0,children.length);
            requestChild = newData;
            // System.out.println("Size of dynamic array increased to " + newSize);
        
		}
		this.requestChild[numOfRequestChild]=person.getEmail();
		
		numOfRequestChild++;
	}

	public void addEFather(Person eFather) {
		// TODO Auto-generated method stub
		this.father=eFather;
	}

	public void addEMother(Person eMother) {
		// TODO Auto-generated method stub
		this.mother = eMother;
	}

	public void addSpouse(String spouseEmail, String spouseFName,String spouseLName, String gender) {
		// TODO Auto-generated method stub
		this.spouse=new Person(spouseEmail,false);
		if(gender.equalsIgnoreCase("male"))
			this.spouse.gender="female";
		else
			this.spouse.gender="male";
		this.spouse.fname=spouseFName;
		this.spouse.lname = spouseLName;
		this.spouse.requestSpouse = this.email;
	}

	public void addSpouseRequest(Person person) {
		// TODO Auto-generated method stub
		
		this.requestSpouse = person.getEmail();
	}

	public void addESpouse(Person eSpouse) {
		// TODO Auto-generated method stub
		this.spouse=eSpouse;
	}

//	public void addEFriend(Person eFriend) {
//		// TODO Auto-generated method stub
//		if(friend==null){
//			friend= new ArrayList<Person>();
//		}
//		friend.add(eFriend);
//	}

//	public void addChild(Person eChildren) {
//		// TODO Auto-generated method stub
//		if(children == null){
//			children = new ArrayList<Person>();
//		}
//		children.add(eChildren);
//	}

	public void setEmail(String email) {
		// TODO Auto-generated method stub
		this.email = email;
	}

	public boolean getCreate() {
		// TODO Auto-generated method stub
		return create;
	}

	public void setCreate(boolean b) {
		// TODO Auto-generated method stub
		create=b;
	}

	public void removeRequestSpouse() {
		// TODO Auto-generated method stub
		this.requestSpouse=null;
	}

	public String getLname() {
		// TODO Auto-generated method stub
		return lname;
	}

	public String getFname() {
		// TODO Auto-generated method stub
		return fname;
	}

	public void addFatherRequest(String email2) {
		// TODO Auto-generated method stub
		this.requestFather=email2;
	}

	public void addFriendRequest(String email2) {
		// TODO Auto-generated method stub
		if(numOfRequestFriend==0){
			requestFriend=new String[1];
		}
		if(requestFriend.length<=numOfRequestFriend){
			int newSize ;
            newSize = 1+numOfRequestFriend;
            String[] newData = new String[newSize];
            System.arraycopy(requestFriend, 0, newData, 0,requestFriend.length);
            requestFriend = newData;
            // System.out.println("Size of dynamic array increased to " + newSize);
        
		}
		this.requestFriend[numOfRequestFriend]=email2;
		
		numOfRequestFriend++;
	}

	public void addMotherRequest(String email2) {
		// TODO Auto-generated method stub
		this.requestMother= email2;
	}
}
