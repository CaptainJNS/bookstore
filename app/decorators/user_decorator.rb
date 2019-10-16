class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    super || email[/[^@]+/].capitalize
  end

  def image
    super || Constants::NO_IMAGE_PATH
  end
end
