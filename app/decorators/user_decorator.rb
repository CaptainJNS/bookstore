class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    object.name || email[Constants::EMAIL_TO_LOGIN].capitalize
  end

  def image
    Constants::NO_IMAGE_PATH
  end
end
