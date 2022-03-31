class RoutinesController < ApplicationController
  before_action :authenticate_user!

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:name)
  end
end
