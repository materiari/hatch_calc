class HatchController < ApplicationController
  def index
    @current_week = session[:week] || Week.current_week
    @keep = session[:keep] ||= cookies[:keep]

    @bs ||= session[:bs_1rm] ||= cookies[:bs_1rm] 
    @fs ||= session[:fs_1rm] ||= cookies[:fs_1rm]

    @bs  ||= 100.0
    @fs  ||= 100.0
  end

  def about
    @smiley="\u{1F60E}"
  end

  def redirect_to_show
    debugger
    keep = session[:keep] = params[:keep]
    bs_1rm = params[:backsquat_1rm]
    fs_1rm = params[:frontsquat_1rm]
    session[:week]=params[:week]
    session[:bs_1rm]=bs_1rm
    session[:fs_1rm]=fs_1rm
    if keep
      cookies[:bs_1rm]=bs_1rm
      cookies[:fs_1rm]=fs_1rm
    end
    redirect_to week_path(:id => params[:week], 
      :bs_1rm => bs_1rm , :fs_1rm => fs_1rm)
  end

end
