class WorkingSet
  attr_reader :reps, :weight, :percentage
  def initialize(work_set, one_repmax)
    @reps = work_set.reps
    if(work_set.reps.nil? or work_set.percentage.nil? or one_repmax.nil?)
      #shouldn't ever happen
      @percentage = @weight = 0
    end
    @percentage = 100 * work_set.percentage
    @weight = work_set.percentage * one_repmax
  end
end
