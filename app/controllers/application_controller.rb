class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_customer, :admin?

  private

  def admin?
    false
  end

  def current_customer_session
    return @current_customer_session if defined?(@current_customer_session)
    @current_customer_session = CustomerSession.find
  end

  def current_customer
    return @current_customer if defined?(@current_customer)
    @current_customer = current_customer_session && current_customer_session.record
  end
end
