class HatchController < ApplicationController
  def index
    @current_week = Week.current_week
    @week = @current_week
  end

  def about
    @smiley="\u{1F60E}"
  end

  def redirect_to_show
    redirect_to week_path(:id => params[:week], 
      :bs_1rm => params[:backsquat_1rm], :fs_1rm => params[:frontsquat_1rm])
  end

end
