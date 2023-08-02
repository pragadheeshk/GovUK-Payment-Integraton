public class GovPayReq {
	public Decimal amount;
	public String authorisation_mode;
	public String description;
	public String language;
	public Boolean moto;
	public String reference;
	public String return_url;

	public static GovPayReq parse(String json) {
		return (GovPayReq) System.JSON.deserialize(json, GovPayReq.class);
	}
}