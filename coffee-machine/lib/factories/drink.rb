module Factories
  module Drink
    def self.build_from_json(json)
      JSON.parse(json).map do |json_element|
        json_element["prices"].map do |size, price|
          ::Drink.new.tap do |object|
            object.drink_id = [json_element["drink_name"], size].join("-")
            object.drink_name = json_element["drink_name"]
            object.price = price
            object.size = size
          end
        end
      end.flatten
    rescue => e
      raise(RuntimeError, "Invalid json content" + e.message)
    end
  end
end
