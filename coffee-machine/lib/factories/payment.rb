module Factories
  module Payment
    def self.build_from_json(json)
      JSON.parse(json).map do |json_element|
        ::Payment.new.tap do |object|
          object.amount = json_element["amount"]
          object.user_name = json_element["user"]
        end
      end
    rescue => e
      raise(RuntimeError, "Invalid json content" + e.message)
    end
  end
end
