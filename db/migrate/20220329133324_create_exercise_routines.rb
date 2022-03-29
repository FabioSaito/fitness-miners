class CreateExerciseRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_routines do |t|
      t.belongs_to :exercise
      t.belongs_to :routine

      t.timestamps
    end
  end
end
