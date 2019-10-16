# frozen_string_literal: true

module Constants
  BOOKS_PER_PAGE = 8
  DESCRIPTION_LIMIT = 100
  LATEST_BOOK_COUNT = 3
  DEFAULT_BOOKS_ORDER = 'created_at DESC'
  BOOKS_COUNT = 50
  AUTHORS_COUNT = 5
  USERS_COUNT = 5
  MATERIALS = ['Glossy paper', 'Hardcover', 'Soft paper', 'Cardboard'].freeze
  CATEGORIES = ['Mobile development', 'Photo', 'Web design', 'Web development'].freeze
  DIMENSION = (1.0..10.0).freeze
  STARS_COUNT = 5
  NO_IMAGE_PATH = 'https://book-store-dmitriev.s3.eu-west-2.amazonaws.com/no_avatar.png'
end
