class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  has_many :reservations
  has_many :tables, through: :reservations
  enum role: { user: 'user', admin: 'admin' }, _default: :user
  validates :feedback, length: { maximum: 500 }, allow_nil: true
end
