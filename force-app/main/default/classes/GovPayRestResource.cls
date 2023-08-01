@RestResource(urlMapping='/govPayRestResource/*')
global without sharing class GovPayRestResource {
	@HttpPost
	global static void GovPayRest() {
		try {
			RestRequest request = RestContext.request;
			GovPayWebhookWrapper responseObj = GovPayWebhookWrapper.parse(request.requestBody.toString());
	
			String paymentStatus = responseObj.event_type;
			Boolean paymentFinished = responseObj.Resource.state.finished;
			String paymentId = responseObj.Resource.payment_id;
			String paymentNumber = responseObj.Resource.metadata.paymentNumber;

				Payment_Info__c paymentInformation = [
					SELECT Name, Case_Status__c, Payment_Id__c, Case_Finished__c, Case__c
					FROM Payment_Info__c
					WHERE Payment_Id__c = :paymentId
				];


				if (paymentStatus == 'card_payment_succeeded' && paymentFinished == true) {
					paymentInformation.Case_Status__c = 'Success';
					paymentInformation.Case_Finished__c = true;
				} 
				else {
					if (paymentStatus == 'card_payment_failed') {
						paymentInformation.Case_Status__c = 'Failed';
					} else if (paymentStatus == 'card_payment_expired') {
						paymentInformation.Case_Status__c = 'Expired';
					}

					paymentInformation.Case_Finished__c = true;
				}
				update paymentInformation;

			
		} catch (Exception e) {
			System.debug('Error creating record: ' + e.getMessage());
		}
	}

}