class ReviewDecorator < ApplicationDecorator
  delegate_all

  def to_string
    I18n.t('book.review') + " \##{id}"
  end

  def author
    user.decorate.name
  end

  def date
    created_at.strftime('%d.%m.%Y')
  end

  def image
    user.decorate.image
  end
end
