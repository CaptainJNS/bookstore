require 'rails_helper'

describe UpdateUser do
  subject(:context) { described_class.call(permitted_params: permitted_params, current_user: current_user) }

  let(:permitted_params) {}
  let(:current_user) { create(:user) }

  describe ".call" do
    before do
      current_user.billing = Billing.create
      current_user.shipping = Shipping.create
    end

    context "when given valid credentials with billing" do
      let(:permitted_params) { { billing: attributes_for(:billing) } }

      it "succeeds" do
        expect(context).to be_a_success
      end
    end

    context "when given valid credentials with shipping" do
      let(:permitted_params) { { shipping: attributes_for(:shipping) } }

      it "succeeds" do
        expect(context).to be_a_success
      end
    end

    context "when given invalid credentials with billing" do
      let(:permitted_params) { { billing: Billing.create(attributes_for(:billing, phone: 'NaN')) } }

      it "fails" do
        expect(context).to be_a_failure
      end
    end

    context "when given invalid credentials with shipping" do
      let(:permitted_params) { { shipping: Shipping.create(attributes_for(:shipping, phone: 'NaN')) } }

      it "fails" do
        expect(context).to be_a_failure
      end
    end
  end
end
