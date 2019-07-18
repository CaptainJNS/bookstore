ActiveAdmin.register Book do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :description, :price, :quantity, :size, :year, material_ids: [], author_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :authors
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      # f.input :category, as: :radio
      f.input :authors, as: :check_boxes
      f.input :description
      f.input :year
      f.input :price
      f.input :materials, as: :check_boxes
      f.input :size
      f.input :quantity
    end
    f.actions
  end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
