ActiveAdmin.register Review do
  permit_params :body, :status

  scope :all
  scope(I18n.t('review.unprocessed'), default: true) { |scope| scope.where(status: I18n.t('review.unprocessed')) }
  scope(I18n.t('review.approved')) { |scope| scope.where(status: I18n.t('review.approved')) }
  scope(I18n.t('review.rejected')) { |scope| scope.where(status: I18n.t('review.rejected')) }

  action_item :reject, only: :show do
    link_to I18n.t('admin.reject'), reject_admin_review_path(review), method: :put
  end

  action_item :approve, only: :show do
    link_to I18n.t('admin.approve'), approve_admin_review_path(review), method: :put
  end

  member_action :reject, method: :put do
    review = Review.find(params[:id])
    review.update(status: I18n.t('review.rejected'))
    redirect_to admin_review_path(review)
  end

  member_action :approve, method: :put do
    review = Review.find(params[:id])
    review.update(status: I18n.t('review.approved'))
    redirect_to admin_review_path(review)
  end

  index do
    selectable_column

    column :status
    column :review do |resource|
      link_to I18n.t('book.review') + " \##{resource.id}", resource_path(resource)
    end
    column :book
    column :user do |resource|
      link_to resource.user.email, resource_path(resource.user)
    end
    column :created_at
  end
end
