class WorkoutGenerator
  attr_reader :work_days, :work_week

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
    @workout = {}
    @work_days = days
    days.each do |day|
      bs_day = @bs.where(:day => day.to_i).map {|set| self.back_squat_set(set)}
      fs_day = @fs.where(:day => day.to_i).map {|set| self.front_squat_set(set)}
      @workout[day] = {:front => fs_day, :back => bs_day}
    end
    self
  end

  def combined
    workout = {}
    @work_days.each do |day|
       workout[day] = @workout[day][:back].zip @workout[day][:front]
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
