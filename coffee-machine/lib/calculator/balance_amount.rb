module Calculator
  class BalanceAmount

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def balance
      balance = orders_amount - payments_amount
      {user: user.name, order_total: orders_amount, payment_total: payments_amount, balance: balance.round(2)}
    end

    private

    def payments_amount
      @payments_amount ||= PaymentAmount.new(user).amount
    end

    def orders_amount
      @orders_amount ||= OrdersAmount.new(user).amount
    end
  end
end
