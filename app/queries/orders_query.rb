class OrdersQuery
  def initialize(**params)
    @params = params
  end

  def self.call(**params)
    new(**params).call
  end

  def call
    Order
      .yield_self(&method(:filter))
  end

  private

  def filter(relation)
    relation.where(user: @params[:user], status: status_params)
  end

  def status_params
    Constants::STATUSES_TO_SHOW.include?(@params[:status]) ? @params[:status] : Constants::STATUSES_TO_SHOW
  end
end
