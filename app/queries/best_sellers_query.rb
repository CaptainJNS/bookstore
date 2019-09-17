class BestSellersQuery
  def self.call
    new.call
  end

  def call
    # It's only a plug. The real logic of this method will be realized later
    Book.first(4)
  end
end
