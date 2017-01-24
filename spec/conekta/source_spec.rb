require 'spec_helper'

describe Conekta::PaymentSource do
  include_context "API 1.1.0"
  include_context "customer"

  let(:customer) { Conekta::Customer.create(customer_data) }
  let(:payment_source)   { customer.payment_sources.first }

  context "deleting payment_sources" do
    it "successful source delete" do
      payment_source.delete

      expect(payment_source.deleted).to eq(true)
    end
  end

  context "updating payment_sources" do
    it "successful payment_source update" do
      payment_source.update(exp_month: 12)

      expect(payment_source.exp_month).to eq("12")
    end

    it "unsuccessful payment_source update" do
      expect {
        payment_source.update(token_id: "tok_test_visa_4241")
      }.to raise_error(Conekta::ErrorList)
    end
  end
end
