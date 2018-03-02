class CreateTurtles < ActiveRecord::Migration[5.1]
  def change
    create_table :turtles, id: :uuid do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
