class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table

  validates :date_time, presence: true

  def add_feedback(feedback_text)
    self.user.update(feedback: feedback_text)
  end
end
