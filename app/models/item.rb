class Item < ApplicationRecord
  has_one_attached :image
  validates :content, {presence: true, length: {maximum: 20}}
  # validates :image_name, {presence: true}
  validates :user_id, {presence: true}
  # validates :money, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end
