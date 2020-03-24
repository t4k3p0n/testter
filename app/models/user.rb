class User < ApplicationRecord
  has_secure_password
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  has_many :group_users
  has_many :groups, through: :group_users
  def posts
    return Post.where(user_id: self.id)
  end

end
