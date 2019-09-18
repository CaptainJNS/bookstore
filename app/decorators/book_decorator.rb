class BookDecorator < Draper::Decorator
  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all

  def authors_names
    authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def categories_names
    categories.map(&:name).join(', ')
  end

  def cover
    images.first
  end
end
