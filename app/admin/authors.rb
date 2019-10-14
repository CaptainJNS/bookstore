ActiveAdmin.register Author do
<<<<<<< HEAD
  permit_params :first_name, :last_name

  decorate_with AuthorDecorator

  index do
    selectable_column

    column :full_name do |resource|
      link_to resource.full_name, resource_path(resource)
    end

    actions
  end
=======

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
>>>>>>> Created admin panel
end
