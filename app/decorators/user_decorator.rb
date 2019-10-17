class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    super || email[Constants::EMAIL_TO_LOGIN].capitalize
  end

  def image
    object.image || Constants::NO_IMAGE_PATH
  end
end
