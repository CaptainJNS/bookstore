require 'rails_helper'

RSpec.describe 'Register page', type: :feature, js: true do
  context 'when user unauthorized' do
    it 'wont let user to get access' do
      visit(settings_path)
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context 'when user authorized' do
    let(:password) { 'password' }
    let(:user) { create(:user, password: password) }
    let(:billing) { [] }
    let(:shipping) { [] }

    before do
      login_as(user)
      visit(settings_path)
    end

    context 'when billing address' do
      it 'updates users billing data' do
        attributes_for(:billing).except(:user).each do |key, value|
          fill_in "billing[#{key}]", with: value
        end
        find('#saveBilling').click
        expect(page).to have_content(I18n.t('settings.billing_updated'))
      end
    end

    context 'when shipping address' do
      it 'updates users shipping data' do
        attributes_for(:shipping).except(:user).each do |key, value|
          fill_in "shipping[#{key}]", with: value
        end
        find('#saveShipping').click
        expect(page).to have_content(I18n.t('settings.shipping_updated'))
      end
    end

    context 'when email change' do
      it 'changes users email' do
        click_link(I18n.t('settings.privacy'))
        fill_in 'email', with: FFaker::Internet.email
        find('#saveEmail').click
        expect(page).to have_content(I18n.t('devise.registrations.update_needs_confirmation'))
      end
    end

    context 'when password change' do
      it 'changes users password' do
        click_link(I18n.t('settings.privacy'))
        fill_in 'current_password', with: password
        fill_in 'password', with: 'newpassword'
        fill_in 'password_confirmation', with: 'newpassword'
        find('#savePassword').click
        expect(page).to have_content(I18n.t('devise.passwords.updated_not_active'))
      end
    end

    # context 'when users account destroy' do
    #   it 'destroys users account' do
    #     click_link(I18n.t('settings.privacy'))
    #     find('.checkbox-icon').click
    #     sleep(1)
    #     find('#delete').click
    #     expect(page).to have_content(I18n.t('devise.registrations.destroyed'))
    #   end
    # end
  end
end
