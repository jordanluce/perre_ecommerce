class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authorize

  def current_admin
    @admin ||= Admin.find(session[:current_admin_id]) if session[:current_admin_id]
  end

  def authorize
    unless current_admin
      redirect_to '/admin_login', alert: 'Please login to view admin pages'
    end
  end
end