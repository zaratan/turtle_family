class AddCreatorEmailToTurtles < ActiveRecord::Migration[5.1]
  def change
    add_column :turtles, :email, :string
  end
end
