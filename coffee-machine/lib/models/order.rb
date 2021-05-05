class Order
  include VirtualModel

  virtual_belongs_to :drink, key: :drink_id, f_key: :drink_id
  virtual_belongs_to :user, key: :user_name, f_key: :name
end
