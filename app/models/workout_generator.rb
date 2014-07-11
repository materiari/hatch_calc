class WorkoutGenerator
  def initialize(week, bs_1rm, fs_1rm)
    bs_1rm > 0.0 or (bs_1rm = 100.0)
    fs_1rm > 0.0 or (fs_1rm = 100.0)

    if(week > 12 and week < 1)
      week = Week.current_week
    end
    @work_week = week
    @bs_1rm = bs_1rm
    @fs_1rm = fs_1rm
    @bs = Workout.by_week(week).back_squat.work.sorted.readonly
    @fs = Workout.by_week(week).front_squat.work.sorted.readonly
  end

  def build(days=%w{1 2})
    workout = {}
    @work_days = days
    days.each do |day|
      bs_day = @bs.where(:day => day.to_i).map {|set| self.back_squat_set(set)}
      fs_day = @fs.where(:day => day.to_i).map {|set| self.front_squat_set(set)}
      workout[day] = bs_day.zip fs_day  
    end
    workout
  end

  def back_squat_set(set)
    WorkingSet.new(set, @bs_1rm);
  end
  def front_squat_set(set)
    WorkingSet.new(set, @fs_1rm);
  end
end
