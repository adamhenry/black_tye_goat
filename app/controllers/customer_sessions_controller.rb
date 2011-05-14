class CustomerSessionsController < ApplicationController
  def new
    @customer_session = CustomerSession.new
  end

  def create
    @customer_session = CustomerSession.new(params[:customer_session])
    if @customer_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to customer_url(:current)
    else
      render :action => 'new', :controller => 'customer_session'
    end
  end

  def destroy
    @customer_session = CustomerSession.find
    @customer_session.destory
    flash[:notice] = "Successfully logged out."
    redirect_to '/'
  end
end
