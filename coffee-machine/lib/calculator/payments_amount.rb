module Calculator
  class PaymentAmount

    attr_reader :user

    def initialize(user)
      @user = user
    end

    def amount
      user.payments.sum do |payment|
        payment.amount
      end
    end
  end
end
