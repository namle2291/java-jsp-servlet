package model;


public class Order {
	private int id;
	private User user;
	private int total;
	private int method;
	private int phone;
	private String note;
	private String address;
	private OrderStatus status;
	
	public Order() {
		super();
	}

	public Order(int id, User user, int total, int method, String note, OrderStatus status) {
		super();
		this.id = id;
		this.user = user;
		this.total = total;
		this.method = method;
		this.note = note;
		this.status = status;
	}

	public Order(User user, int total, int method, String note, OrderStatus status) {
		super();
		this.user = user;
		this.total = total;
		this.method = method;
		this.note = note;
		this.status = status;
	}

	public Order(int id, int total, int method, String note, OrderStatus status) {
		super();
		this.id = id;
		this.total = total;
		this.method = method;
		this.note = note;
		this.status = status;
	}

	public Order(int total, int method, String note, OrderStatus status) {
		super();
		this.total = total;
		this.method = method;
		this.note = note;
		this.status = status;
	}
	
	public Order(User user, int total, int method, String note) {
		super();
		this.user = user;
		this.total = total;
		this.method = method;
		this.note = note;
	}

	public Order(User user, int total, int method, int phone, String note, String address) {
		super();
		this.user = user;
		this.total = total;
		this.method = method;
		this.phone = phone;
		this.note = note;
		this.address = address;
	}

	public Order(int id, User user, int total, int method, int phone, String note, String address, OrderStatus status) {
		super();
		this.id = id;
		this.user = user;
		this.total = total;
		this.method = method;
		this.phone = phone;
		this.note = note;
		this.address = address;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getMethod() {
		return method;
	}

	public void setMethod(int method) {
		this.method = method;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
