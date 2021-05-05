module Factories
  module User
    def self.build_from_json(json)
      user_names = JSON.parse(json).map{|e| e["user"]}.uniq

      user_names.map do |user_name|
        ::User.new.tap do |object|
          object.name = user_name
        end
      end
    rescue => e
      raise(RuntimeError, "Invalid json content: " + e.message)
    end
  end
end
