package model;

public class Product {
	private int id;
	private String name;
	private String image;
	private String description;
	private int price;
	private Category category;
	private int stock;
	
	public Product() {}
		
	public Product(String name, String image, String description, int price, Category category, int stock) {
		super();
		this.name = name;
		this.image = image;
		this.description = description;
		this.price = price;
		this.category = category;
		this.stock = stock;
	}

	public Product(int id, String name, String image, String description, int price, Category category, int stock) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.description = description;
		this.price = price;
		this.category = category;
		this.stock = stock;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
}
