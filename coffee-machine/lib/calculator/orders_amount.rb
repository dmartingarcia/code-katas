module Calculator
  class OrdersAmount

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def amount
      user.orders.sum do |order|
        order.drink.price
      end.round(2)
    end
  end
end
