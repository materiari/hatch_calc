class WeeksController < ApplicationController
  before_filter :check_for_mobile
  def show
    week = (params[:id]).to_i
    bs_1rm = params[:bs_1rm].to_f 
    fs_1rm = params[:fs_1rm].to_f 
    days = params[:days]
    days = case days.to_i
    when 1
      %w{1}
    when 2
      %w{2}
    else
      %w{1 2}
    end
    @workout = WorkoutGenerator.new(week, bs_1rm, fs_1rm)
    @workout.build(days)
    @days = @workout.work_days
    @week = @workout.work_week
    @lifts = {
      :back => 'Back Squat',
      :front => 'Front Squat'
    }
  end
end
