# Preview all emails at http://localhost:3000/rails/mailers/turtle
class TurtlePreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/turtle/create
  def create
    TurtleMailer.create
  end
end
