require 'rails_helper'

RSpec.describe 'Admin Categories' do
  before do
    create(:category)

    admin_user = create(:admin_user)
    login_as(admin_user, scope: :admin_user)

    visit admin_categories_path
  end

  let(:category_attributes) { attributes_for(:category) }

  it 'Admin can create a Category' do
    click_link('New Category')

    expect(page).to have_current_path(new_admin_category_path)

    fill_in 'category[name]', with: category_attributes[:name]

    expect { click_button('Create Category'); sleep(1) }.to change(Category, :count).by(1)
  end

  it 'Admin can view the Category' do
    click_link('View', match: :first)

    expect(page).to have_current_path(admin_category_path(Category.last))
  end

  it 'Admin can delete the Category' do
    expect { page.accept_confirm { click_link('Delete', match: :first) } }.to change(Category, :count).by(-1)
  end

  it 'Admin can edit the Category' do
    new_name = FFaker::Book.genre
    click_link('Edit', match: :first)

    expect(page).to have_current_path(edit_admin_category_path(Category.last))

    fill_in 'category[name]', with: new_name
    click_button('Update Category')
    sleep(1)
    expect(Category.last.name).to eq(new_name)
  end
end
