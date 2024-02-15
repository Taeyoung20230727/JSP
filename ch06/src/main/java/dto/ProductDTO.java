package dto;

public class ProductDTO {
	
	private String ProdNo;
	private String ProdName;
	private String stock;
	private String price;
	private String company;
	
		
	public String getProdNo() {
		return ProdNo;
	}
	public void setProdNo(String prodNo) {
		ProdNo = prodNo;
	}
	public String getProdName() {
		return ProdName;
	}
	public void setProdName(String prodName) {
		ProdName = prodName;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	

	
}
