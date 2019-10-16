class User < ApplicationRecord
  has_one :billing, dependent: :destroy
  has_one :shipping, dependent: :destroy

  accepts_nested_attributes_for :billing
  accepts_nested_attributes_for :shipping

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
      user.provider = auth.provider
      user.uid = auth.uid
      user.skip_confirmation!
    end
  end

  def billing
    super || create_billing
  end

  def shipping
    super || create_shipping
  end
end
