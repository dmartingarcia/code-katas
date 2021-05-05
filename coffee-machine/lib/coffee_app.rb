require 'json'

require_relative "virtual_model"
require_relative 'models/order'
require_relative 'models/payment'
require_relative 'models/drink'
require_relative 'models/user'

require_relative 'calculator/payments_amount'
require_relative 'calculator/orders_amount'
require_relative 'calculator/balance_amount'

require 'factories/drink'
require 'factories/order'
require 'factories/user'
require 'factories/payment'

class CoffeeApp
  class << self

    def accounting(prices_json, orders_json, payments_json)
      set_data(prices_json, orders_json, payments_json)

      result = User.all.map do |user|
        Calculator::BalanceAmount.new(user).balance
      end

      result.to_json
    end
  
  private
  
    def set_data(drinks_json, orders_json, payments_json)
      Drink.objects = Factories::Drink.build_from_json(drinks_json)
      Order.objects = Factories::Order.build_from_json(orders_json)
      User.objects = Factories::User.build_from_json(orders_json)
      Payment.objects = Factories::Payment.build_from_json(payments_json)
    end
  end
end
