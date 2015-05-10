package model;


import java.util.ArrayList;
import java.util.Date;


/* class Personold {
	private String fname=null,lname=null, email=null, gender=null, address=null,password=null,occupation=null;
	private int contact=0;
	private Date dob=null,doDeath=null;
	private Person mother=null, father=null, spouse=null,requestMother,requestFather,requestSpouce;
	private ArrayList<Person> children=null, friend=null;
	private ArrayList<Person> requestChild, requestFriend;
	
	
	protected Person(String email){
		this.email=email;
	}
	
	void setName(String fname,String lname){
		this.fname = fname;
		this.lname=lname;
	}
	
	protected Person(String fname,String lname, String email, String address, int contact, Date dob){
		this.lname=lname;
		this.fname=fname;
		this.email=email;
		this.address=address;
		this.contact=contact;
		this.dob=dob;
	}
	
	protected void addFather(String father){
		this.father=new Person(father);
		this.gender="male";
		if(this.father.requestChild==null)
			this.father.requestChild=new ArrayList<Person>();
		this.father.requestChild.add(this);
		
	}
	protected void addMother(String mother){
		this.mother=new Person(mother);
		this.gender="female";
		if(this.mother.requestChild==null)
			this.mother.requestChild=new ArrayList<Person>();
		this.mother.requestChild.add(this);
		
	}
	protected void addchild(String child){
		Person chld =new Person(child);
		if(this.children!=null)
			this.children=new ArrayList<Person>();
		this.children.add(chld);
		if(this.gender=="male")
			chld.requestFather=this;
		else
			chld.requestMother=this;
	}
	protected void addFriend(String friend){
		Person frnd=new Person(friend);
		if(this.friend!=null)
			this.friend=new ArrayList<Person>();
		this.friend.add(frnd);
		frnd.requestFriend.add(this);
	}
	protected void addspouse(String spouse){
		this.spouse=new Person(spouse);
		this.spouse.spouse=this;
		this.spouse.requestSpouce=this;
	}
	
	protected void addDOB(Date date){
		this.dob=date;
	}
	protected void addDODeath(Date date){
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
	
	protected ArrayList<Person> getChild(){
		return children;
	}
	
	protected  ArrayList<Person> getFriend(){
		return friend;
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

	public void setDob(Date dob) {
		// TODO Auto-generated method stub
		this.dob=dob;
		
	}

	public void setOccupation(String occupation) {
		// TODO Auto-generated method stub
		this.occupation = occupation;
	}

	public void setPerson(Person person) {
		// TODO Auto-generated method stub
		this.email=person.email;
	}
}
*/