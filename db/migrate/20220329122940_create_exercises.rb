class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.text :description
      t.integer :intensity

      t.timestamps
    end
  end
end
