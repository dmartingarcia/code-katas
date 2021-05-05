class Payment
  include VirtualModel

  virtual_attributes :amount
  virtual_belongs_to :user, key: :user_name, f_key: :name
end
