require 'rails_helper'

RSpec.describe TurtlesController, type: :controller do
  describe "#create" do
    let(:name) { Faker::StarWars.character }
    let(:color) { "rouge" }

    subject do
      post :create, params: { name: name, color: color }
    end

    it "creates the turtle" do
      expect{ subject }.to change(Turtle, :count).by(1)
      expect(json_response[:turtle][:name]).to eq(name)
      expect(json_response[:turtle][:color]).to eq(color)
      first_turtle = Turtle.first
      expect(first_turtle.name).to eq(name)
      expect(first_turtle.color).to eq(color)
    end

    context "with no name" do
      let(:name) { nil }
      it "fails" do
        expect{ subject }.not_to(change(Turtle, :count))
        expect(response).to be_forbidden
      end
    end
  end

  describe "#index" do
    let!(:turtles) { create_list(:turtle, 5) }

    subject do
      get :index
    end

    it "returns all the turtles" do
      subject
      expect(json_response[:turtles].size).to eq(5)
    end
  end

  describe "#show" do
    let(:turtle) { create(:turtle) }
    let(:id) { turtle.id }

    subject do
      get :show, params: { id: id }
    end

    it "returns the turtle" do
      subject
      expect(json_response[:turtle][:name]).to eq(turtle.name)
      expect(json_response[:turtle][:id]).to eq(turtle.id)
      expect(json_response[:turtle][:color]).to eq(turtle.color)
    end

    context "the turtle does not exist" do
      let(:id) { "123" }

      it "returns not found" do
        subject
        expect(response).to be_not_found
      end
    end
  end

  describe "#update" do
    let!(:turtle) { create(:turtle) }
    let(:id) { turtle.id }
    let(:name) { Faker::StarWars.character }

    subject do
      patch :update, params: { id: id, name: name }
    end

    it "updates the turtle" do
      expect{ subject }.to change{ turtle.reload.name }.to(name)
      expect(json_response[:turtle][:name]).to eq(name)
    end
  end

  describe "#destroy" do
    let!(:turtle) { create(:turtle) }
    let(:id) { turtle.id }

    subject do
      delete :destroy, params: { id: id }
    end

    it "destroys the turtle" do
      expect{ subject }.to change(Turtle, :count).from(1).to(0)
    end

    it "returns no_content" do
      subject
      expect(response).to be_no_content
    end

    context "the turtle does not exist" do
      let(:id) { "123" }

      it "returns not found" do
        expect{ subject }.not_to(change(Turtle, :count))
        expect(response).to be_not_found
      end
    end
  end
end
