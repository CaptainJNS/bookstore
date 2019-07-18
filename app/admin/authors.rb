ActiveAdmin.register Author do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :surname, book_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :books
    actions
  end

# form do |f|
#   f.inputs 'BIO' do
#    f.input :name
#    f.input :surname
#   end

#   f.inputs 'Books' do
#     f.has_many :books do |b|
#       b.input :title
#     end
#   end

#   f.actions
# end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
