class Drink
  include VirtualModel

  virtual_attributes :drink_id, :drink_name, :price, :size
  virtual_has_many :order, key: :drink_id, f_key: :drink_id
end
