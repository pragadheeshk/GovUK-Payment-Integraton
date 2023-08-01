@IsTest
public class GovPaySaveResponseTest {
	static testMethod void testParse() {
		String json =
			'{' +
			'    \"amount\": 1000,' +
			'    \"description\": \"Payment for services\",' +
			'    \"reference\": \"ABC123\",' +
			'    \"language\": \"en\",' +
			'    \"metadata\": {' +
			'        \"type\": \"HMO\",' +
			'        \"paymentNumber\": \"Payment 1\"' +
			'    },' +
			'    \"state\": {' +
			'        \"status\": \"created\",' +
			'        \"finished\": false' +
			'    },' +
			'    \"payment_id\": \"3hqe4is3rke7lamgcbp1rs3e5c\",' +
			'    \"payment_provider\": \"sandbox\",' +
			'    \"created_date\": \"2023-07-05T06:57:24.058Z\",' +
			'    \"refund_summary\": {' +
			'        \"status\": \"pending\",' +
			'        \"amount_available\": 1000,' +
			'        \"amount_submitted\": 0' +
			'    },' +
			'    \"settlement_summary\": {},' +
			'    \"delayed_capture\": false,' +
			'    \"moto\": false,' +
			'    \"return_url\": \"https://example.com/payment/success\",' +
			'    \"authorisation_mode\": \"web\",' +
			'    \"_links\": {' +
			'        \"self\": {' +
			'            \"href\": \"https://publicapi.payments.service.gov.uk/v1/payments/3hqe4is3rke7lamgcbp1rs3e5c\",' +
			'            \"method\": \"GET\"' +
			'        },' +
			'        \"next_url\": {' +
			'            \"href\": \"https://card.payments.service.gov.uk/secure/39df440a-c9ce-4ed1-aa5d-bb70ac4f0b9f\",' +
			'            \"method\": \"GET\"' +
			'        },' +
			'        \"next_url_post\": {' +
			'            \"type\": \"application/x-www-form-urlencoded\",' +
			'            \"params\": {' +
			'                \"chargeTokenId\": \"39df440a-c9ce-4ed1-aa5d-bb70ac4f0b9f\"' +
			'            },' +
			'            \"href\": \"https://card.payments.service.gov.uk/secure\",' +
			'            \"method\": \"POST\"' +
			'        },' +
			'        \"events\": {' +
			'            \"href\": \"https://publicapi.payments.service.gov.uk/v1/payments/3hqe4is3rke7lamgcbp1rs3e5c/events\",' +
			'            \"method\": \"GET\"' +
			'        },' +
			'        \"refunds\": {' +
			'            \"href\": \"https://publicapi.payments.service.gov.uk/v1/payments/3hqe4is3rke7lamgcbp1rs3e5c/refunds\",' +
			'            \"method\": \"GET\"' +
			'        },' +
			'        \"cancel\": {' +
			'            \"href\": \"https://publicapi.payments.service.gov.uk/v1/payments/3hqe4is3rke7lamgcbp1rs3e5c/cancel\",' +
			'            \"method\": \"POST\"' +
			'        }' +
			'    }' +
			'}';
		GovPaySaveResponse r = GovPaySaveResponse.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.Next_url_post objNext_url_post = new GovPaySaveResponse.Next_url_post(
			System.JSON.createParser(json)
		);
		System.assert(objNext_url_post != null);
		System.assert(objNext_url_post.type == null);
		System.assert(objNext_url_post.params == null);
		System.assert(objNext_url_post.href == null);
		System.assert(objNext_url_post.method == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse objGovPaySaveResponse = new GovPaySaveResponse(System.JSON.createParser(json));
		System.assert(objGovPaySaveResponse != null);
		System.assert(objGovPaySaveResponse.amount == null);
		System.assert(objGovPaySaveResponse.description == null);
		System.assert(objGovPaySaveResponse.reference == null);
		System.assert(objGovPaySaveResponse.language == null);
		System.assert(objGovPaySaveResponse.metadata == null);
		System.assert(objGovPaySaveResponse.state == null);
		System.assert(objGovPaySaveResponse.payment_id == null);
		System.assert(objGovPaySaveResponse.payment_provider == null);
		System.assert(objGovPaySaveResponse.created_date == null);
		System.assert(objGovPaySaveResponse.refund_summary == null);
		System.assert(objGovPaySaveResponse.settlement_summary == null);
		System.assert(objGovPaySaveResponse.delayed_capture == null);
		System.assert(objGovPaySaveResponse.moto == null);
		System.assert(objGovPaySaveResponse.return_url == null);
		System.assert(objGovPaySaveResponse.authorisation_mode == null);
		System.assert(objGovPaySaveResponse.x_links == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.Refund_summary objRefund_summary = new GovPaySaveResponse.Refund_summary(
			System.JSON.createParser(json)
		);
		System.assert(objRefund_summary != null);
		System.assert(objRefund_summary.status == null);
		System.assert(objRefund_summary.amount_available == null);
		System.assert(objRefund_summary.amount_submitted == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.State objState = new GovPaySaveResponse.State(System.JSON.createParser(json));
		System.assert(objState != null);
		System.assert(objState.status == null);
		System.assert(objState.finished == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.Metadata objMetadata = new GovPaySaveResponse.Metadata(System.JSON.createParser(json));
		System.assert(objMetadata != null);
		System.assert(objMetadata.type == null);
		System.assert(objMetadata.paymentNumber == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.Params objParams = new GovPaySaveResponse.Params(System.JSON.createParser(json));
		System.assert(objParams != null);
		System.assert(objParams.chargeTokenId == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.Links objLinks = new GovPaySaveResponse.Links(System.JSON.createParser(json));
		System.assert(objLinks != null);
		System.assert(objLinks.self == null);
		System.assert(objLinks.next_url == null);
		System.assert(objLinks.next_url_post == null);
		System.assert(objLinks.events == null);
		System.assert(objLinks.refunds == null);
		System.assert(objLinks.cancel == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.Self objSelf = new GovPaySaveResponse.Self(System.JSON.createParser(json));
		System.assert(objSelf != null);
		System.assert(objSelf.href == null);
		System.assert(objSelf.method == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		GovPaySaveResponse.Settlement_summary objSettlement_summary = new GovPaySaveResponse.Settlement_summary(
			System.JSON.createParser(json)
		);
		System.assert(objSettlement_summary != null);
	}
}