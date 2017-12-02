package model;


public class Do_operation {
	
	int id;
	String name, context, method;
	
	public Do_operation(){}
	
	public Do_operation(int id, String name, String context){
		this.id = id;
		this.name = name;
		this .context = context;
	}
	
	public Do_operation(int id, String name, String context, String body){
		this.id = id;
		this.name = name;
		this .context = context;
		this.method = body;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public int getId() {
		return id;
	}

}