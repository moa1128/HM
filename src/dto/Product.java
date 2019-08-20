package dto;

import java.io.Serializable;

public class Product implements Serializable {
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String productId;	//상품 아이디(바코드)
	private String pname;	//상품명
	private Integer unitPrice;	//상품 가격
	private String description;	//상품 설명
	private String manufacturer;	//제조사
	private String category;	//분류
	private long unitsInStock;	//재고 수
	private String filename;	//이미지 파일명
	private int quantity;	//장바구니에 담은 개수
	//잠만 생각해보니 이거슨 물건이 아니야 나중에 옮길 것@
	private String userPhoneNumber;	//사용자 핸드폰 번호
	private String userName;	//사용자 이름
	private String userPassword;	//사용자 비밀번호
	
	public Product() {
		super();
	}
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
	public String getProductId() {
		return productId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	//여기서 부터는 다른 곳에 옮겨야 함
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
}
