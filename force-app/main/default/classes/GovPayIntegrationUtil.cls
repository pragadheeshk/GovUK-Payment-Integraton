public with sharing class GovPayIntegrationUtil {
	public static void createPayment(String caseId) {
		Case selectedCase = [SELECT id,Total_Price__c FROM case WHERE Id = :caseId];
		Decimal selectedCasePrice = selectedCase.Total_Price__c.setscale(0);

		GovPayReq request = new GovPayReq();
		String uniqueCode = generateRandomString();
		Payment_Information__mdt paymentInformation = Payment_Information__mdt.getInstance('Createpayment');

		request.amount = selectedCasePrice * 100;
		request.reference = uniqueCode;
		request.language = paymentInformation.Language__c;
		request.moto = paymentInformation.Moto__c;
		request.authorisation_mode = paymentInformation.Authorization_Mode__c;
		request.return_url = paymentInformation.Return_URL__c;
		String requestBody = JSON.serialize(request);
		system.debug(requestBody);

		HttpRequest newPaymentRequest = new HttpRequest();
		newPaymentRequest.setEndpoint('callout:GOV_UK_pay/v1/payments');
		newPaymentRequest.setMethod('POST');
		newPaymentRequest.setHeader('Idempotency-Key', 'Sample12345');
		newPaymentRequest.setHeader('Content-Type', 'application/json');
		newPaymentRequest.setBody(requestBody);
		newPaymentRequest.setTimeout(60000);
		Http http = new Http();
		HTTPResponse response = http.send(newPaymentRequest);
		saveResponse(response.getBody(), caseId);
	}

	public static void saveResponse(String jsonResponse, String caseId) {
		GovPaySaveResponse responseObj = GovPaySaveResponse.parse(jsonResponse);
		createPaymentRecord(responseObj, caseId);
	}

	public static void createPaymentRecord(GovPaySaveResponse response, String caseId) {
		try {
			Payment_Info__c paymentInfo = new Payment_Info__c();
			paymentInfo.Case__c = caseId;
			paymentInfo.Amount__c = response.amount / 100;
			paymentInfo.Description__c = response.description;
			paymentInfo.Reference__c = response.reference;
			paymentInfo.Language__c = response.language;
			paymentInfo.Case_Status__c = response.state.status;
			paymentInfo.Case_Finished__c = response.state.finished;
			paymentInfo.Payment_Id__c = response.payment_id;
			paymentInfo.Payment_provider__c = response.payment_provider;
			paymentInfo.Refund_status__c = response.refund_summary.status;
			paymentInfo.Refund_amount_available__c = response.refund_summary.amount_available / 100;
			paymentInfo.Refund_amount_submitted__c = response.refund_summary.amount_submitted;
			paymentInfo.Delayed_capture__c = response.delayed_capture;
			paymentInfo.Moto__c = response.moto;
			paymentInfo.Return_URL__c = response.return_url;
			paymentInfo.Authorisation_mode__c = response.authorisation_mode;
			paymentInfo.Self_URL__c = response.x_links.self.href;
			paymentInfo.Self_method__c = response.x_links.self.method;
			paymentInfo.Next_URL__c = response.x_links.next_url.href;
			paymentInfo.Next_method__c = response.x_links.next_url.method;
			paymentInfo.Next_URL_post_type__c = response.x_links.next_url_post.type;
			paymentInfo.Next_URL_charge_token_Id__c = response.x_links.next_url_post.params.chargeTokenId;
			paymentInfo.Next_URL_post_URL__c = response.x_links.next_url_post.href;
			paymentInfo.Next_URL_post_method__c = response.x_links.next_url_post.method;
			paymentInfo.Events_URL__c = response.x_links.events.href;
			paymentInfo.Events_method__c = response.x_links.events.method;
			paymentInfo.Refund_URL__c = response.x_links.refunds.href;
			paymentInfo.Refund_method__c = response.x_links.refunds.method;
			paymentInfo.Cancel_URL__c = response.x_links.cancel.href;
			paymentInfo.Cancel_method__c = response.x_links.cancel.method;
			paymentInfo.Payment_Type__c = response.metadata.type;
			paymentInfo.Payment_Number__c = response.metadata.paymentNumber;

			insert paymentInfo;
		} catch (Exception e) {
			System.debug('Error creating record: ' + e.getMessage());
		}
	}

	public static String generateRandomString() {
		final String chars = 'xaxPmno2IDdEwLzbtEvhv6oG1RDT6xQJX3MvF4amaDQ9TUvHgJfdbodlllPTnnuw';
		String randStr = '';
		while (randStr.length() < 8) {
			Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
			randStr += chars.substring(idx, idx + 1);
		}
		DateTime now = DateTime.now();
		String dateTimeString = now.format('yyyyMMddHHmmss');
		randStr += dateTimeString;
		return randStr;
	}
}