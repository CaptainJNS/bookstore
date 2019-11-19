class ApplicationController < ActionController::Base
  def current_user
    super&.decorate
  end
end
