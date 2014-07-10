class WeeksController < ApplicationController
  def show
    week = (params[:id]).to_i
    bs_1rm = params[:bs_1rm].to_f 
    fs_1rm = params[:fs_1rm].to_f 
    
    workout = Workout.new(week, bs_1rm, fs_1rm)
    @workout = workout.build
    @days = workout.work_days
    @week = workout.work_week
  end
end
