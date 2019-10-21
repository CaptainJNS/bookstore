class UpdateUser
  include Interactor

  def call
    user = context.current_user.update(context.permitted_params)

    context.fail!(errors: user.errors) unless user
  end
end
