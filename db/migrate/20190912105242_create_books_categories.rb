class CreateBooksCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :books_categories, &:timestamps
  end
end
