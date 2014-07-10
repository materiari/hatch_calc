class Workout < ActiveRecord::Base
  attr_accessible :day, :lift, :percentage, :reps, :week, :set_number

  scope :first_day, where(:day => 1)
  scope :second_day, where(:day => 2)
  scope :by_week, lambda {|week| where(:week => week) unless week.nil?}
  scope :sorted, order(:day => :asc, :set_number => :asc)
  scope :back_squat, where(:lift => :back_squat)
  scope :front_squat, where(:lift => :front_squat)
  scope :days, select(:day).uniq
  scope :work, select([:reps, :percentage])
end
