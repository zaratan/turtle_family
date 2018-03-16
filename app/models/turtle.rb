class Turtle < ApplicationRecord
  after_create :send_email_to_creator, if: -> { email }

  validates :name, presence: true
  validates :color, presence: true

  def send_email_to_creator
    TurtleMailer.create(self).deliver_later
  end
end
