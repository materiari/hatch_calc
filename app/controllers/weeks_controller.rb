class WeeksController < ApplicationController
  def show
    week = (params[:id] or Week.current_week).to_i
    @bs_1rm = params[:@bs_1rm].to_f 
    @fs_1rm = params[:@fs_1rm].to_f 
    
    @bs_1rm > 0.0 or (@bs_1rm = 100.0)
    @fs_1rm > 0.0 or (@fs_1rm = 100.0)

    unless(week <=12 and week >= 1)
      week = Week.current_week
    end

    bs = Workout.by_week(week).back_squat.work.sorted.readonly
    fs = Workout.by_week(week).front_squat.work.sorted.readonly
    @days = [1,2] #TODO: support this filtering at some point
    @workout = {}
    @week = week
    @days.each do |day|
      @workout[day.to_s] = bs.where(:day => day).zip(fs.where(:day => day))  
    end
  end
end
