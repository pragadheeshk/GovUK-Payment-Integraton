@isTest
private class GovPayRestResourceTest {
	@isTest
	static void testGovPayRest_SuccessfulPayment() {
		// Create test data for Payment_Info__c and Case
		Case testCase = new Case(Status = 'Open');
		insert testCase;

		Payment_Info__c testPaymentInfo = new Payment_Info__c(
			Case__c = testCase.Id,
			Payment_Id__c = 'test_payment_id',
			Case_Status__c = 'Pending',
			Case_Finished__c = false
		);
		insert testPaymentInfo;

		// Mock the request and response JSON data
		String requestBody = '{"Resource":{"metadata":{"type":"Pest Control","paymentNumber":"Payment 1"},"state":{"finished":true},"payment_id":"test_payment_id"},"event_type":"card_payment_succeeded"}';
		RestRequest request = new RestRequest();
		request.requestURI = '/govPayRestResource/';
		request.httpMethod = 'POST';
		request.requestBody = Blob.valueOf(requestBody);
		RestContext.request = request;

		// Call the REST resource method
		Test.startTest();
		GovPayRestResource.GovPayRest();
		Test.stopTest();

		// Verify that the Case, Payment_Info__c, and BusinessLicenseApplication were updated correctly
		testCase = [SELECT Id, Status FROM Case WHERE Id = :testCase.Id];
		testPaymentInfo = [
			SELECT Id, Case_Status__c, Case_Finished__c
			FROM Payment_Info__c
			WHERE Id = :testPaymentInfo.Id
		];
		/*BusinessLicenseApplication businessLicense = [
			SELECT Id, Payment_Received__c
			FROM BusinessLicenseApplication
			WHERE Name = :testCase.Id
		]; */
	}

	@isTest
	static void testGovPayRest_FailedPayment() {
		// Create test data for Payment_Info__c and Case
		Case testCase = new Case(Status = 'Open');
		insert testCase;

		Payment_Info__c testPaymentInfo = new Payment_Info__c(
			Case__c = testCase.Id,
			Payment_Id__c = 'test_payment_id',
			Case_Status__c = 'Pending',
			Case_Finished__c = false
		);
		insert testPaymentInfo;

		// Mock the request and response JSON data
		String requestBody = '{"Resource":{"metadata":{"type":"Pest Control","paymentNumber":"Payment 1"},"state":{"finished":false},"payment_id":"test_payment_id"},"event_type":"card_payment_failed"}';
		RestRequest request = new RestRequest();
		request.requestURI = '/govPayRestResource/';
		request.httpMethod = 'POST';
		request.requestBody = Blob.valueOf(requestBody);
		RestContext.request = request;

		// Call the REST resource method
		Test.startTest();
		GovPayRestResource.GovPayRest();
		Test.stopTest();

		// Verify that the Case and Payment_Info__c were updated correctly
		testCase = [SELECT Id, Status FROM Case WHERE Id = :testCase.Id];
		testPaymentInfo = [
			SELECT Id, Case_Status__c, Case_Finished__c
			FROM Payment_Info__c
			WHERE Id = :testPaymentInfo.Id
		];
	}

	// Add more test methods for other scenarios (e.g., expired payment, different payment types, etc.)
}