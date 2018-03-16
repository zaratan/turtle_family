class TurtleSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :created_at, :email
end
