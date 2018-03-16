class TurtleMailer < ApplicationMailer
  def create(turtle)
    @turtle_name = turtle.name

    mail to: turtle.email
  end
end
