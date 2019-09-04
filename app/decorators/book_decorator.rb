class BookDecorator < Draper::Decorator
  delegate_all

  def authors_names
    authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def categories_names
    categories.map{ |category| category.name }.join(', ')
  end
end
