# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

(WEEK, DAY, B_REPS, B_PCT, F_REPS, F_PCT,SET)=(0..10).to_a
(WEEK_NUMBER, STARTING, ENDING) = (0..10).to_a

csv_file_path = 'db/hatch_seed_data.csv'

CSV.foreach(csv_file_path) do |row|
  Workout.create!({
      :week => row[WEEK],
      :day => row[DAY],
      :lift => :back_squat,
      :set_number => row[SET],
      :reps => row[B_REPS],
      :percentage => row[B_PCT]
      })
puts "Back squat row added #{row[WEEK]}:#{row[DAY]}:#{row[SET]}."
  Workout.create!({
    :week => row[WEEK],
    :day => row[DAY],
    :lift => :front_squat,
    :set_number => row[SET],
    :reps => row[F_REPS],
    :percentage => row[F_PCT]
    }) if(row[F_REPS] and !row[F_REPS].empty?)
puts "Front squat row added #{row[WEEK]}:#{row[DAY]}:#{row[SET]}."
end

date_file = 'db/hatch_weeks.csv'

CSV.foreach(date_file) do |week|
  Week.create!({
      :week_number => week[WEEK_NUMBER],
      :starting => week[STARTING],
      :ending => week[ENDING]
      }) unless(week[WEEK_NUMBER].empty?)
    puts "Adding work week: #{week[WEEK_NUMBER]}"
end
