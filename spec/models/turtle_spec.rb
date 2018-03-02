require 'rails_helper'

RSpec.describe Turtle, type: :model do
  it 'is creatable' do
    turtle = create(:turtle)
    first_turtle = Turtle.first
    expect(first_turtle.name).to eq(turtle.name)
    expect(first_turtle.color).to eq(turtle.color)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:color) }
end
