package dto.gym;

public class SalesChart {
	private String label;  // 날짜 or 월
    private int sales;
    private int percent;
	public SalesChart() {
		super();
	}
	public SalesChart(String label, int sales, int percent) {
		super();
		this.label = label;
		this.sales = sales;
		this.percent = percent;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
    
}
