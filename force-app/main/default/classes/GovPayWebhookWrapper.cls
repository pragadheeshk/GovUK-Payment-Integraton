public class GovPayWebhookWrapper {
	public String webhook_message_id;
	public String created_date;
	public String resource_id;
	public Integer api_version;
	public String resource_type;
	public String event_type;
	public Resource resource;

	public class Refund_summary {
		public String status;
		public Integer amount_available;
		public Integer amount_submitted;
	}

	public class State {
		public String status;
		public Boolean finished;
	}

	public class Metadata {
		public String type;
		public String paymentNumber;
	}

	public class Resource {
		public Boolean moto;
		public String email;
		public State state;
		public Integer amount;
		public String language;
		public Metadata metadata;
		public String reference;
		public String payment_id;
		public String return_url;
		public String description;
		public Card_details card_details;
		public String created_date;
		public Refund_summary refund_summary;
		public Boolean delayed_capture;
		public String payment_provider;
		public Settlement_summary settlement_summary;
	}

	public class Billing_address {
		public String city;
		public String line1;
		public String line2;
		public String country;
		public String postcode;
	}

	public class Card_details {
		public String card_type;
		public String card_brand;
		public String expiry_date;
		public Billing_address billing_address;
		public String cardholder_name;
		public String last_digits_card_number;
		public String first_digits_card_number;
	}

	public class Settlement_summary {
	}

	public static GovPayWebhookWrapper parse(String json) {
		return (GovPayWebhookWrapper) System.JSON.deserialize(json, GovPayWebhookWrapper.class);
	}
}