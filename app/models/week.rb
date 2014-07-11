class Week < ActiveRecord::Base
  attr_accessible :ending, :starting, :week_number

  def self.current_week
    current = self.where("starting <= ? and ending > ?", Date.today, Date.today)
    if(current.empty?)
      return 1
    else
      current.first[:week_number]
    end
  end
end
