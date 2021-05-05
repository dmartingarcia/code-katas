module Factories
  module Order
    def self.build_from_json(json)
      JSON.parse(json).map do |json_element|
        ::Order.new.tap do |object|
          object.drink_id = [json_element["drink"], json_element["size"]].join("-")
          object.user_name = json_element["user"]
        end
      end
    rescue => e
      raise(RuntimeError, "Invalid json content: " + e.message)
    end
  end
end
