@isTest
public class PaymentInvocableTest {
	@isTest
	public static void testPaymentCallout() {
		// Create test data
		PaymentInvocable.InputVariables input = new PaymentInvocable.InputVariables();
		Case testCase = new Case();
		//testCase.RecordType.Name = 'test';
		// testCase.Total_Price__c = 60;
		insert testCase;
		//List<Case> ids = [SELECT Id FROM Case LIMIT 1];
		input.caseIds = testCase.Id;
		List<PaymentInvocable.InputVariables> inputList = new List<PaymentInvocable.InputVariables>();
		inputList.add(input);

		HttpResponse mockResponse = new HttpResponse();
		mockResponse.setStatusCode(204);
		mockResponse.setBody('{"access_token": "mockBearerToken"}');

		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(mockResponse));
		Test.startTest();
		PaymentInvocable.PaymentCallout(inputList);
		Test.stopTest();
	}
	private class MockHttpResponseGenerator implements HttpCalloutMock {
		private HttpResponse response;

		MockHttpResponseGenerator(HttpResponse response) {
			this.response = response;
		}

		public HttpResponse respond(HttpRequest request) {
			return response;
		}
	}
}