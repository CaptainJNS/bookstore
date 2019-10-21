class UpdateUser
  include Interactor

  def call
    context.current_user.update(context.permitted_params)
  rescue
    context.fail!
  end
end
