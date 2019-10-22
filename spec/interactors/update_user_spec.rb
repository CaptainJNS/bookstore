require 'rails_helper'

describe UpdateUser do
  subject(:context) { described_class.call(permitted_params: permitted_params, current_user: current_user) }

  let(:permitted_params) {}
  let(:current_user) { create(:user, :addresses) }

  describe ".call" do
    before do
      # current_user.billing = Billing.create
      # current_user.shipping = Shipping.create
    end

    context "when given valid credentials with billing" do
      let(:permitted_params) { { billing: attributes_for(:billing) } }

      it "changes user billing" do
        expect{ context }.to change{ current_user.billing.updated_at }
      end
    end

    context "when given valid credentials with shipping" do
      let(:permitted_params) { { shipping: attributes_for(:shipping) } }

      it "changes user shipping" do
        expect{ context }.to change{ current_user.shipping.updated_at }
      end
    end

    context "when given invalid credentials with billing" do
      let(:permitted_params) { { billing: attributes_for(:billing, phone: 'NaN') } }

      it "dont changes user billing" do
        expect{ context }.not_to change{ current_user.billing.updated_at }
      end
    end

    context "when given invalid credentials with shipping" do
      let(:permitted_params) { { shipping: attributes_for(:shipping, phone: 'NaN') } }

      it "dont changes user shipping" do
        expect{ context }.not_to change{ current_user.shipping.updated_at }
      end
    end
  end
end
