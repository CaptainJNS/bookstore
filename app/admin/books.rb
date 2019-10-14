ActiveAdmin.register Book do
  permit_params :title, :description, :dimensions, :materials,
                :quantity, :materials, :price, :year, :category_ids, :author_ids, images: []

  index do
    selectable_column

    column :title do |resource|
      link_to resource.title.to_s, resource_path(resource)
    end

    column :authors do |resource|
      resource.authors.each do |author|
        link_to author.decorate.full_name, resource_path(author)
      end
    end

    column :category do |resource|
      resource.categories.each do |category|
        link_to category.name, resource_path(category)
      end
    end

    column :price do |book|
      number_to_currency(book.price)
    end

    actions
  end

  show do
    h1 book.title

    panel :images do
      table do
        book.images.each do |image|
          span image_tag image.variant(resize: '100x100')
        end
      end
    end

    attributes_table do
      row :authors
      row :category
      row :year
      row :description
      row :materials
      row :dimensions
      row :price
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :category, as: :check_boxes, collection: Category.all
      f.input :authors, as: :check_boxes, collection: AuthorDecorator.decorate_collection(Author.all)
      f.input :description
      f.input :year
      f.input :price
      f.input :materials
      f.input :dimensions
      f.input :quantity
    end

    f.inputs do
      f.input :images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end
end
