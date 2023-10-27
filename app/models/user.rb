class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  has_many :books, foreign_key: :author_id
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
