package model;

public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String address;
	private int is_admin;
	private int phone;
	private String avatar;
	
	public User() {}
	
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public User(int id, String name, String email, String password, String address, int is_admin, String avatar) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.is_admin = is_admin;
		this.avatar = avatar;
	}

	public User(String name, String email, String address, String avatar) {
		this.name = name;
		this.email = email;
		this.address = address;
		this.avatar = avatar;
	}

	public User(String name, String email, String password, String address, String avatar) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.avatar = avatar;
	}

	public User(String name, String email, String password, String address, int is_admin, int phone, String avatar) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.is_admin = is_admin;
		this.phone = phone;
		this.avatar = avatar;
	}

	public User(int id, String name, String email, String password, String address, int is_admin, int phone,
			String avatar) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.is_admin = is_admin;
		this.phone = phone;
		this.avatar = avatar;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}
	
}
