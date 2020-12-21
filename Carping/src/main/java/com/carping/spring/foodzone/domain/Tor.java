package com.carping.spring.foodzone.domain;

public class Tor {
	  private String takeOutMenu;
	   private int torEa;
	   private int torPrice;
	   private String torRegDate;
	   private int torTotalPrice;
	   
	   public Tor() {}

	   public Tor(String takeOutMenu, int torEa, int torPrice, String torRegDate, int torTotalPrice) {
	      super();
	      this.takeOutMenu = takeOutMenu;
	      this.torEa = torEa;
	      this.torPrice = torPrice;
	      this.torRegDate = torRegDate;
	      this.torTotalPrice = torTotalPrice;
	   }

	   public String getTakeOutMenu() {
	      return takeOutMenu;
	   }

	   public void setTakeOutMenu(String takeOutMenu) {
	      this.takeOutMenu = takeOutMenu;
	   }

	   public int getTorEa() {
	      return torEa;
	   }

	   public void setTorEa(int torEa) {
	      this.torEa = torEa;
	   }

	   public int getTorPrice() {
	      return torPrice;
	   }

	   public void setTorPrice(int torPrice) {
	      this.torPrice = torPrice;
	   }

	   public String getTorRegDate() {
	      return torRegDate;
	   }

	   public void setTorRegDate(String torRegDate) {
	      this.torRegDate = torRegDate;
	   }

	   public int getTorTotalPrice() {
	      return torTotalPrice;
	   }

	   public void setTorTotalPrice(int torTotalPrice) {
	      this.torTotalPrice = torTotalPrice;
	   }

	   @Override
	   public String toString() {
	      return "Tor [takeOutMenu=" + takeOutMenu + ", torEa=" + torEa + ", torPrice=" + torPrice + ", torRegDate="
	            + torRegDate + ", torTotalPrice=" + torTotalPrice + "]";
	   }
	   

}
