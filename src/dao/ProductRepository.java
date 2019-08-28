package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public ProductRepository() {
		//상품 만들거 여기다 넣기
		Product phone = new Product("P1234", "iPhone XS", 1500000);
		phone.setDescription("애플의 iOS 스마트폰 시리즈인 아이폰 시리즈의 2018년도형 모델");
		phone.setCategory("LIVING");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setFilename("P1234.PNG");	//이미지 파일 이름을 상품아이디로 해야함
		
		Product apple = new Product("P1235", "팜스 사과 3kg", 19800);
		apple.setDescription("아주 달달한 껍질 채 먹는 봉지 세척사과 3kg!");
		apple.setCategory("FOOD");
		apple.setManufacturer("팜스");
		apple.setUnitsInStock(50);
		apple.setFilename("P1235.PNG");
		
		Product rice = new Product("P1236", "임금님표 이천쌀 10kg", 47900);
		rice.setDescription("이천의 명물, 맛좋은 쌀");
		rice.setCategory("FOOD");
		rice.setManufacturer("이천농협");
		rice.setUnitsInStock(47);
		rice.setFilename("P1236.PNG");
		
		Product redGinseng = new Product("P1237", "[정관장] 홍삼정 240g", 172260);
		redGinseng.setDescription("당신의 면역력을 키워줄 100% 깊고 진한 프리미엄 정관장 홍삼정");
		redGinseng.setCategory("HEALTH");
		redGinseng.setManufacturer("정관장");
		redGinseng.setUnitsInStock(200);
		redGinseng.setFilename("P1237.PNG");
		
		Product sunCream = new Product("P1238", "[1+1]이니스프리 인텐시브 트리플케어 선크림 SPF50+", 13200);
		sunCream.setDescription("끈적임 없이 보송하게 발리고 워터프루프 기능이 있는 물에 강한 3중 기능성 무기자차 선크림");
		sunCream.setCategory("BEAUTY");
		sunCream.setManufacturer("이니스프리");
		sunCream.setUnitsInStock(37);
		sunCream.setFilename("P1238.PNG");
		
		Product backpack = new Product("P1239", "르꼬끄 백팩", 128000);
		backpack.setDescription("남녀공용 Twin VER2 에센셔 백팩 Q8323ABP71-BEI");
		backpack.setCategory("STYLE");
		backpack.setManufacturer("르꼬끄");
		backpack.setUnitsInStock(23);
		backpack.setFilename("P1239.PNG");
		
		//이런식으로 추가
		listOfProducts.add(phone);
		listOfProducts.add(apple);
		listOfProducts.add(rice);
		listOfProducts.add(redGinseng);
		listOfProducts.add(sunCream);
		listOfProducts.add(backpack);
	}
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listOfProducts.size(); i ++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	public static ProductRepository getInstance() {
		return instance;
	}
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	public void removeProduct(Product product) {
		/*
		 * for(int i = 0; i <listOfProducts.size(); i++) { Product pd =
		 * listOfProducts.get(i); if(pd != null && pd.getProductId() != null &&
		 * pd.getProductId().equals(product.getProductId())) {
		 * listOfProducts.remove(product); break; } }
		 */
		listOfProducts.remove(product);
	}
}
