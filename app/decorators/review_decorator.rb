class ReviewDecorator < ApplicationDecorator
  delegate_all

  decorates_association :user

  def to_string
    I18n.t('book.review') + " \##{id}"
  end

  def author
    user.name
  end

  def date
    created_at.strftime('%d.%m.%Y')
  end

  def image
    user.image
  end
end
