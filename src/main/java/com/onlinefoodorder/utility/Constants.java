package com.onlinefoodorder.utility;

public class Constants {

	public enum DeliveryStatus {
		DELIVERED("Доставлено"),
		PENDING("Ожидается"),
		ON_THE_WAY("В пути");
		
		private String status;

	    private DeliveryStatus(String status) {
	      this.status = status;
	    }

	    public String value() {
	      return this.status;
	    }
	     
	}
	
}
