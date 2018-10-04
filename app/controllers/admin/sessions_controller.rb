class Admin::SessionsController < Admin::BaseController
  before_action :authorize, except: [:new, :create]

  layout 'admin_session'
  def new
  end

  def create
    if admin
      session[:current_admin_id] = admin.id
      redirect_to admin_products_url, notice: 'You have succesffully signed in'
    else
      flash[:alert] = 'There was a problem with your username or password'
      render 'new'
    end
  end

  def destroy
    session[:current_admin_id] = nil
    redirect_to '/admin_login', notice: 'You have succesffully signed out'
  end

  private

  def admin
    @admin ||= Admin.find_by(email: params[:email]).try(:authenticate, params[:password])
  end
end