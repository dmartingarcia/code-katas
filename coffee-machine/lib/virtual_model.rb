module VirtualModel
  class << self
    def included(base_class)
      base_class.extend ClassMethods
    end
  end

  module ClassMethods
    def initialize(*args)
      return unless args.length == 1 && hash.first.kind_of?(Hash)

      hash.first.each do |attribute, value|
        send("@#{attribute}=",value)
      end
    end

    def virtual_attributes(*attr)
      @virtual_attrs = attr

      self.attr_accessor(*attr)
    end

    def virtual_has_many(model_name, key: nil, f_key: nil)
      raise("Invalid or missing key") unless key
      raise("Invalid or missing f_key") unless f_key

      camelized_model_name = camelize(model_name)

      define_method(pluralize(model_name)) do
        fk_value = instance_variable_get("@#{key}")
        Object.const_get(camelized_model_name).where(f_key => fk_value)
      end
    end

    def virtual_belongs_to(model_name, key: nil, f_key: nil)
      raise("Invalid or missing key") unless key
      raise("Invalid or missing f_key") unless f_key

      attr_accessor key

      camelized_model_name = camelize(model_name)

      define_method(model_name) do
        fk_value = instance_variable_get("@#{key}")
        Object.const_get(camelized_model_name).where(f_key => fk_value).first
      end
    end

    def objects=(objects)
      class_variable_set("@@objects", objects)
    end

    def all
      class_variable_get("@@objects")
    end

    def where(query)
      class_variable_get("@@objects").reject do |object|
        query.map do |key, value|
          object.send(key) == value
        end.include?(false)
      end
    rescue
      []
    end

    private

    def pluralize(string)
      string.to_s + "s"
    end

    def camelize(string)
      string.to_s.split('_').map do |e|
        e.to_s.capitalize
      end.join
    end
  end
end
