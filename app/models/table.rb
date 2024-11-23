class Table < ApplicationRecord
  validates :identifier, presence: false
  validates :capacity, presence: true
  validates :description, presence: true

  enum status: { reservada: 'reservada', disponivel: 'disponivel' }, _default: :reservada

  has_many :reservations
  has_many :users, through: :reservations
end
