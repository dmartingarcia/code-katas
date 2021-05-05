class User
  include VirtualModel

  virtual_attributes :name
  virtual_has_many :order, key: :name, f_key: :user_name
  virtual_has_many :payment, key: :name, f_key: :user_name
end
