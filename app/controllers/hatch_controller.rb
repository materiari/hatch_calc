class HatchController < ApplicationController
  before_filter :check_for_mobile, :only => [:index]
  def index
    @current_week = Week.current_week
    @keep = session[:keep] ||= cookies[:keep]

    @bs ||= session[:bs_1rm] ||= cookies[:bs_1rm] 
    @fs ||= session[:fs_1rm] ||= cookies[:fs_1rm]

    @bs  ||= 100.0
    @fs  ||= 100.0

    @default_days = (mobile_device? ? 'Day 1' : 'Both')
  end

  def about
    @smiley="\u{1F60E}"
  end

  def redirect_to_show
    keep = session[:keep] = params[:keep]
    bs_1rm = params[:backsquat_1rm]
    fs_1rm = params[:frontsquat_1rm]
    days = case params[:days]
    when 'Day 1'
      1
    when 'Day 2'
      2
#when 'Both'
    else
      0
    end
#session[:week]=params[:week]
    session[:bs_1rm]=bs_1rm
    session[:fs_1rm]=fs_1rm
    if keep
      cookies[:bs_1rm]=bs_1rm
      cookies[:fs_1rm]=fs_1rm
    end
    redirect_to week_path(:id => params[:week], 
      :bs_1rm => bs_1rm , :fs_1rm => fs_1rm, :days => days)
  end

  def set_layout
    override = params[:mobile]
    if(override.nil? or override.empty? or override == 'auto')
      session.delete(:mobile_override)
    else
      session[:mobile_override] = params[:mobile]
    end
    redirect_to root_path
  end
end
