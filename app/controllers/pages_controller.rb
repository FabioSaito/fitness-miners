class PagesController < ApplicationController
  def home
    @routines = Routine.includes(:exercises).all
  end
end
