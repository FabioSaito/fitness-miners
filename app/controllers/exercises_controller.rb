class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:description, :intensity)
  end
end
