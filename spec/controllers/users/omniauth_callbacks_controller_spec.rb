require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  describe "#facebook" do
    let(:current_user) { create(:user) }

    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({provider: :facebook, uid: '12345', credentials: {token: Rails.application.credentials.dig(:facebook, :app_id), secret: Rails.application.credentials.dig(:facebook, :app_secret)}})
      request.env["devise.mapping"] = Devise.mappings[:user]

      # @controller.stub(:env).and_return({"omniauth.auth" => OmniAuth.config.mock_auth[:facebook]})
      User.stub(:from_omniauth).and_return(current_user)
    end

    describe "#facebook" do
      context "with a new facebook user" do
        before { get :facebook }

        it "authenticate user" do
          expect(warden.authenticated?(:user)).to be_truthy
        end

        it "set current_user" do
          expect(subject.current_user).not_to be_nil
        end

        it "redirect to root_path" do
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end
