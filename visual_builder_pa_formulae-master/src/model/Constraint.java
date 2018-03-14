package model;

import javax.xml.bind.annotation.XmlRootElement;


/**
 * Constraint construct.
 *
 *@author Davide Di Gironimo
 *{@inheritDoc}
 */
@XmlRootElement
public class Constraint extends Container {
	
	public Constraint(Context parent, String Name) {
		super(parent, Name);
		this.type="constraint";
	}
	public Constraint(Context parent){
		super(parent);
	}
	public String toString(){
		String res="constraint "+name+"{\n";
		if(this.check!=null)
			res+=check.toString();
		if(this.message!=null)
			res+=message.toString();
		for(Fix f : this.getFixList()){
			res+=f.toString();
		}
		res +="\n\t}"; 
		return res;
	}
	

}
