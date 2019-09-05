class BestSellersQuery
  def self.call
    new.call
  end

  def call
    Book.all.sample(4)
  end
end
