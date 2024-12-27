package car;

public class CarDTO {
	private int modelNum;
	private String modleName;
	private String price;
	private String maker;
	
	private int getModelNum() {
		return modelNum;
	}
	private void setModelNum(int modelNum) {
		this.modelNum = modelNum;
	}
	private String getModleName() {
		return modleName;
	}
	private void setModleName(String modleName) {
		this.modleName = modleName;
	}
	private String getPrice() {
		return price;
	}
	private void setPrice(String price) {
		this.price = price;
	}
	private String getMaker() {
		return maker;
	}
	private void setMaker(String maker) {
		this.maker = maker;
	}
	
}
