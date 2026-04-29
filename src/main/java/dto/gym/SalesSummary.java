package dto.gym;

public class SalesSummary {
	private int totalSales;
    private int gymSales;
    private int ptSales;
    private int totalFee;
    private int netSales;
    private double growthRate;
	public SalesSummary() {
		super();
	}
	public SalesSummary(int totalSales, int gymSales, int ptSales, int totalFee, int netSales, double growthRate) {
		super();
		this.totalSales = totalSales;
		this.gymSales = gymSales;
		this.ptSales = ptSales;
		this.totalFee = totalFee;
		this.netSales = netSales;
	}
	public int getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}
	public int getGymSales() {
		return gymSales;
	}
	public void setGymSales(int gymSales) {
		this.gymSales = gymSales;
	}
	public int getPtSales() {
		return ptSales;
	}
	public void setPtSales(int ptSales) {
		this.ptSales = ptSales;
	}
	public int getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(int totalFee) {
		this.totalFee = totalFee;
	}
	public int getNetSales() {
		return netSales;
	}
	public void setNetSales(int netSales) {
		this.netSales = netSales;
	}
	public double getGrowthRate() {
		return growthRate;
	}
	public void setGrowthRate(double growthRate) {
		this.growthRate = growthRate;
	}
	
	
    
}
