class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  has_many :books, foreign_key: :author_id
  has_many :reviews
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :create_stripe_customer

  def create_stripe_customer
    begin
      customer = Stripe::Customer.create({
        email: email,
        name: name,
      })

      update(stripe_customer_id: customer.id)
    end
  end


  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "unconfirmed_email", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["books", "roles"]
  end
end
