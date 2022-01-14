class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  
  has_secure_password
  def items
    return Item.where(user_id: self.id)
  end

end