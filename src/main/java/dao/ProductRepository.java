package dao;

import java.util.ArrayList;

import vo.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	//생성자
	private ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch 1334X750 Renia HD display 8-magapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setProductImage("P1234.png");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setProductImage("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab5", 6000000);
		tablet.setDescription("212.8*125.6*6.6cm, SuperAMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setProductImage("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	//상품 추가
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
	//목록 보기
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//상세 보기
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			String dbProductId = product.getProductId();
			if(dbProductId.equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
}