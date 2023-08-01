public class GovPaySaveResponse {
	public class Next_url_post {
		public String type { get; set; }
		public Params params { get; set; }
		public String href { get; set; }
		public String method { get; set; }

		public Next_url_post(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'type') {
							type = parser.getText();
						} else if (text == 'params') {
							params = new Params(parser);
						} else if (text == 'href') {
							href = parser.getText();
						} else if (text == 'method') {
							method = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Next_url_post consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public Decimal amount { get; set; }
	public String description { get; set; }
	public String reference { get; set; }
	public String language { get; set; }
	public Metadata metadata { get; set; }
	public State state { get; set; }
	public String payment_id { get; set; }
	public String payment_provider { get; set; }
	public String created_date { get; set; }
	public Refund_summary refund_summary { get; set; }
	public Settlement_summary settlement_summary { get; set; }
	public Boolean delayed_capture { get; set; }
	public Boolean moto { get; set; }
	public String return_url { get; set; }
	public String authorisation_mode { get; set; }
	public Links x_links { get; set; } // in json: _links

	public GovPaySaveResponse(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'amount') {
						amount = parser.getIntegerValue();
					} else if (text == 'description') {
						description = parser.getText();
					} else if (text == 'reference') {
						reference = parser.getText();
					} else if (text == 'language') {
						language = parser.getText();
					} else if (text == 'metadata') {
						metadata = new Metadata(parser);
					} else if (text == 'state') {
						state = new State(parser);
					} else if (text == 'payment_id') {
						payment_id = parser.getText();
					} else if (text == 'payment_provider') {
						payment_provider = parser.getText();
					} else if (text == 'created_date') {
						created_date = parser.getText();
					} else if (text == 'refund_summary') {
						refund_summary = new Refund_summary(parser);
					} else if (text == 'settlement_summary') {
						settlement_summary = new Settlement_summary(parser);
					} else if (text == 'delayed_capture') {
						delayed_capture = parser.getBooleanValue();
					} else if (text == 'moto') {
						moto = parser.getBooleanValue();
					} else if (text == 'return_url') {
						return_url = parser.getText();
					} else if (text == 'authorisation_mode') {
						authorisation_mode = parser.getText();
					} else if (text == '_links') {
						x_links = new Links(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: ' + text);
						consumeObject(parser);
					}
				}
			}
		}
	}

	public class Refund_summary {
		public String status { get; set; }
		public Integer amount_available { get; set; }
		public Integer amount_submitted { get; set; }

		public Refund_summary(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'status') {
							status = parser.getText();
						} else if (text == 'amount_available') {
							amount_available = parser.getIntegerValue();
						} else if (text == 'amount_submitted') {
							amount_submitted = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Refund_summary consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public class State {
		public String status { get; set; }
		public Boolean finished { get; set; }

		public State(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'status') {
							status = parser.getText();
						} else if (text == 'finished') {
							finished = parser.getBooleanValue();
						} else {
							System.debug(LoggingLevel.WARN, 'State consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public class Metadata {
		public String type { get; set; }
		public String paymentNumber { get; set; }

		public Metadata(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'type') {
							type = parser.getText();
						} else if (text == 'paymentNumber') {
							paymentNumber = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public class Params {
		public String chargeTokenId { get; set; }

		public Params(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'chargeTokenId') {
							chargeTokenId = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Params consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public class Links {
		public Self self { get; set; }
		public Self next_url { get; set; }
		public Next_url_post next_url_post { get; set; }
		public Self events { get; set; }
		public Self refunds { get; set; }
		public Self cancel { get; set; }

		public Links(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'self') {
							self = new Self(parser);
						} else if (text == 'next_url') {
							next_url = new Self(parser);
						} else if (text == 'next_url_post') {
							next_url_post = new Next_url_post(parser);
						} else if (text == 'events') {
							events = new Self(parser);
						} else if (text == 'refunds') {
							refunds = new Self(parser);
						} else if (text == 'cancel') {
							cancel = new Self(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Links consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public class Self {
		public String href { get; set; }
		public String method { get; set; }

		public Self(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'href') {
							href = parser.getText();
						} else if (text == 'method') {
							method = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Self consuming unrecognized property: ' + text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public class Settlement_summary {
		public Settlement_summary(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						{
							System.debug(
								LoggingLevel.WARN,
								'Settlement_summary consuming unrecognized property: ' + text
							);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public static GovPaySaveResponse parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new GovPaySaveResponse(parser);
	}

	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT || curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
}