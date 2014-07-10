class Workout < ActiveRecord::Base
  attr_accessible :day, :lift, :percentage, :reps, :week, :set_number

  attr_reader :work_days, :work_week

  scope :first_day, where(:day => 1)
  scope :second_day, where(:day => 2)
  scope :by_week, lambda {|week| where(:week => week) unless week.nil?}
  scope :sorted, order(:day => :asc, :set_number => :asc)
  scope :back_squat, where(:lift => :back_squat)
  scope :front_squat, where(:lift => :front_squat)
  scope :days, select(:day).uniq
  scope :work, select([:reps, :percentage])

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
