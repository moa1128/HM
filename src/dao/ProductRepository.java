package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public ProductRepository() {
		//��ǰ ����� ����� �ֱ�
		Product phone = new Product("P1234", "iPhone XS", 1500000);
		phone.setDescription("������ iOS ����Ʈ�� �ø����� ������ �ø����� 2018�⵵�� ��");
		phone.setCategory("LIVING");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setFilename("P1234.PNG");	//�̹��� ���� �̸��� ��ǰ���̵�� �ؾ���
		
		Product apple = new Product("P1235", "�ʽ� ��� 3kg", 19800);
		apple.setDescription("���� �޴��� ���� ä �Դ� ���� ��ô��� 3kg!");
		apple.setCategory("FOOD");
		apple.setManufacturer("�ʽ�");
		apple.setUnitsInStock(50);
		apple.setFilename("P1235.PNG");
		
		Product rice = new Product("P1236", "�ӱݴ�ǥ ��õ�� 10kg", 47900);
		rice.setDescription("��õ�� ��, ������ ��");
		rice.setCategory("FOOD");
		rice.setManufacturer("��õ����");
		rice.setUnitsInStock(47);
		rice.setFilename("P1236.PNG");
		
		Product redGinseng = new Product("P1237", "[������] ȫ���� 240g", 172260);
		redGinseng.setDescription("����� �鿪���� Ű���� 100% ��� ���� �����̾� ������ ȫ����");
		redGinseng.setCategory("HEALTH");
		redGinseng.setManufacturer("������");
		redGinseng.setUnitsInStock(200);
		redGinseng.setFilename("P1237.PNG");
		
		Product sunCream = new Product("P1238", "[1+1]�̴Ͻ����� ���ٽú� Ʈ�����ɾ� ��ũ�� SPF50+", 13200);
		sunCream.setDescription("������ ���� �����ϰ� �߸��� ���������� ����� �ִ� ���� ���� 3�� ��ɼ� �������� ��ũ��");
		sunCream.setCategory("BEAUTY");
		sunCream.setManufacturer("�̴Ͻ�����");
		sunCream.setUnitsInStock(37);
		sunCream.setFilename("P1238.PNG");
		
		Product backpack = new Product("P1239", "������ ����", 128000);
		backpack.setDescription("������� Twin VER2 ������ ���� Q8323ABP71-BEI");
		backpack.setCategory("STYLE");
		backpack.setManufacturer("������");
		backpack.setUnitsInStock(23);
		backpack.setFilename("P1239.PNG");
		
		//�̷������� �߰�
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
