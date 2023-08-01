public class PaymentInvocable {
	public class InputVariables {
		@InvocableVariable
		public String caseIds;
	}

	@InvocableMethod
	public static void PaymentCallout(List<InputVariables> input) {
		String paymentcase = input.get(0).caseIds;
		system.debug('Caseid' + paymentcase);
		GovPayIntegrationUtil.createPayment(paymentcase);
	}
}